import 'package:flutter/material.dart';
import 'package:mobile_app/core/state/app_state.dart';
import 'package:mobile_app/core/theme/app_tokens.dart';
import 'package:mobile_app/core/widgets/app_components.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _index = 0;

  static const _slides = [
    (
      title: 'Learn at your pace',
      subtitle:
          'Short lessons designed for focused progress, even on busy days.',
      icon: Icons.auto_stories_rounded,
    ),
    (
      title: 'Track your growth',
      subtitle: 'Visual dashboards make your progress clear and motivating.',
      icon: Icons.insights_rounded,
    ),
    (
      title: 'Quiz and earn badges',
      subtitle: 'Test your understanding and unlock achievement rewards.',
      icon: Icons.emoji_events_rounded,
    ),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: _slides.length,
                  onPageChanged: (value) => setState(() => _index = value),
                  itemBuilder: (context, index) {
                    final slide = _slides[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IllustrationPanel(
                          title: slide.title,
                          subtitle: slide.subtitle,
                          icon: slide.icon,
                          height: 220,
                        ),
                        const SizedBox(height: AppSpacing.xl),
                        Text(
                          slide.title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        Text(
                          slide.subtitle,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    );
                  },
                ),
              ),
              SmoothPageIndicator(
                controller: _controller,
                count: _slides.length,
                effect: const ExpandingDotsEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  activeDotColor: Color(0xFFE0A92A),
                  dotColor: Color(0xFFDCCFAF),
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              AppPrimaryButton(
                label: _index == _slides.length - 1 ? 'Get Started' : 'Next',
                icon: Icons.arrow_forward_rounded,
                onPressed: () {
                  if (_index == _slides.length - 1) {
                    context.read<AppState>().completeOnboarding();
                    return;
                  }
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
              ),
              const SizedBox(height: AppSpacing.sm),
              AppSecondaryButton(
                label: 'Sign In',
                onPressed: () {
                  context.read<AppState>().completeOnboarding();
                },
                icon: Icons.login_rounded,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
