import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FairytaleBackground extends StatelessWidget {
  const FairytaleBackground({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Base Magical Gradient
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFBE4B3), // Soft gold at top
                  Color(0xFFFDF0D0),
                  Color(0xFFFFF9EC), // Warm cream at bottom
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        
        // Large Glowing Orbs
        Positioned(
          top: -100,
          right: -50,
          child: _GlowOrb(size: 400, color: const Color(0xFFFFD54F).withValues(alpha: 0.25)),
        ).animate(onPlay: (c) => c.repeat(reverse: true)).scale(begin: const Offset(0.9, 0.9), end: const Offset(1.1, 1.1), duration: 6.seconds, curve: Curves.easeInOutSine),
        
        Positioned(
          bottom: 100,
          left: -150,
          child: _GlowOrb(size: 350, color: const Color(0xFFFFCC80).withValues(alpha: 0.15)),
        ).animate(onPlay: (c) => c.repeat(reverse: true)).fade(begin: 0.4, end: 1.0, duration: 4.seconds),

        // Twinkling Stars Layer
        const Positioned.fill(child: _StarField(count: 35)),

        // Soft Fog/Clouds at the bottom
        Positioned(
          bottom: -50,
          left: -50,
          right: -50,
          height: 300,
          child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(0, 0.8),
                radius: 1.5,
                colors: [
                  const Color(0xFFFFF9EC).withValues(alpha: 0.9),
                  const Color(0xFFFFF9EC).withValues(alpha: 0.0),
                ],
              ),
            ),
          ),
        ),

        // The actual app content over the background
        Positioned.fill(child: child),
      ],
    );
  }
}

class _GlowOrb extends StatelessWidget {
  const _GlowOrb({required this.size, required this.color});
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color, color.withValues(alpha: 0)],
        ),
      ),
    );
  }
}

class _StarField extends StatelessWidget {
  const _StarField({required this.count});
  final int count;

  @override
  Widget build(BuildContext context) {
    final random = Random(42); // Fixed seed for consistent layout across rebuilds
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth == 0) return const SizedBox.shrink();
        
        return Stack(
          children: List.generate(count, (index) {
            final x = random.nextDouble() * constraints.maxWidth;
            final y = random.nextDouble() * constraints.maxHeight;
            final size = random.nextDouble() * 5 + 3; // 3 to 8 pixels
            final duration = random.nextInt(2000) + 2000; // 2s to 4s
            final delay = random.nextInt(2000);

            return Positioned(
              left: x,
              top: y,
              child: Icon(
                Icons.star_rounded,
                color: const Color(0xFFFFF7E0).withValues(alpha: 0.8),
                size: size,
              ).animate(onPlay: (c) => c.repeat(reverse: true))
               .fade(begin: 0.1, end: 0.9, duration: duration.ms, delay: delay.ms)
               .scale(begin: const Offset(0.7, 0.7), end: const Offset(1.3, 1.3), duration: duration.ms, delay: delay.ms),
            );
          }),
        );
      },
    );
  }
}
