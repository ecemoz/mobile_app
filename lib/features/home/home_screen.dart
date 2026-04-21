import 'package:flutter/material.dart';
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
        final continueTopic = appState.topics.firstWhere(
          (topic) => appState.nextIncompleteLesson(topic) != null,
          orElse: () => appState.topics.first,
        );
        final nextLesson = appState.nextIncompleteLesson(continueTopic);
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
                        Text(
                          'Hi, $userName',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(height: AppSpacing.xxs),
                        Text(
                          'Keep up your learning streak.',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: 24,
                    child: Text(appState.currentUser?.initials ?? 'L'),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Search courses, topics, lessons',
                  prefixIcon: Icon(Icons.search_rounded),
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
                title: 'Continue Learning',
                subtitle: 'Pick up where you left off.',
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
                title: 'Featured Topic',
                subtitle: 'Popular with new learners.',
              ),
              const SizedBox(height: AppSpacing.sm),
              _FeaturedTopicCard(topic: appState.topics.first),
              const SizedBox(height: AppSpacing.lg),
              const SectionHeader(
                title: 'Recent Achievements',
                subtitle: 'Celebrate your milestones.',
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
    return SoftSurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IllustrationPanel(
            title: topic.title,
            subtitle: topic.shortDescription,
            icon: Icons.lightbulb_circle_rounded,
            height: 120,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            '${topic.lessons.length} lessons • ${topic.quizQuestions.length} quiz questions',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
