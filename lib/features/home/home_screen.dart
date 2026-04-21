import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mobile_app/core/models/app_models.dart';
import 'package:mobile_app/core/state/app_state.dart';
import 'package:mobile_app/core/theme/app_tokens.dart';
import 'package:mobile_app/core/widgets/app_components.dart';
import 'package:mobile_app/features/topics/topic_detail_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, _) {
        final userName = appState.currentUser?.fullName ?? 'Learner';
        final linuxTopics = appState.topics
            .where((topic) => topic.category == TopicCategory.linux)
            .toList();
        final continueTopic = appState.topics.firstWhere(
          (topic) => appState.nextIncompleteLesson(topic) != null,
          orElse: () => appState.topics.first,
        );
        final nextLesson = appState.nextIncompleteLesson(continueTopic);
        final featuredTopic = linuxTopics.isNotEmpty
            ? linuxTopics.first
            : appState.topics.first;
        final unlocked = appState.achievements
            .where((item) => item.isUnlocked)
            .take(3)
            .toList();

        return SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 120),
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Welcome, $userName',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.auto_awesome_rounded,
                              color: Color(0xFFF0B328),
                              size: 24,
                            ).animate(onPlay: (c) => c.repeat(reverse: true)).scale(begin: const Offset(0.8, 0.8), end: const Offset(1.2, 1.2), duration: 2.seconds),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.xxs),
                        Text(
                          'Your magical journey awaits.',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFFF0B328), width: 2),
                      color: const Color(0xFFFFEEB6),
                    ),
                    child: Center(
                      child: Text(
                        appState.currentUser?.initials ?? 'L',
                        style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF5D4830), fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.6),
                  borderRadius: AppRadii.md,
                  border: Border.all(color: Colors.white.withValues(alpha: 0.8), width: 1.5),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for spells and lessons...',
                    prefixIcon: const Icon(Icons.search_rounded, color: Color(0xFFD18E15)),
                    filled: false,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              SoftSurfaceCard(
                child: Row(
                  children: [
                    ProgressRing(
                      value: appState.overallProgress,
                      label: '${(appState.overallProgress * 100).round()}%',
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your Progress',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            '${appState.completedLessonsCount} lessons completed',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            '${appState.unlockedAchievementsCount} badges earned',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              const SectionHeader(
                title: 'Continue your Quest',
                subtitle: 'Pick up your next magical lesson.',
              ),
              const SizedBox(height: AppSpacing.sm),
              SoftSurfaceCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      continueTopic.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      nextLesson == null
                          ? 'Topic complete. Ready for quiz.'
                          : 'Next: ${nextLesson.title}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    LinearProgressIndicator(
                      value: appState.topicProgress(continueTopic),
                      borderRadius: AppRadii.pill,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    AppPrimaryButton(
                      label: nextLesson == null
                          ? 'Open Topic'
                          : 'Continue Lesson',
                      icon: Icons.play_arrow_rounded,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) =>
                                TopicDetailScreen(topic: continueTopic),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              const SectionHeader(
                title: 'Enchanted Realm',
                subtitle: 'A recommended topic for your journey.',
              ),
              const SizedBox(height: AppSpacing.sm),
              _FeaturedTopicCard(topic: featuredTopic),
              const SizedBox(height: AppSpacing.lg),
              const SectionHeader(
                title: 'Magical Treasures',
                subtitle: 'Celebrate your enchanted milestones.',
              ),
              const SizedBox(height: AppSpacing.sm),
              if (unlocked.isEmpty)
                const AppEmptyState(
                  title: 'No badges yet',
                  description: 'Complete lessons and quizzes to earn badges.',
                  icon: Icons.workspace_premium_outlined,
                )
              else
                ...unlocked.map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                    child: AchievementPill(
                      icon: item.definition.icon,
                      title: item.definition.title,
                      earnedAt: item.earnedAt,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _FeaturedTopicCard extends StatelessWidget {
  const _FeaturedTopicCard({required this.topic});

  final Topic topic;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFDF8),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFFDECB5)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE5D5BA).withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Ambient Warm Background
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
          
          // Animated Sun Glow (Top Right)
          Positioned(
            top: -40,
            right: -40,
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFFFFE082).withValues(alpha: 0.4),
                    const Color(0xFFFFE082).withValues(alpha: 0.0),
                  ],
                ),
              ),
            ).animate(onPlay: (controller) => controller.repeat(reverse: true))
             .scale(begin: const Offset(0.9, 0.9), end: const Offset(1.1, 1.1), duration: 4.seconds, curve: Curves.easeInOut),
          ),

          // Animated Sun Glow (Bottom Left)
          Positioned(
            bottom: -60,
            left: -30,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFFFFD54F).withValues(alpha: 0.25),
                    const Color(0xFFFFD54F).withValues(alpha: 0.0),
                  ],
                ),
              ),
            ).animate(onPlay: (controller) => controller.repeat(reverse: true))
             .fade(begin: 0.6, end: 1.0, duration: 3.seconds, curve: Curves.easeInOutSine),
          ),

          // Content Layer
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Prevents bottom overflow!
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFE5B942).withValues(alpha: 0.15),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Icon(
                        topicIconFromKey(topic.iconKey),
                        color: const Color(0xFFD18E15),
                        size: 22,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF3CD),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFFFFE082)),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.star_rounded, size: 14, color: Color(0xFFD18E15)),
                          const SizedBox(width: 4),
                          Text(
                            'Featured',
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
                const SizedBox(height: 16),
                Text(
                  topic.title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF4A3C2A),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  topic.shortDescription,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF8B7E6A),
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${topic.estimatedLessonCount} lessons • ${topic.difficulty.label} • ${topic.quizQuestions.length} quizzes',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: const Color(0xFFA19480),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFEEBC),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_forward_rounded,
                        size: 16,
                        color: Color(0xFFB07100),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fade(duration: 400.ms).slideY(begin: 0.05, end: 0, curve: Curves.easeOutQuad);
  }
}
