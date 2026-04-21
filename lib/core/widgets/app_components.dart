import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_app/core/theme/app_theme.dart';
import 'package:mobile_app/core/theme/app_tokens.dart';

class SoftSurfaceCard extends StatelessWidget {
  const SoftSurfaceCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(AppSpacing.md),
    this.margin,
    this.backgroundColor = AppColors.surface,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: AppRadii.lg,
        boxShadow: AppShadows.soft,
      ),
      child: child,
    );
  }
}

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.enabled = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: enabled ? onPressed : null,
      icon: icon == null ? const SizedBox.shrink() : Icon(icon, size: 20),
      label: Text(label),
      style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(52)),
    );
  }
}

class AppSecondaryButton extends StatelessWidget {
  const AppSecondaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    if (icon == null) {
      return OutlinedButton(onPressed: onPressed, child: Text(label));
    }

    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 20),
      label: Text(label),
    );
  }
}

class AppTextInput extends StatelessWidget {
  const AppTextInput({
    super.key,
    required this.controller,
    required this.label,
    this.hint,
    this.prefixIcon,
    this.keyboardType,
    this.obscureText = false,
    this.suffix,
  });

  final TextEditingController controller;
  final String label;
  final String? hint;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: AppSpacing.xs),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
            suffixIcon: suffix,
          ),
        ),
      ],
    );
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.actionLabel,
    this.onTapAction,
  });

  final String title;
  final String? subtitle;
  final String? actionLabel;
  final VoidCallback? onTapAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleMedium),
              if (subtitle != null)
                Padding(
                  padding: const EdgeInsets.only(top: AppSpacing.xxs),
                  child: Text(
                    subtitle!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
            ],
          ),
        ),
        if (actionLabel != null)
          TextButton(onPressed: onTapAction, child: Text(actionLabel!)),
      ],
    );
  }
}

class IllustrationPanel extends StatelessWidget {
  const IllustrationPanel({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.height = 170,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFF4CF), Color(0xFFFFE39B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: AppRadii.lg,
      ),
      child: Stack(
        children: [
          Positioned(
            top: -20,
            right: -20,
            child: CircleAvatar(
              radius: 56,
              backgroundColor: Colors.white.withValues(alpha: 0.35),
            ),
          ),
          Positioned(
            bottom: -26,
            left: -22,
            child: CircleAvatar(
              radius: 48,
              backgroundColor: Colors.white.withValues(alpha: 0.24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Row(
              children: [
                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: AppRadii.md,
                  ),
                  child: Icon(icon, color: AppColors.ink, size: 30),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        subtitle,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.ink.withValues(alpha: 0.78),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressRing extends StatelessWidget {
  const ProgressRing({
    super.key,
    required this.value,
    required this.label,
    this.size = 96,
  });

  final double value;
  final String label;
  final double size;

  @override
  Widget build(BuildContext context) {
    final safeValue = value.clamp(0, 1).toDouble();
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: safeValue,
            strokeWidth: 9,
            backgroundColor: AppColors.divider,
            color: AppColors.primaryStrong,
          ),
          Center(
            child: Text(label, style: Theme.of(context).textTheme.labelLarge),
          ),
        ],
      ),
    );
  }
}

class AchievementPill extends StatelessWidget {
  const AchievementPill({
    super.key,
    required this.icon,
    required this.title,
    this.earnedAt,
  });

  final IconData icon;
  final String title;
  final DateTime? earnedAt;

  @override
  Widget build(BuildContext context) {
    final unlocked = earnedAt != null;
    final dateText = earnedAt == null
        ? 'Locked'
        : DateFormat('d MMM yyyy').format(earnedAt!);

    return SoftSurfaceCard(
      backgroundColor: unlocked ? AppColors.surface : const Color(0xFFF2EFE8),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: unlocked
                  ? const Color(0xFFFFEEB7)
                  : const Color(0xFFE4DED0),
              borderRadius: AppRadii.md,
            ),
            child: Icon(
              icon,
              color: unlocked ? AppColors.ink : AppColors.mutedInk,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.labelLarge),
                Text(dateText, style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AppEmptyState extends StatelessWidget {
  const AppEmptyState({
    super.key,
    required this.title,
    required this.description,
    this.icon = Icons.inbox_rounded,
  });

  final String title;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SoftSurfaceCard(
      child: Column(
        children: [
          Icon(icon, size: 40, color: AppColors.mutedInk),
          const SizedBox(height: AppSpacing.sm),
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: AppSpacing.xs),
          Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

class AppLoadingState extends StatelessWidget {
  const AppLoadingState({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return SoftSurfaceCard(
      child: Row(
        children: [
          const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2.3),
          ),
          const SizedBox(width: AppSpacing.sm),
          Text(label, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class AppErrorState extends StatelessWidget {
  const AppErrorState({
    super.key,
    required this.title,
    required this.description,
    required this.onRetry,
  });

  final String title;
  final String description;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return SoftSurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: AppSpacing.xs),
          Text(description, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: AppSpacing.md),
          AppSecondaryButton(
            label: 'Try Again',
            onPressed: onRetry,
            icon: Icons.refresh_rounded,
          ),
        ],
      ),
    );
  }
}
