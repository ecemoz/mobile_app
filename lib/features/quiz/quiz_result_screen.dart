import 'package:flutter/material.dart';
import 'package:mobile_app/core/models/app_models.dart';
import 'package:mobile_app/core/theme/app_theme.dart';
import 'package:mobile_app/core/theme/app_tokens.dart';
import 'package:mobile_app/core/widgets/app_components.dart';
import 'package:mobile_app/features/quiz/quiz_screen.dart';

class QuizResultScreen extends StatefulWidget {
  const QuizResultScreen({super.key, required this.outcome});

  final QuizOutcome outcome;

  @override
  State<QuizResultScreen> createState() => _QuizResultScreenState();
}

class _QuizResultScreenState extends State<QuizResultScreen> {
  bool _rewardShown = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_rewardShown || widget.outcome.newlyUnlocked.isEmpty) return;

    _rewardShown = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final badge = widget.outcome.newlyUnlocked.first;
      showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Badge Earned'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(badge.icon, size: 44),
              const SizedBox(height: 12),
              Text(badge.title, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Text(badge.description, textAlign: TextAlign.center),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Awesome'),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final outcome = widget.outcome;
    final percent = (outcome.scorePercent * 100).round();

    return Scaffold(
      appBar: AppBar(title: const Text('Quiz Result')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          SoftSurfaceCard(
            child: Column(
              children: [
                Icon(
                  outcome.isPassed
                      ? Icons.emoji_events_rounded
                      : Icons.sentiment_neutral_rounded,
                  size: 56,
                  color: outcome.isPassed
                      ? AppColors.primaryStrong
                      : AppColors.ink,
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  outcome.isPassed ? 'Great job!' : 'Keep going!',
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  'You scored ${outcome.correctAnswers}/${outcome.totalQuestions} ($percent%)',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  outcome.isPassed
                      ? 'You passed this quiz. Keep your momentum.'
                      : 'Review the lessons and try again for a better score.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          const SectionHeader(
            title: 'Question Feedback',
            subtitle: 'Check correct and incorrect answers.',
          ),
          const SizedBox(height: AppSpacing.sm),
          ...outcome.topic.quizQuestions.map((question) {
            final selected = outcome.answers[question.id];
            final correct = selected == question.correctIndex;
            return Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: SoftSurfaceCard(
                backgroundColor: correct
                    ? const Color(0xFFEFF9F4)
                    : const Color(0xFFFFF1EF),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      correct
                          ? Icons.check_circle_rounded
                          : Icons.cancel_rounded,
                      color: correct ? AppColors.success : AppColors.error,
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            question.prompt,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(height: AppSpacing.xxs),
                          Text(
                            question.feedback,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
          const SizedBox(height: AppSpacing.sm),
          AppPrimaryButton(
            label: outcome.isPassed ? 'Continue Learning' : 'Retry Quiz',
            icon: outcome.isPassed
                ? Icons.arrow_forward_rounded
                : Icons.refresh_rounded,
            onPressed: () {
              if (outcome.isPassed) {
                Navigator.pop(context);
              } else {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute<void>(
                    builder: (_) => QuizScreen(topic: outcome.topic),
                  ),
                );
              }
            },
          ),
          const SizedBox(height: AppSpacing.sm),
          AppSecondaryButton(
            label: 'Back to Topic',
            icon: Icons.arrow_back_rounded,
            onPressed: () => Navigator.pop(context),
          ),
          if (outcome.newlyUnlocked.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.md),
            SoftSurfaceCard(
              backgroundColor: const Color(0xFFFFF3CD),
              child: Row(
                children: [
                  const Icon(Icons.workspace_premium_rounded),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Text(
                      'New badge: ${outcome.newlyUnlocked.first.title}',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
