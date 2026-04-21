import 'package:flutter/material.dart';
import 'package:mobile_app/features/auth/login_screen.dart';
import 'package:mobile_app/features/auth/register_screen.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  bool _showLogin = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 320),
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      child: _showLogin
          ? LoginScreen(
              key: const ValueKey('login-screen'),
              onSwitchToRegister: () {
                setState(() => _showLogin = false);
              },
            )
          : RegisterScreen(
              key: const ValueKey('register-screen'),
              onSwitchToLogin: () {
                setState(() => _showLogin = true);
              },
            ),
    );
  }
}
