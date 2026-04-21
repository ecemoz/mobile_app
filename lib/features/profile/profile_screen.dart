import 'package:flutter/material.dart';
import 'package:mobile_app/core/state/app_state.dart';
import 'package:mobile_app/core/theme/app_theme.dart';
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
                'Profile',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: AppSpacing.md),
              SoftSurfaceCard(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.primary,
                      child: Text(
                        user?.initials ?? 'L',
                        style: Theme.of(context).textTheme.titleMedium,
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
                              color: const Color(0xFFFFE9A9),
                              borderRadius: AppRadii.pill,
                            ),
                            child: Text(
                              user?.role ?? 'Student',
                              style: Theme.of(context).textTheme.bodySmall,
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
                      label: 'Edit Profile',
                      onTap: () {},
                    ),
                    const Divider(height: 1),
                    _ProfileActionTile(
                      icon: Icons.workspace_premium_outlined,
                      label: 'My Certificates',
                      onTap: () {},
                    ),
                    const Divider(height: 1),
                    _ProfileActionTile(
                      icon: Icons.bookmark_outline_rounded,
                      label: 'Saved Courses',
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
              OutlinedButton.icon(
                onPressed: appState.signOut,
                icon: const Icon(Icons.logout_rounded),
                label: const Text('Log Out'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.error,
                  side: const BorderSide(color: Color(0xFFE7C8C8)),
                ),
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
