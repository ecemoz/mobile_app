import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mobile_app/core/models/app_models.dart';
import 'package:mobile_app/core/theme/app_tokens.dart';
import 'package:mobile_app/core/widgets/app_components.dart';

class JourneyStopNode extends StatelessWidget {
  const JourneyStopNode({
    super.key,
    required this.topic,
    required this.progressPercent,
    required this.completedLessons,
    required this.totalLessons,
    this.isActive = false,
    this.isStrongest = false,
    this.onContinue,
  });

  final Topic topic;
  final double progressPercent;
  final int completedLessons;
  final int totalLessons;
  final bool isActive;
  final bool isStrongest;
  final VoidCallback? onContinue;

  String get _masteryStatus {
    if (progressPercent == 0) return 'Undiscovered';
    if (progressPercent < 0.5) return 'Awakening';
    if (progressPercent < 1.0) return 'Growing Power';
    return 'Mastered';
  }

  Color get _masteryColor {
    if (progressPercent == 0) return const Color(0xFF9E9E9E);
    if (progressPercent < 0.5) return const Color(0xFF64B5F6);
    if (progressPercent < 1.0) return const Color(0xFF81C784);
    return const Color(0xFFF0B328);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        // Outer glow if active
        if (isActive)
          Positioned.fill(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: AppRadii.lg,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFFD54F).withValues(alpha: 0.3),
                    blurRadius: 30,
                    spreadRadius: 4,
                  ),
                ],
              ),
            ).animate(onPlay: (c) => c.repeat(reverse: true))
             .fade(begin: 0.5, end: 1.0, duration: 2.seconds),
          ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            decoration: BoxDecoration(
              color: isActive ? const Color(0xFFFFFDF8) : Colors.white.withValues(alpha: 0.8),
              borderRadius: AppRadii.lg,
              border: Border.all(
                color: isActive ? const Color(0xFFFFE082) : Colors.white,
                width: isActive ? 2 : 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFE5D5BA).withValues(alpha: 0.3),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _RealmIcon(iconKey: topic.iconKey, isActive: isActive, color: topicColorFromHex(topic.categoryColorHex)),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    topic.title,
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF4A3C2A),
                                    ),
                                  ),
                                ),
                                if (isStrongest)
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFFF3CD),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: const Color(0xFFFFE082)),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.stars_rounded, size: 14, color: Color(0xFFD18E15)),
                                        const SizedBox(width: 4),
                                        Text(
                                          'Strongest',
                                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                            color: const Color(0xFFB07100),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _masteryStatus,
                              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                color: _masteryColor,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Progress',
                                  style: Theme.of(context).textTheme.labelSmall?.copyWith(color: const Color(0xFF8B7E6A)),
                                ),
                                Text(
                                  '${(progressPercent * 100).round()}%',
                                  style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold, color: const Color(0xFF4A3C2A)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            ClipRRect(
                              borderRadius: AppRadii.pill,
                              child: LinearProgressIndicator(
                                value: progressPercent,
                                minHeight: 8,
                                backgroundColor: const Color(0xFFF5E6C8),
                                color: _masteryColor,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '$completedLessons of $totalLessons chapters inscribed',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: const Color(0xFF8B7E6A)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (isActive) ...[
                    const SizedBox(height: 20),
                    AppPrimaryButton(
                      label: 'Continue Journey',
                      icon: Icons.explore_rounded,
                      onPressed: onContinue,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _RealmIcon extends StatelessWidget {
  const _RealmIcon({required this.iconKey, required this.isActive, required this.color});

  final String iconKey;
  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        shape: BoxShape.circle,
        border: Border.all(color: color.withValues(alpha: 0.5), width: 2),
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: color.withValues(alpha: 0.4),
                  blurRadius: 12,
                  spreadRadius: 2,
                )
              ]
            : null,
      ),
      child: Center(
        child: Icon(
          topicIconFromKey(iconKey),
          color: color,
          size: 28,
        ),
      ),
    );
  }
}
