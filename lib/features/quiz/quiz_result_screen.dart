import 'package:flutter/material.dart';
import 'package:mobile_app/core/models/app_models.dart';
import 'package:mobile_app/core/theme/app_theme.dart';
import 'package:mobile_app/core/theme/app_tokens.dart';
import 'package:mobile_app/core/widgets/app_components.dart';
import 'package:mobile_app/core/widgets/fairytale_background.dart';
import 'package:mobile_app/features/quiz/quiz_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_app/features/ai_insights/presentation/providers/ai_insights_providers.dart';
import 'package:mobile_app/features/ai_insights/presentation/widgets/ai_quiz_feedback_card.dart';

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
          backgroundColor: const Color(0xFFFFFDF8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: const BorderSide(color: Color(0xFFFDECB5)),
          ),
          title: const Text('Magical Relic Discovered!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: Color(0xFFFFEEBC),
                  shape: BoxShape.circle,
                ),
                child: Icon(badge.icon, size: 44, color: const Color(0xFFD18E15)),
              ),
              const SizedBox(height: 16),
              Text(badge.title, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Text(badge.description, textAlign: TextAlign.center),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Marvelous'),
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

    return FairytaleBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Trial Results'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
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
                  outcome.isPassed ? 'A Triumph of Wisdom!' : 'The Lore Demands More Study.',
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
                      ? 'You have proven your mastery. Carry this wisdom forward.'
                      : 'Consult the ancient texts and face the trial again.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          const SectionHeader(
            title: 'Enigma Reflections',
            subtitle: 'Review your mastery of the realm.',
          ),
          const SizedBox(height: AppSpacing.sm),
          _AiQuizFeedbackList(
            quizId: outcome.topic.id,
            answers: outcome.answers,
          ),
          const SizedBox(height: AppSpacing.sm),
          AppPrimaryButton(
            label: outcome.isPassed ? 'Continue Journey' : 'Face Trial Again',
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
            label: 'Return to Lore',
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
      ),
    );
  }
}

class _AiQuizFeedbackList extends ConsumerWidget {
  const _AiQuizFeedbackList({
    required this.quizId,
    required this.answers,
  });

  final String quizId;
  final Map<String, int> answers;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final params = QuizFeedbackParams(quizId: quizId, answers: answers);
    final feedbackAsync = ref.watch(aiQuizFeedbackProvider(params));

    return feedbackAsync.when(
      data: (feedbacks) {
        return Column(
          children: feedbacks.map((feedback) {
            return Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: AiQuizFeedbackCard(feedback: feedback),
            );
          }).toList(),
        );
      },
      loading: () => const Padding(
        padding: EdgeInsets.symmetric(vertical: 32),
        child: Center(child: CircularProgressIndicator(color: Color(0xFFD18E15))),
      ),
      error: (error, stack) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: Column(
            children: [
              const Icon(Icons.error_outline_rounded, color: Color(0xFFD18E15), size: 32),
              const SizedBox(height: 8),
              Text(
                'The Oracle could not analyze your trial at this time.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: const Color(0xFF8B7E6A)),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => ref.refresh(aiQuizFeedbackProvider(params)),
                child: const Text('Try Again', style: TextStyle(color: Color(0xFFB07100))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

