import 'package:flutter/material.dart';
import 'package:mobile_app/core/theme/app_theme.dart';
import 'package:mobile_app/core/theme/app_tokens.dart';
import 'package:mobile_app/features/achievements/achievements_screen.dart';
import 'package:mobile_app/features/home/home_screen.dart';
import 'package:mobile_app/features/profile/profile_screen.dart';
import 'package:mobile_app/features/progress/progress_screen.dart';
import 'package:mobile_app/features/topics/topics_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = 0;

  static const _screens = [
    HomeScreen(),
    TopicsScreen(),
    ProgressScreen(),
    AchievementsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _index, children: _screens),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: AppRadii.lg,
          boxShadow: AppShadows.soft,
        ),
        child: ClipRRect(
          borderRadius: AppRadii.lg,
          child: NavigationBar(
            selectedIndex: _index,
            onDestinationSelected: (value) {
              setState(() => _index = value);
            },
            height: 70,
            indicatorColor: AppColors.primary.withValues(alpha: 0.35),
            backgroundColor: Colors.white,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home_rounded),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.menu_book_outlined),
                selectedIcon: Icon(Icons.menu_book_rounded),
                label: 'Topics',
              ),
              NavigationDestination(
                icon: Icon(Icons.insights_outlined),
                selectedIcon: Icon(Icons.insights_rounded),
                label: 'Progress',
              ),
              NavigationDestination(
                icon: Icon(Icons.emoji_events_outlined),
                selectedIcon: Icon(Icons.emoji_events_rounded),
                label: 'Badges',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline_rounded),
                selectedIcon: Icon(Icons.person_rounded),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
