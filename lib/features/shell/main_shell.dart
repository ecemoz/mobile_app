import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mobile_app/core/theme/app_tokens.dart';
import 'package:mobile_app/core/widgets/fairytale_background.dart';
import 'package:mobile_app/features/achievements/achievements_screen.dart';
import 'package:mobile_app/features/home/home_screen.dart';
import 'package:mobile_app/features/profile/profile_screen.dart';
import 'package:mobile_app/features/progress/progress_screen.dart';
import 'package:mobile_app/features/topics/topics_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  static void navigateTo(BuildContext context, int index) {
    final state = context.findAncestorStateOfType<_MainShellState>();
    state?.navigateTo(index);
  }

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = 0;

  void navigateTo(int index) {
    if (_index != index && mounted) {
      setState(() => _index = index);
    }
  }

  static const _screens = [
    HomeScreen(),
    TopicsScreen(),
    ProgressScreen(),
    AchievementsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return FairytaleBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent, // Let background shine through
        extendBody: true, // Allow content behind the nav bar
        body: IndexedStack(index: _index, children: _screens),
        bottomNavigationBar: SafeArea(
          child: Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 16), // Lifted up a bit
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.65), // Glassmorphism white
              borderRadius: AppRadii.lg,
              border: Border.all(color: Colors.white.withValues(alpha: 0.8), width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFF0B328).withValues(alpha: 0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: AppRadii.lg,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    splashColor: const Color(0xFFFFC107).withValues(alpha: 0.3), // Sun glow splash
                    highlightColor: const Color(0xFFFFD54F).withValues(alpha: 0.2),
                  ),
                  child: NavigationBar(
                    selectedIndex: _index,
                    onDestinationSelected: (value) {
                      setState(() => _index = value);
                    },
                    height: 60,
                    indicatorColor: const Color(0xFFFFC107).withValues(alpha: 0.65), // Radiant sun indicator
                    backgroundColor: Colors.transparent, // Handled by container
                    labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
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
                    icon: Icon(Icons.auto_awesome_outlined), // Changed to a magical star
                    selectedIcon: Icon(Icons.auto_awesome_rounded),
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
            ),
          ),
        ),
      ),
    );
  }
}
