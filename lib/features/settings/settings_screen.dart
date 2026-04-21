import 'package:flutter/material.dart';
import 'package:mobile_app/core/models/app_models.dart';
import 'package:mobile_app/core/state/app_state.dart';
import 'package:mobile_app/core/theme/app_tokens.dart';
import 'package:mobile_app/core/widgets/app_components.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, _) {
        return Scaffold(
          appBar: AppBar(title: const Text('Settings')),
          body: ListView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            children: [
              const SectionHeader(
                title: 'Preferences',
                subtitle: 'Control your app experience.',
              ),
              const SizedBox(height: AppSpacing.sm),
              SoftSurfaceCard(
                child: Column(
                  children: [
                    SwitchListTile.adaptive(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Notifications'),
                      subtitle: const Text('Daily reminders and updates'),
                      value: appState.notificationsEnabled,
                      onChanged: appState.setNotificationsEnabled,
                    ),
                    const Divider(height: 1),
                    const SizedBox(height: AppSpacing.sm),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Theme Preference',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    SegmentedButton<ThemePreference>(
                      segments: const [
                        ButtonSegment(
                          value: ThemePreference.system,
                          label: Text('System'),
                          icon: Icon(Icons.smartphone_rounded),
                        ),
                        ButtonSegment(
                          value: ThemePreference.light,
                          label: Text('Light'),
                          icon: Icon(Icons.light_mode_rounded),
                        ),
                        ButtonSegment(
                          value: ThemePreference.dark,
                          label: Text('Dark'),
                          icon: Icon(Icons.dark_mode_rounded),
                        ),
                      ],
                      selected: {appState.themePreference},
                      onSelectionChanged: (value) {
                        appState.setThemePreference(value.first);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              const SectionHeader(
                title: 'Support',
                subtitle: 'Help and account actions.',
              ),
              const SizedBox(height: AppSpacing.sm),
              SoftSurfaceCard(
                child: Column(
                  children: [
                    _SettingsTile(
                      icon: Icons.privacy_tip_outlined,
                      label: 'Privacy Policy',
                      onTap: () {},
                    ),
                    const Divider(height: 1),
                    _SettingsTile(
                      icon: Icons.help_outline_rounded,
                      label: 'Help Center',
                      onTap: () {},
                    ),
                    const Divider(height: 1),
                    _SettingsTile(
                      icon: Icons.support_agent_rounded,
                      label: 'Contact Support',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              OutlinedButton.icon(
                onPressed: () {
                  showDialog<void>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Reset learning progress?'),
                      content: const Text(
                        'This clears completed lessons, quiz scores, and earned badges.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            appState.resetLearningProgress();
                            Navigator.pop(context);
                          },
                          child: const Text('Reset'),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.restart_alt_rounded),
                label: const Text('Reset Progress'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
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
      title: Text(label),
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: onTap,
    );
  }
}
