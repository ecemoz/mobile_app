import 'package:flutter/material.dart';
import 'package:mobile_app/core/state/app_state.dart';
import 'package:mobile_app/core/theme/app_tokens.dart';
import 'package:mobile_app/core/widgets/app_components.dart';
import 'package:mobile_app/features/settings/settings_screen.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, _) {
        final user = appState.currentUser;

        return SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 120),
            children: [
              Text(
                'Wanderer\'s Profile',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: AppSpacing.md),
              SoftSurfaceCard(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: const Color(0xFFF0B328),
                      child: Text(
                        user?.initials ?? 'L',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user?.fullName ?? 'Learner',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            user?.email ?? 'learner@learnhub.app',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: AppSpacing.xxs),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.sm,
                              vertical: AppSpacing.xxs,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFEEBC),
                              borderRadius: AppRadii.pill,
                              border: Border.all(color: const Color(0xFFF0B328)),
                            ),
                            child: Text(
                              user?.role ?? 'Apprentice',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: const Color(0xFF5D4830)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              SoftSurfaceCard(
                child: Column(
                  children: [
                    _ProfileActionTile(
                      icon: Icons.edit_outlined,
                      label: 'Edit Identity',
                      onTap: () {},
                    ),
                    const Divider(height: 1),
                    _ProfileActionTile(
                      icon: Icons.workspace_premium_outlined,
                      label: 'My Magical Certificates',
                      onTap: () {},
                    ),
                    const Divider(height: 1),
                    _ProfileActionTile(
                      icon: Icons.bookmark_outline_rounded,
                      label: 'Saved Lore',
                      onTap: () {},
                    ),
                    const Divider(height: 1),
                    _ProfileActionTile(
                      icon: Icons.settings_outlined,
                      label: 'Settings',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => const SettingsScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              AppSecondaryButton(
                onPressed: appState.signOut,
                icon: Icons.logout_rounded,
                label: 'Depart Realm',
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ProfileActionTile extends StatelessWidget {
  const _ProfileActionTile({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(label, style: Theme.of(context).textTheme.bodyLarge),
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: onTap,
    );
  }
}
