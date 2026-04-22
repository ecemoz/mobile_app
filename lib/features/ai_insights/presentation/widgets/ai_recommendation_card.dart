import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_app/features/ai_insights/presentation/providers/ai_insights_providers.dart';
import 'package:mobile_app/features/ai_insights/presentation/widgets/glowing_ai_container.dart';

class AiRecommendationCard extends ConsumerWidget {
  const AiRecommendationCard({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recommendationAsync = ref.watch(aiRecommendationProvider(userId));

    return recommendationAsync.when(
      data: (recommendation) {
        return GlowingAiContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.auto_awesome_rounded, color: Color(0xFFD18E15), size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'AI Recommendation',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: const Color(0xFFD18E15),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF3CD),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      recommendation.difficulty,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: const Color(0xFFB07100),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                recommendation.title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF4A3C2A),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                recommendation.reason,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF6B5C4A),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFFDECB5)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.library_books_rounded, size: 16, color: Color(0xFFB07100)),
                        const SizedBox(width: 6),
                        Text(
                          '${recommendation.estimatedLessonCount} lessons',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: const Color(0xFF8B7E6A),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      // Action to start the topic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD18E15),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(recommendation.ctaLabel, style: const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(width: 8),
                        const Icon(Icons.arrow_forward_rounded, size: 18),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      loading: () => const _AiRecommendationShimmer(),
      error: (error, stack) => _AiRecommendationError(
        onRetry: () => ref.refresh(aiRecommendationProvider(userId)),
      ),
    );
  }
}

class _AiRecommendationShimmer extends StatelessWidget {
  const _AiRecommendationShimmer();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFFDECB5), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(width: 24, height: 24, decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFF5E6C8))),
              const SizedBox(width: 8),
              Container(width: 120, height: 16, decoration: BoxDecoration(color: const Color(0xFFF5E6C8), borderRadius: BorderRadius.circular(8))),
            ],
          ),
          const SizedBox(height: 16),
          Container(width: 200, height: 24, decoration: BoxDecoration(color: const Color(0xFFF5E6C8), borderRadius: BorderRadius.circular(8))),
          const SizedBox(height: 8),
          Container(width: double.infinity, height: 14, decoration: BoxDecoration(color: const Color(0xFFF5E6C8), borderRadius: BorderRadius.circular(8))),
          const SizedBox(height: 4),
          Container(width: 150, height: 14, decoration: BoxDecoration(color: const Color(0xFFF5E6C8), borderRadius: BorderRadius.circular(8))),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(width: 80, height: 28, decoration: BoxDecoration(color: const Color(0xFFF5E6C8), borderRadius: BorderRadius.circular(8))),
              Container(width: 120, height: 40, decoration: BoxDecoration(color: const Color(0xFFF5E6C8), borderRadius: BorderRadius.circular(16))),
            ],
          ),
        ],
      ),
    );
  }
}

class _AiRecommendationError extends StatelessWidget {
  const _AiRecommendationError({required this.onRetry});
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFDF8),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFFDECB5), width: 1.5),
      ),
      child: Column(
        children: [
          const Icon(Icons.error_outline_rounded, color: Color(0xFFD18E15), size: 32),
          const SizedBox(height: 8),
          Text(
            'The Oracle is currently resting.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: const Color(0xFF8B7E6A)),
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: onRetry,
            child: const Text('Consult Again', style: TextStyle(color: Color(0xFFB07100))),
          ),
        ],
      ),
    );
  }
}
