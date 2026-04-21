import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mobile_app/core/theme/app_theme.dart';
import 'package:mobile_app/core/theme/app_tokens.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFF4CE), Color(0xFFFBF7EE)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -80,
              right: -40,
              child: CircleAvatar(
                radius: 120,
                backgroundColor: AppColors.primary.withValues(alpha: 0.18),
              ),
            ),
            Positioned(
              bottom: -90,
              left: -40,
              child: CircleAvatar(
                radius: 110,
                backgroundColor: AppColors.primary.withValues(alpha: 0.14),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.xl),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                          width: 88,
                          height: 88,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: AppRadii.lg,
                          ),
                          child: const Icon(
                            Icons.school_rounded,
                            size: 44,
                            color: AppColors.ink,
                          ),
                        )
                        .animate()
                        .scale(duration: 500.ms, curve: Curves.easeOutBack)
                        .fadeIn(duration: 450.ms),
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      'LearnHub',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      'Preparing your learning session...',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: AppSpacing.xl),
                    const SizedBox(
                      width: 28,
                      height: 28,
                      child: CircularProgressIndicator(strokeWidth: 2.5),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
