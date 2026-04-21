import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_app/core/data/mock_repository.dart';
import 'package:mobile_app/core/models/app_models.dart';

enum AppStage { splash, onboarding, auth, main }

class AppState extends ChangeNotifier {
  AppState() {
    unawaited(_runStartup());
  }

  bool _splashDone = false;
  bool _hasSeenOnboarding = false;
  AppUser? _currentUser;
  bool _notificationsEnabled = true;
  ThemePreference _themePreference = ThemePreference.system;

  final Set<String> _completedLessonIds = <String>{};
  final Map<String, int> _quizScores = <String, int>{};
  final Map<String, DateTime> _achievementUnlockedAt = <String, DateTime>{};

  Future<void> _runStartup() async {
    await Future<void>.delayed(const Duration(milliseconds: 1900));
    _splashDone = true;
    notifyListeners();
  }

  AppStage get stage {
    if (!_splashDone) return AppStage.splash;
    if (!_hasSeenOnboarding) return AppStage.onboarding;
    if (_currentUser == null) return AppStage.auth;
    return AppStage.main;
  }

  List<Topic> get topics {
    final sorted = [...MockRepository.topics];
    sorted.sort((a, b) => a.order.compareTo(b.order));
    return sorted;
  }

  List<AchievementStatus> get achievements {
    final list = MockRepository.achievementDefinitions
        .map(
          (definition) => AchievementStatus(
            definition: definition,
            earnedAt: _achievementUnlockedAt[definition.id],
          ),
        )
        .toList();

    list.sort((a, b) {
      if (a.isUnlocked && !b.isUnlocked) return -1;
      if (!a.isUnlocked && b.isUnlocked) return 1;
      final aTime = a.earnedAt;
      final bTime = b.earnedAt;
      if (aTime == null || bTime == null) return 0;
      return bTime.compareTo(aTime);
    });
    return list;
  }

  AppUser? get currentUser => _currentUser;
  bool get notificationsEnabled => _notificationsEnabled;
  ThemePreference get themePreference => _themePreference;

  ThemeMode get themeMode => switch (_themePreference) {
    ThemePreference.system => ThemeMode.system,
    ThemePreference.light => ThemeMode.light,
    ThemePreference.dark => ThemeMode.dark,
  };

  int get completedLessonsCount => _completedLessonIds.length;
  int get unlockedAchievementsCount =>
      achievements.where((item) => item.isUnlocked).length;

  double get overallProgress {
    final totalLessons = topics.fold<int>(
      0,
      (sum, topic) => sum + topic.lessons.length,
    );
    if (totalLessons == 0) return 0;
    return _completedLessonIds.length / totalLessons;
  }

  int get totalQuizzesTaken => _quizScores.length;

  double get averageQuizScore {
    if (_quizScores.isEmpty) return 0;
    final total = _quizScores.values.fold<int>(0, (sum, score) => sum + score);
    final totalQuestions = topics
        .where((topic) => _quizScores.containsKey(topic.id))
        .fold<int>(0, (sum, topic) => sum + topic.quizQuestions.length);
    if (totalQuestions == 0) return 0;
    return total / totalQuestions;
  }

  List<Topic> filteredTopics({
    required TopicCategory category,
    required String query,
  }) {
    final normalizedQuery = query.trim().toLowerCase();
    return topics.where((topic) {
      final categoryMatch =
          category == TopicCategory.all || topic.category == category;
      final queryMatch =
          normalizedQuery.isEmpty ||
          topic.title.toLowerCase().contains(normalizedQuery) ||
          topic.shortDescription.toLowerCase().contains(normalizedQuery);
      return categoryMatch && queryMatch;
    }).toList();
  }

  int completedLessonsForTopic(Topic topic) {
    return topic.lessons
        .where((lesson) => _completedLessonIds.contains(lesson.id))
        .length;
  }

  double topicProgress(Topic topic) {
    if (topic.lessons.isEmpty) return 0;
    return completedLessonsForTopic(topic) / topic.lessons.length;
  }

  bool isLessonCompleted(Lesson lesson) {
    return _completedLessonIds.contains(lesson.id);
  }

  bool isLessonUnlocked(Topic topic, Lesson lesson) {
    if (lesson.order <= 1) return true;

    final previous = topic.lessons.where(
      (item) => item.order == lesson.order - 1,
    );
    if (previous.isEmpty) return true;
    return _completedLessonIds.contains(previous.first.id);
  }

  Lesson? nextIncompleteLesson(Topic topic) {
    final sorted = [...topic.lessons]
      ..sort((a, b) => a.order.compareTo(b.order));
    for (final lesson in sorted) {
      if (!isLessonCompleted(lesson) && isLessonUnlocked(topic, lesson)) {
        return lesson;
      }
    }
    return null;
  }

  bool canStartQuiz(Topic topic) => topicProgress(topic) >= 1;

  void completeOnboarding() {
    _hasSeenOnboarding = true;
    notifyListeners();
  }

  void signIn({
    required String email,
    required String password,
    required bool rememberMe,
  }) {
    final suggestedName = _nameFromEmail(email);
    _hasSeenOnboarding = true;
    _currentUser = AppUser(
      fullName: suggestedName,
      email: email.trim(),
      role: 'Student',
    );
    notifyListeners();
  }

  void register({
    required String fullName,
    required String email,
    required String password,
  }) {
    _hasSeenOnboarding = true;
    _currentUser = AppUser(
      fullName: fullName.trim(),
      email: email.trim(),
      role: 'Student',
    );
    notifyListeners();
  }

  void signOut() {
    _currentUser = null;
    notifyListeners();
  }

  List<AchievementDefinition> markLessonCompleted({
    required Topic topic,
    required Lesson lesson,
  }) {
    if (_completedLessonIds.contains(lesson.id)) return const [];

    _completedLessonIds.add(lesson.id);
    final unlocked = _evaluateAchievements(topic: topic, completedQuiz: false);
    notifyListeners();
    return unlocked;
  }

  QuizOutcome submitQuiz({
    required Topic topic,
    required Map<String, int> answers,
  }) {
    var correctAnswers = 0;
    for (final question in topic.quizQuestions) {
      final selected = answers[question.id];
      if (selected == question.correctIndex) {
        correctAnswers += 1;
      }
    }

    _quizScores[topic.id] = correctAnswers;
    final unlocked = _evaluateAchievements(
      topic: topic,
      completedQuiz: true,
      correctAnswers: correctAnswers,
      totalQuestions: topic.quizQuestions.length,
    );

    notifyListeners();
    return QuizOutcome(
      topic: topic,
      correctAnswers: correctAnswers,
      totalQuestions: topic.quizQuestions.length,
      answers: answers,
      newlyUnlocked: unlocked,
    );
  }

  int? bestQuizScoreForTopic(String topicId) => _quizScores[topicId];

  void setNotificationsEnabled(bool value) {
    _notificationsEnabled = value;
    notifyListeners();
  }

  void setThemePreference(ThemePreference preference) {
    _themePreference = preference;
    notifyListeners();
  }

  void resetLearningProgress() {
    _completedLessonIds.clear();
    _quizScores.clear();
    _achievementUnlockedAt.clear();
    notifyListeners();
  }

  List<AchievementDefinition> _evaluateAchievements({
    required Topic topic,
    required bool completedQuiz,
    int? correctAnswers,
    int? totalQuestions,
  }) {
    final unlocked = <AchievementDefinition>[];
    final isLinuxTopic = topic.category == TopicCategory.linux;
    final hasAnyLinuxLesson = _completedLessonIds.any(
      (id) => id.startsWith('linux-l'),
    );

    if (_completedLessonIds.isNotEmpty) {
      _unlock('first_lesson', unlocked);
    }

    if (completedLessonsForTopic(topic) == topic.lessons.length) {
      _unlock('topic_complete', unlocked);
    }

    if (completedQuiz) {
      _unlock('first_quiz', unlocked);
    }

    if (hasAnyLinuxLesson) {
      _unlock('first_linux_lesson', unlocked);
    }

    if (_completedLessonIds.contains('linux-l1')) {
      _unlock('linux_history_starter', unlocked);
    }

    if (_completedLessonIds.contains('linux-l3')) {
      _unlock('kernel_explorer', unlocked);
    }

    if (_completedLessonIds.contains('linux-l4')) {
      _unlock('process_tracker', unlocked);
    }

    if (_completedLessonIds.contains('linux-l5')) {
      _unlock('scheduler_starter', unlocked);
    }

    if (_completedLessonIds.contains('linux-l6')) {
      _unlock('memory_mapper', unlocked);
    }

    if (_completedLessonIds.contains('linux-l7')) {
      _unlock('file_system_explorer', unlocked);
    }

    if (_completedLessonIds.contains('linux-l8')) {
      _unlock('terminal_thinker', unlocked);
    }

    if (_completedLessonIds.contains('linux-l9')) {
      _unlock('ipc_novice', unlocked);
    }

    if (_completedLessonIds.contains('linux-l10')) {
      _unlock('linux_security_guard', unlocked);
    }

    final linuxTopics = topics
        .where((item) => item.category == TopicCategory.linux)
        .toList();
    final anyLinuxTopicCompleted = linuxTopics.any(
      (item) => topicProgress(item) >= 1,
    );
    if (anyLinuxTopicCompleted) {
      _unlock('linux_topic_complete', unlocked);
    }

    if (completedQuiz && isLinuxTopic) {
      _unlock('first_linux_quiz', unlocked);
    }

    final allLinuxTopicsCompleted =
        linuxTopics.isNotEmpty &&
        linuxTopics.every((item) => topicProgress(item) >= 1);
    final allLinuxQuizzesTaken =
        linuxTopics.isNotEmpty &&
        linuxTopics.every((item) => _quizScores.containsKey(item.id));
    if (allLinuxTopicsCompleted && allLinuxQuizzesTaken) {
      _unlock('linux_path_complete', unlocked);
    }

    if (completedQuiz &&
        correctAnswers != null &&
        totalQuestions != null &&
        totalQuestions > 0 &&
        correctAnswers == totalQuestions) {
      _unlock('perfect_score', unlocked);
    }

    final completedTopics = topics
        .where((item) => topicProgress(item) >= 1)
        .length;
    if (completedTopics >= 3) {
      _unlock('consistent_learner', unlocked);
    }

    if (_achievementUnlockedAt.length >= 4) {
      _unlock('badge_collector', unlocked);
    }

    return unlocked;
  }

  void _unlock(String achievementId, List<AchievementDefinition> unlocked) {
    if (_achievementUnlockedAt.containsKey(achievementId)) return;

    AchievementDefinition? achievement;
    for (final item in MockRepository.achievementDefinitions) {
      if (item.id == achievementId) {
        achievement = item;
        break;
      }
    }
    if (achievement == null) return;

    _achievementUnlockedAt[achievementId] = DateTime.now();
    unlocked.add(achievement);
  }

  String _nameFromEmail(String email) {
    final user = email.split('@').first.trim();
    if (user.isEmpty) return 'Learner';
    final parts = user
        .replaceAll(RegExp(r'[_\-.]+'), ' ')
        .split(' ')
        .where((part) => part.isNotEmpty)
        .toList();
    final normalized = parts
        .map(
          (part) =>
              '${part[0].toUpperCase()}${part.substring(1).toLowerCase()}',
        )
        .join(' ');
    return normalized.isEmpty ? 'Learner' : normalized;
  }
}
