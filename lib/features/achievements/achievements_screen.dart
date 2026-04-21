import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_app/core/state/app_state.dart';
import 'package:mobile_app/core/theme/app_theme.dart';
import 'package:mobile_app/core/theme/app_tokens.dart';
import 'package:mobile_app/core/widgets/app_components.dart';
import 'package:provider/provider.dart';

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, _) {
        final achievements = appState.achievements;

        return SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 120),
            children: [
              Text(
                'Magical Relics',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Track your discovered artifacts and see what remains hidden.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: AppSpacing.md),
              SoftSurfaceCard(
                child: Row(
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFF0C3),
                        borderRadius: AppRadii.md,
                      ),
                      child: const Icon(Icons.workspace_premium_rounded),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Text(
                        '${appState.unlockedAchievementsCount} / ${achievements.length} relics discovered',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              GridView.builder(
                itemCount: achievements.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  final item = achievements[index];
                  final unlocked = item.isUnlocked;

                  return SoftSurfaceCard(
                    backgroundColor: unlocked
                        ? Colors.white.withValues(alpha: 0.65)
                        : Colors.white.withValues(alpha: 0.35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(
                            color: unlocked
                                ? const Color(0xFFFFE8A3)
                                : Colors.white.withValues(alpha: 0.5),
                            borderRadius: AppRadii.md,
                          ),
                          child: Icon(
                            item.definition.icon,
                            color: unlocked
                                ? AppColors.ink
                                : AppColors.mutedInk,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        Text(
                          item.definition.title,
                          style: Theme.of(context).textTheme.titleMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: AppSpacing.xxs),
                        Text(
                          item.definition.description,
                          style: Theme.of(context).textTheme.bodySmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        Text(
                          unlocked
                              ? DateFormat('d MMM yyyy').format(item.earnedAt!)
                              : item.definition.unlockHint,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: unlocked
                                    ? const Color(0xFFB07100)
                                    : AppColors.mutedInk,
                              ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
