import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mobile_app/core/theme/app_tokens.dart';
import 'package:mobile_app/core/widgets/fairytale_background.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: FairytaleBackground(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.xl),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.8),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFF0B328).withValues(alpha: 0.4),
                            blurRadius: 30,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.auto_awesome_rounded,
                          size: 50,
                          color: Color(0xFFF0B328),
                        ),
                      ),
                    )
                    .animate(onPlay: (c) => c.repeat(reverse: true))
                    .scale(begin: const Offset(0.9, 0.9), end: const Offset(1.1, 1.1), duration: 2.seconds, curve: Curves.easeInOutSine),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  'LearnHub',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: const Color(0xFF5D4830),
                    shadows: [
                      const Shadow(
                        color: Colors.white,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                ).animate().fadeIn(duration: 800.ms, delay: 300.ms).slideY(begin: 0.2, end: 0, duration: 800.ms, curve: Curves.easeOut),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  'Preparing your magical journey...',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF9E8D76),
                  ),
                ).animate().fadeIn(duration: 800.ms, delay: 600.ms),
                const SizedBox(height: AppSpacing.xxl),
                const SizedBox(
                  width: 32,
                  height: 32,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Color(0xFFF0B328),
                    backgroundColor: Colors.transparent,
                  ),
                ).animate().fadeIn(duration: 800.ms, delay: 900.ms),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

