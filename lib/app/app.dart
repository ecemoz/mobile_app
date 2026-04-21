import 'package:flutter/material.dart';
import 'package:mobile_app/core/state/app_state.dart';
import 'package:mobile_app/core/theme/app_theme.dart';
import 'package:mobile_app/features/auth/auth_gate.dart';
import 'package:mobile_app/features/onboarding/onboarding_screen.dart';
import 'package:mobile_app/features/shell/main_shell.dart';
import 'package:mobile_app/features/splash/splash_screen.dart';
import 'package:provider/provider.dart';

class LearnHubApp extends StatelessWidget {
  const LearnHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppState(),
      child: Consumer<AppState>(
        builder: (context, appState, _) => MaterialApp(
          title: 'LearnHub',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          themeMode: appState.themeMode,
          home: const _AppFlow(),
        ),
      ),
    );
  }
}

class _AppFlow extends StatelessWidget {
  const _AppFlow();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, _) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 450),
          switchInCurve: Curves.easeOutCubic,
          switchOutCurve: Curves.easeInCubic,
          child: switch (appState.stage) {
            AppStage.splash => const SplashScreen(key: ValueKey('splash')),
            AppStage.onboarding => const OnboardingScreen(
              key: ValueKey('onboarding'),
            ),
            AppStage.auth => const AuthGate(key: ValueKey('auth')),
            AppStage.main => const MainShell(key: ValueKey('main')),
          },
        );
      },
    );
  }
}
