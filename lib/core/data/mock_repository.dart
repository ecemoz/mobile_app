import 'package:flutter/material.dart';
import 'package:mobile_app/core/data/cybersecurity_seed.dart';
import 'package:mobile_app/core/models/app_models.dart';

class MockRepository {
  static final List<Topic> topics = _buildTopics();

  static final List<AchievementDefinition> achievementDefinitions =
      cybersecurityAchievementsMappingSeed
          .map((raw) {
            final id = raw['id'] as String;
            return AchievementDefinition(
              id: id,
              title: raw['title'] as String,
              description: raw['description'] as String,
              unlockHint: raw['unlock_hint'] as String,
              icon: _achievementIcon(id),
            );
          })
          .toList(growable: false);

  static List<Topic> _buildTopics() {
    final lessonsByTopic = <String, List<Lesson>>{};
    for (final raw in cybersecurityLessonsSeed) {
      final topicId = raw['topic_id'] as String;
      lessonsByTopic
          .putIfAbsent(topicId, () => <Lesson>[])
          .add(
            Lesson(
              id: raw['id'] as String,
              title: raw['title'] as String,
              summary: raw['summary'] as String,
              content: raw['content'] as String,
              minutes: raw['minutes'] as int,
              order: raw['order'] as int,
            ),
          );
    }
    for (final entry in lessonsByTopic.entries) {
      entry.value.sort((a, b) => a.order.compareTo(b.order));
    }

    final quizIdByTopic = <String, String>{
      for (final raw in cybersecurityQuizzesSeed)
        raw['topic_id'] as String: raw['id'] as String,
    };

    final questionsByTopic = <String, List<QuizQuestion>>{};
    for (final raw in cybersecurityQuizQuestionsSeed) {
      final topicId = raw['topic_id'] as String;
      final quizId = raw['quiz_id'] as String;
      if (quizIdByTopic[topicId] != quizId) continue;

      questionsByTopic
          .putIfAbsent(topicId, () => <QuizQuestion>[])
          .add(
            QuizQuestion(
              id: raw['id'] as String,
              prompt: raw['prompt'] as String,
              options: List<String>.from(raw['options'] as List<Object>),
              correctIndex: raw['correct_index'] as int,
              feedback: raw['explanation'] as String,
            ),
          );
    }
    for (final entry in questionsByTopic.entries) {
      final questions = entry.value;
      questions.sort((a, b) {
        final aOrder = _questionOrder(a.id);
        final bOrder = _questionOrder(b.id);
        return aOrder.compareTo(bOrder);
      });
    }

    final mappedTopics = cybersecurityTopicsSeed.map((raw) {
      final topicId = raw['id'] as String;
      return Topic(
        id: topicId,
        title: raw['title'] as String,
        description: raw['description'] as String,
        shortDescription: raw['short_description'] as String,
        category: TopicCategory.cybersecurity,
        difficulty: _parseDifficulty(raw['difficulty'] as String),
        order: raw['order'] as int,
        estimatedLessonCount: raw['estimated_lesson_count'] as int,
        iconKey: raw['icon'] as String,
        illustrationHint: raw['illustration'] as String,
        categoryColorHex: raw['color_tag'] as String,
        lessons: List<Lesson>.unmodifiable(lessonsByTopic[topicId] ?? const []),
        quizQuestions: List<QuizQuestion>.unmodifiable(
          questionsByTopic[topicId] ?? const [],
        ),
      );
    }).toList();

    mappedTopics.sort((a, b) => a.order.compareTo(b.order));
    return List<Topic>.unmodifiable(mappedTopics);
  }

  static TopicDifficulty _parseDifficulty(String raw) {
    switch (raw.toLowerCase()) {
      case 'intermediate':
        return TopicDifficulty.intermediate;
      case 'beginner':
      default:
        return TopicDifficulty.beginner;
    }
  }

  static int _questionOrder(String questionId) {
    final parts = questionId.split('q');
    if (parts.length < 2) return 0;
    return int.tryParse(parts.last) ?? 0;
  }

  static IconData _achievementIcon(String achievementId) {
    switch (achievementId) {
      case 'first_lesson':
        return Icons.flag_rounded;
      case 'topic_complete':
        return Icons.check_circle_rounded;
      case 'first_quiz':
        return Icons.quiz_rounded;
      case 'perfect_score':
        return Icons.workspace_premium_rounded;
      case 'consistent_learner':
        return Icons.local_fire_department_rounded;
      case 'badge_collector':
      default:
        return Icons.military_tech_rounded;
    }
  }
}
