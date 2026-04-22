import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class GlowingAiContainer extends StatelessWidget {
  const GlowingAiContainer({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20.0),
    this.isCorrect,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final bool? isCorrect; // null means neutral glow, true means success glow, false means error/warning glow.

  @override
  Widget build(BuildContext context) {
    Color glowColor1;
    Color glowColor2;
    Color borderColor;

    if (isCorrect == true) {
      glowColor1 = const Color(0xFF81C784).withValues(alpha: 0.3); // Soft green
      glowColor2 = const Color(0xFFA5D6A7).withValues(alpha: 0.1);
      borderColor = const Color(0xFFC8E6C9);
    } else if (isCorrect == false) {
      glowColor1 = const Color(0xFFE57373).withValues(alpha: 0.3); // Soft red
      glowColor2 = const Color(0xFFEF9A9A).withValues(alpha: 0.1);
      borderColor = const Color(0xFFFFCDD2);
    } else {
      glowColor1 = const Color(0xFFFFE082).withValues(alpha: 0.4); // Magical gold
      glowColor2 = const Color(0xFFFFD54F).withValues(alpha: 0.15);
      borderColor = const Color(0xFFFFE082);
    }

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFDF8),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: borderColor, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: glowColor1,
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: glowColor2,
            blurRadius: 40,
            spreadRadius: -5,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Background subtle gradient
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFFFF9EE),
                    Color(0xFFFFFDF8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          // Subtle shimmer element
          Positioned(
            top: -20,
            right: -20,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    glowColor1.withValues(alpha: 0.5),
                    Colors.transparent,
                  ],
                ),
              ),
            ).animate(onPlay: (controller) => controller.repeat(reverse: true))
             .scale(begin: const Offset(0.9, 0.9), end: const Offset(1.1, 1.1), duration: 3.seconds, curve: Curves.easeInOut),
          ),
          Padding(
            padding: padding,
            child: child,
          ),
        ],
      ),
    );
  }
}
