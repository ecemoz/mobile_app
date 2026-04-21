import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mobile_app/core/state/app_state.dart';
import 'package:mobile_app/core/theme/app_theme.dart';
import 'package:mobile_app/core/theme/app_tokens.dart';
import 'package:mobile_app/core/widgets/app_components.dart';
import 'package:mobile_app/core/widgets/fairytale_background.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

enum SunPhase { dawn, morning, noon }

class OnboardingSlide {
  const OnboardingSlide({
    required this.phase,
    required this.teaserTitle,
    required this.teaserSubtitle,
    required this.mainTitle,
    required this.mainDesc,
    required this.icon,
  });

  final SunPhase phase;
  final String teaserTitle;
  final String teaserSubtitle;
  final String mainTitle;
  final String mainDesc;
  final IconData icon;
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _index = 0;

  static const _slides = [
    OnboardingSlide(
      phase: SunPhase.dawn,
      teaserTitle: 'Enter the Realm',
      teaserSubtitle: 'A magical journey into cybersecurity.',
      mainTitle: 'Begin Your Quest',
      mainDesc:
          'Step into the enchanted forest of networks and systems. Build your defenses from the ground up.',
      icon: Icons.shield_rounded,
    ),
    OnboardingSlide(
      phase: SunPhase.morning,
      teaserTitle: 'Gather Wisdom',
      teaserSubtitle: 'Learn spells and ancient Linux secrets.',
      mainTitle: 'Master the Arcane',
      mainDesc:
          'Unlock the secrets of command-line incantations and system architecture through bite-sized lore.',
      icon: Icons.menu_book_rounded,
    ),
    OnboardingSlide(
      phase: SunPhase.noon,
      teaserTitle: 'Prove Your Worth',
      teaserSubtitle: 'Pass the trials and collect relics.',
      mainTitle: 'Become a Guardian',
      mainDesc:
          'Test your knowledge in the trials of wisdom and earn glowing badges to prove your mastery.',
      icon: Icons.auto_awesome_rounded,
    ),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FairytaleBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SunCard(
                              phase: slide.phase,
                              title: slide.teaserTitle,
                              subtitle: slide.teaserSubtitle,
                              icon: slide.icon,
                            )
                                .animate(key: ValueKey(slide.phase))
                                .fade(duration: 400.ms)
                                .scale(
                                  begin: const Offset(0.95, 0.95),
                                  end: const Offset(1, 1),
                                  curve: Curves.easeOutQuad,
                                ),
                            const SizedBox(height: AppSpacing.xl),
                            Text(
                              slide.mainTitle,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headlineMedium,
                            )
                                .animate(key: ValueKey('${slide.phase}_title'))
                                .fade(duration: 400.ms, delay: 100.ms)
                                .slideY(
                                  begin: 0.1,
                                  end: 0,
                                  curve: Curves.easeOutQuad,
                                ),
                            const SizedBox(height: AppSpacing.sm),
                            Text(
                              slide.mainDesc,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium,
                            )
                                .animate(key: ValueKey('${slide.phase}_desc'))
                                .fade(duration: 400.ms, delay: 200.ms)
                                .slideY(
                                  begin: 0.1,
                                  end: 0,
                                  curve: Curves.easeOutQuad,
                                ),
                          ],
                        ),
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
                    activeDotColor: Color(0xFFD18E15),
                    dotColor: Color(0xFFEFE8D6),
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
                AppPrimaryButton(
                  label: _index == _slides.length - 1 ? 'Enter Realm' : 'Next Chapter',
                  icon: _index == _slides.length - 1 ? Icons.auto_awesome_rounded : Icons.arrow_forward_rounded,
                  onPressed: () {
                    if (_index == _slides.length - 1) {
                      context.read<AppState>().completeOnboarding();
                      return;
                    }
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOutSine,
                    );
                  },
                ),
                const SizedBox(height: AppSpacing.sm),
                AppSecondaryButton(
                  label: 'Log In to Journey',
                  onPressed: () {
                    context.read<AppState>().completeOnboarding();
                  },
                  icon: Icons.login_rounded,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SunCard extends StatelessWidget {
  const SunCard({
    super.key,
    required this.phase,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final SunPhase phase;
  final String title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFDF8),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF0EAE1)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFD4C7B5).withValues(alpha: 0.15),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Background ambient gradient
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFFF9EE), Color(0xFFFFFDF8)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          // Sun Phases Drawings
          ..._buildSunGraphics(),

          // Foreground Content
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.8),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFE5B942).withValues(alpha: 0.15),
                          blurRadius: 16,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(icon, size: 28, color: const Color(0xFFD18E15)),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF4A3C2A),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: const Color(0xFF8B7E6A),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildSunGraphics() {
    switch (phase) {
      case SunPhase.dawn:
        return [
          // Dawn: Sun rising from bottom right
          Positioned(
            bottom: -60,
            right: -20,
            child: _GlowCircle(
              size: 260,
              color: const Color(0xFFFFD54F).withValues(alpha: 0.35),
            )
                .animate(
                  onPlay: (controller) => controller.repeat(reverse: true),
                )
                .scale(
                  begin: const Offset(1, 1),
                  end: const Offset(1.05, 1.05),
                  duration: 3.seconds,
                  curve: Curves.easeInOutSine,
                ),
          ),
          Positioned(
            bottom: -80,
            right: -40,
            child: Container(
              width: 180,
              height: 180,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [Color(0xFFFFB74D), Color(0xFFFFE082)],
                ),
              ),
            ),
          ),
        ];

      case SunPhase.morning:
        return [
          // Morning: Rays and rings expanding from center left
          Positioned(
            top: 10,
            left: -60,
            child: _GlowCircle(
              size: 320,
              color: const Color(0xFFFFE082).withValues(alpha: 0.35),
            )
                .animate(
                  onPlay: (controller) => controller.repeat(reverse: true),
                )
                .scale(
                  begin: const Offset(0.95, 0.95),
                  end: const Offset(1.1, 1.1),
                  duration: 4.seconds,
                  curve: Curves.easeInOut,
                ),
          ),
          Positioned(
            top: 70,
            left: 0,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFFFFD54F).withValues(alpha: 0.4),
                  width: 2,
                ),
              ),
            )
                .animate(
                  onPlay: (controller) => controller.repeat(reverse: true),
                )
                .scale(
                  begin: const Offset(0.95, 0.95),
                  end: const Offset(1.15, 1.15),
                  duration: 4.seconds,
                  curve: Curves.easeInOut,
                ),
          ),
          Positioned(
            top: 100,
            left: 30,
            child: Container(
              width: 140,
              height: 140,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [Color(0xFFFFE082), Color(0xFFFFF3E0)],
                ),
              ),
            ),
          ),
        ];

      case SunPhase.noon:
        return [
          // Noon: Full glow from top center
          Positioned(
            top: -160,
            left: -50,
            right: -50,
            child: Center(
              child: _GlowCircle(
                size: 400,
                color: const Color(0xFFFFCA28).withValues(alpha: 0.25),
              ),
            ),
          ),
          Positioned(
            top: -80,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 240,
                height: 240,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Color(0xFFFFCA28),
                      Color(0xFFFFE082),
                      Color(0xFFFFF8E1),
                    ],
                    stops: [0.2, 0.6, 1.0],
                  ),
                ),
              ),
            ),
          ),
        ];
    }
  }
}

class _GlowCircle extends StatelessWidget {
  const _GlowCircle({required this.size, required this.color});

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
          colors: [color, color.withValues(alpha: 0.0)],
          stops: const [0.3, 1.0],
        ),
      ),
    );
  }
}
