import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/core/state/app_state.dart';
import 'package:mobile_app/core/theme/app_tokens.dart';
import 'package:mobile_app/core/widgets/app_components.dart';
import 'package:provider/provider.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, _) {
        final progressPercent = (appState.overallProgress * 100).round();

        return SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 120),
            children: [
              Text(
                'My Progress',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Keep momentum. Small steps build strong skills.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: AppSpacing.md),
              SoftSurfaceCard(
                child: Row(
                  children: [
                    ProgressRing(
                      value: appState.overallProgress,
                      label: '$progressPercent%',
                      size: 110,
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Overall Completion',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            '${appState.completedLessonsCount} lessons completed',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            '${(appState.averageQuizScore * 100).round()}% avg quiz score',
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
                title: 'Topic Analytics',
                subtitle: 'Completion by topic.',
              ),
              const SizedBox(height: AppSpacing.sm),
              SoftSurfaceCard(
                child: SizedBox(
                  height: 220,
                  child: BarChart(
                    BarChartData(
                      borderData: FlBorderData(show: false),
                      gridData: const FlGridData(show: false),
                      titlesData: FlTitlesData(
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        leftTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 30,
                            getTitlesWidget: (value, meta) {
                              if (value < 0 ||
                                  value >= appState.topics.length) {
                                return const SizedBox.shrink();
                              }
                              final title =
                                  appState.topics[value.toInt()].title;
                              final compact = title.split(' ').first;
                              return Padding(
                                padding: const EdgeInsets.only(
                                  top: AppSpacing.xs,
                                ),
                                child: Text(
                                  compact,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      barGroups: appState.topics.asMap().entries.map((entry) {
                        final index = entry.key;
                        final topic = entry.value;
                        final percent = appState.topicProgress(topic) * 100;
                        return BarChartGroupData(
                          x: index,
                          barRods: [
                            BarChartRodData(
                              toY: percent,
                              width: 18,
                              borderRadius: AppRadii.sm,
                              gradient: const LinearGradient(
                                colors: [Color(0xFFFFD76A), Color(0xFFE5AA25)],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                      maxY: 100,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              const SectionHeader(
                title: 'Topic Breakdown',
                subtitle: 'Detailed learning progress for each path.',
              ),
              const SizedBox(height: AppSpacing.sm),
              ...appState.topics.map(
                (topic) => Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                  child: SoftSurfaceCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          topic.title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Text(
                          '${appState.completedLessonsForTopic(topic)}/${topic.lessons.length} lessons complete',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        LinearProgressIndicator(
                          value: appState.topicProgress(topic),
                          borderRadius: AppRadii.pill,
                        ),
                      ],
                    ),
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
