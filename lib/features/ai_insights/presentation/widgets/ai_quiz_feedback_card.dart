import 'package:flutter/material.dart';
import 'package:mobile_app/features/ai_insights/data/models/ai_quiz_feedback.dart';
import 'package:mobile_app/features/ai_insights/presentation/widgets/glowing_ai_container.dart';

class AiQuizFeedbackCard extends StatelessWidget {
  const AiQuizFeedbackCard({super.key, required this.feedback});

  final AiQuizFeedback feedback;

  @override
  Widget build(BuildContext context) {
    return GlowingAiContainer(
      isCorrect: feedback.isCorrect,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: feedback.isCorrect
                      ? const Color(0xFFE8F5E9)
                      : const Color(0xFFFFEBEE),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  feedback.isCorrect ? Icons.check_rounded : Icons.close_rounded,
                  color: feedback.isCorrect ? const Color(0xFF4CAF50) : const Color(0xFFE53935),
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  feedback.questionText,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF4A3C2A),
                    height: 1.3,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _AnswerRow(
            label: 'Your Answer',
            answer: feedback.selectedAnswer,
            isCorrect: feedback.isCorrect,
          ),
          if (!feedback.isCorrect) ...[
            const SizedBox(height: 12),
            _AnswerRow(
              label: 'Correct Answer',
              answer: feedback.correctAnswer,
              isCorrect: true,
            ),
          ],
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(color: Color(0xFFE7DECD), height: 1),
          ),
          Row(
            children: [
              const Icon(Icons.auto_awesome_rounded, color: Color(0xFFD18E15), size: 16),
              const SizedBox(width: 8),
              Text(
                'AI Explanation',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: const Color(0xFFD18E15),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            feedback.explanation,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: const Color(0xFF6B5C4A),
              height: 1.5,
            ),
          ),
          if (feedback.improvementTip != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF3CD).withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFFFE082).withValues(alpha: 0.5)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.lightbulb_outline_rounded, size: 18, color: Color(0xFFB07100)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      feedback.improvementTip!,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: const Color(0xFF8B7E6A),
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: feedback.conceptTags.map((tag) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFFDECB5)),
                ),
                child: Text(
                  tag,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: const Color(0xFF8B7E6A),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _AnswerRow extends StatelessWidget {
  const _AnswerRow({
    required this.label,
    required this.answer,
    required this.isCorrect,
  });

  final String label;
  final String answer;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isCorrect
            ? const Color(0xFFE8F5E9).withValues(alpha: 0.5)
            : const Color(0xFFFFEBEE).withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isCorrect ? const Color(0xFFC8E6C9) : const Color(0xFFFFCDD2),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: isCorrect ? const Color(0xFF388E3C) : const Color(0xFFD32F2F),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  answer,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF4A3C2A),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
