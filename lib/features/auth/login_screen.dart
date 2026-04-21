import 'package:flutter/material.dart';
import 'package:mobile_app/core/state/app_state.dart';
import 'package:mobile_app/core/theme/app_tokens.dart';
import 'package:mobile_app/core/widgets/app_components.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.onSwitchToRegister});

  final VoidCallback onSwitchToRegister;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = true;
  bool _hidePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.md),
              IllustrationPanel(
                title: 'Welcome Back',
                subtitle:
                    'Continue your learning journey and keep your streak alive.',
                icon: Icons.menu_book_rounded,
                height: 160,
              ),
              const SizedBox(height: AppSpacing.xl),
              Text(
                'Sign in to your account',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Stay consistent, one lesson at a time.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: AppSpacing.lg),
              AppTextInput(
                controller: _emailController,
                label: 'Email',
                hint: 'name@example.com',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.email_outlined,
              ),
              const SizedBox(height: AppSpacing.md),
              AppTextInput(
                controller: _passwordController,
                label: 'Password',
                hint: 'Your password',
                obscureText: _hidePassword,
                prefixIcon: Icons.lock_outline_rounded,
                suffix: IconButton(
                  onPressed: () {
                    setState(() => _hidePassword = !_hidePassword);
                  },
                  icon: Icon(
                    _hidePassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Row(
                children: [
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (value) {
                      setState(() => _rememberMe = value ?? false);
                    },
                  ),
                  const Text('Remember me'),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Password reset is coming soon.'),
                        ),
                      );
                    },
                    child: const Text('Forgot password?'),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.sm),
              AppPrimaryButton(
                label: 'Sign In',
                icon: Icons.arrow_forward_rounded,
                onPressed: () {
                  context.read<AppState>().signIn(
                    email: _emailController.text,
                    password: _passwordController.text,
                    rememberMe: _rememberMe,
                  );
                },
              ),
              const SizedBox(height: AppSpacing.md),
              Center(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account? ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextButton(
                      onPressed: widget.onSwitchToRegister,
                      child: const Text('Register'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
