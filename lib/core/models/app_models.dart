import 'package:flutter/material.dart';

enum TopicCategory { all, design, development, business, data }

extension TopicCategoryX on TopicCategory {
  String get label => switch (this) {
    TopicCategory.all => 'All',
    TopicCategory.design => 'Design',
    TopicCategory.development => 'Development',
    TopicCategory.business => 'Business',
    TopicCategory.data => 'Data',
  };
}

enum ThemePreference { system, light, dark }

class AppUser {
  const AppUser({
    required this.fullName,
    required this.email,
    required this.role,
  });

  final String fullName;
  final String email;
  final String role;

  String get initials {
    final parts = fullName.split(' ').where((part) => part.isNotEmpty).toList();
    if (parts.isEmpty) return 'U';
    if (parts.length == 1) return parts.first[0].toUpperCase();
    return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
  }
}

class Lesson {
  const Lesson({
    required this.id,
    required this.title,
    required this.summary,
    required this.content,
    required this.minutes,
    required this.order,
  });

  final String id;
  final String title;
  final String summary;
  final String content;
  final int minutes;
  final int order;
}

class QuizQuestion {
  const QuizQuestion({
    required this.id,
    required this.prompt,
    required this.options,
    required this.correctIndex,
    required this.feedback,
  });

  final String id;
  final String prompt;
  final List<String> options;
  final int correctIndex;
  final String feedback;
}

class Topic {
  const Topic({
    required this.id,
    required this.title,
    required this.description,
    required this.shortDescription,
    required this.category,
    required this.order,
    required this.lessons,
    required this.quizQuestions,
  });

  final String id;
  final String title;
  final String description;
  final String shortDescription;
  final TopicCategory category;
  final int order;
  final List<Lesson> lessons;
  final List<QuizQuestion> quizQuestions;
}

class AchievementDefinition {
  const AchievementDefinition({
    required this.id,
    required this.title,
    required this.description,
    required this.unlockHint,
    required this.icon,
  });

  final String id;
  final String title;
  final String description;
  final String unlockHint;
  final IconData icon;
}

class AchievementStatus {
  const AchievementStatus({required this.definition, required this.earnedAt});

  final AchievementDefinition definition;
  final DateTime? earnedAt;

  bool get isUnlocked => earnedAt != null;
}

class QuizOutcome {
  const QuizOutcome({
    required this.topic,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.answers,
    required this.newlyUnlocked,
  });

  final Topic topic;
  final int correctAnswers;
  final int totalQuestions;
  final Map<String, int> answers;
  final List<AchievementDefinition> newlyUnlocked;

  bool get isPassed => scorePercent >= 0.6;

  double get scorePercent {
    if (totalQuestions == 0) return 0;
    return correctAnswers / totalQuestions;
  }
}
