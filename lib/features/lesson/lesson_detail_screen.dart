import 'package:flutter/material.dart';
import 'package:mobile_app/core/models/app_models.dart';
import 'package:mobile_app/core/state/app_state.dart';
import 'package:mobile_app/core/theme/app_tokens.dart';
import 'package:mobile_app/core/widgets/app_components.dart';
import 'package:mobile_app/features/quiz/quiz_screen.dart';
import 'package:provider/provider.dart';

class LessonDetailScreen extends StatefulWidget {
  const LessonDetailScreen({
    super.key,
    required this.topic,
    required this.lesson,
  });

  final Topic topic;
  final Lesson lesson;

  @override
  State<LessonDetailScreen> createState() => _LessonDetailScreenState();
}

class _LessonDetailScreenState extends State<LessonDetailScreen> {
  bool _showSuccess = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, _) {
        final topic = widget.topic;
        final lesson = widget.lesson;
        final isCompleted = appState.isLessonCompleted(lesson);
        final progress = appState.topicProgress(topic);
        final nextLesson = appState.nextIncompleteLesson(topic);

        return Scaffold(
          appBar: AppBar(title: Text(lesson.title)),
          body: ListView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            children: [
              Text(
                'Lesson ${lesson.order} of ${topic.lessons.length}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: AppSpacing.xs),
              LinearProgressIndicator(
                value: progress,
                borderRadius: AppRadii.pill,
              ),
              const SizedBox(height: AppSpacing.lg),
              SoftSurfaceCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lesson.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      '${lesson.minutes} min read',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      lesson.content,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              if (_showSuccess)
                SoftSurfaceCard(
                  backgroundColor: const Color(0xFFEFF9F4),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.check_circle_rounded,
                        color: Color(0xFF2CA56E),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: Text(
                          'Great work! Lesson marked as completed.',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              if (_showSuccess) const SizedBox(height: AppSpacing.md),
              AppPrimaryButton(
                label: isCompleted ? 'Lesson Completed' : 'Mark as Completed',
                icon: isCompleted
                    ? Icons.check_circle_rounded
                    : Icons.done_rounded,
                enabled: !isCompleted,
                onPressed: () {
                  final unlocked = appState.markLessonCompleted(
                    topic: topic,
                    lesson: lesson,
                  );
                  setState(() => _showSuccess = true);

                  if (unlocked.isNotEmpty) {
                    showDialog<void>(
                      context: context,
                      builder: (context) {
                        final badge = unlocked.first;
                        return AlertDialog(
                          title: const Text('Achievement Unlocked'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(badge.icon, size: 42),
                              const SizedBox(height: 12),
                              Text(
                                badge.title,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                badge.description,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Nice!'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
              const SizedBox(height: AppSpacing.sm),
              if (nextLesson != null && nextLesson.id != lesson.id)
                AppSecondaryButton(
                  label: 'Next Lesson Suggestion',
                  icon: Icons.arrow_forward_rounded,
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute<void>(
                        builder: (_) => LessonDetailScreen(
                          topic: topic,
                          lesson: nextLesson,
                        ),
                      ),
                    );
                  },
                ),
              if (nextLesson == null ||
                  (nextLesson.id == lesson.id && isCompleted))
                AppSecondaryButton(
                  label: appState.canStartQuiz(topic)
                      ? 'Topic Complete, Start Quiz'
                      : 'Return to Topic',
                  icon: appState.canStartQuiz(topic)
                      ? Icons.quiz_rounded
                      : Icons.arrow_back_rounded,
                  onPressed: () {
                    if (appState.canStartQuiz(topic)) {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => QuizScreen(topic: topic),
                        ),
                      );
                    } else {
                      Navigator.pop(context);
                    }
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
