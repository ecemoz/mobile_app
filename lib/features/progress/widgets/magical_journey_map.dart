import 'package:flutter/material.dart';
import 'package:mobile_app/core/models/app_models.dart';
import 'package:mobile_app/core/state/app_state.dart';
import 'package:mobile_app/features/progress/widgets/journey_stop_node.dart';
import 'package:mobile_app/features/progress/widgets/magical_path_painter.dart';
import 'package:mobile_app/features/topics/topic_detail_screen.dart';

class MagicalJourneyMap extends StatelessWidget {
  const MagicalJourneyMap({
    super.key,
    required this.appState,
  });

  final AppState appState;

  @override
  Widget build(BuildContext context) {
    if (appState.topics.isEmpty) return const SizedBox.shrink();

    // Determine strongest and active topics
    Topic? strongestTopic;
    double maxProgress = -1;
    Topic? activeTopic;

    for (final topic in appState.topics) {
      final progress = appState.topicProgress(topic);
      if (progress > maxProgress) {
        maxProgress = progress;
        strongestTopic = topic;
      }
      // First incomplete topic is active
      if (activeTopic == null && progress < 1.0) {
        activeTopic = topic;
      }
    }
    // If all completed, active is the last one (or none)
    activeTopic ??= appState.topics.last;

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        // The magical connecting path
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: CustomPaint(
              painter: MagicalPathPainter(),
            ),
          ),
        ),

        // The journey nodes
        Column(
          children: appState.topics.map((topic) {
            final isLast = topic == appState.topics.last;
            return Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 48.0),
              child: JourneyStopNode(
                topic: topic,
                progressPercent: appState.topicProgress(topic),
                completedLessons: appState.completedLessonsForTopic(topic),
                totalLessons: topic.lessons.length,
                isActive: topic == activeTopic,
                isStrongest: topic == strongestTopic && maxProgress > 0,
                onContinue: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => TopicDetailScreen(topic: topic),
                    ),
                  );
                },
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
