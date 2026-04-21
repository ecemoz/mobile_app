import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/core/theme/app_tokens.dart';

class AppColors {
  static const Color primary = Color(0xFFF4BD3D);
  static const Color primaryStrong = Color(0xFFE0A92A);
  static const Color cream = Color(0xFFFBF7EE);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color ink = Color(0xFF2E2A23);
  static const Color mutedInk = Color(0xFF7C7468);
  static const Color success = Color(0xFF2CA56E);
  static const Color error = Color(0xFFC84E4E);
  static const Color info = Color(0xFF4E7BC8);
  static const Color divider = Color(0xFFECE5D6);
}

class AppTheme {
  static ThemeData get lightTheme {
    final base = ThemeData.light(useMaterial3: true);
    final nunito = GoogleFonts.nunitoTextTheme(base.textTheme);

    return base.copyWith(
      scaffoldBackgroundColor: AppColors.cream,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: AppColors.ink,
        secondary: AppColors.info,
        surface: AppColors.surface,
        onSurface: AppColors.ink,
        error: AppColors.error,
      ),
      textTheme: nunito.copyWith(
        headlineLarge: GoogleFonts.fredoka(
          fontSize: 34,
          fontWeight: FontWeight.w600,
          color: AppColors.ink,
          letterSpacing: -0.6,
        ),
        headlineMedium: GoogleFonts.fredoka(
          fontSize: 26,
          fontWeight: FontWeight.w600,
          color: AppColors.ink,
          letterSpacing: -0.4,
        ),
        titleLarge: GoogleFonts.fredoka(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: AppColors.ink,
        ),
        titleMedium: GoogleFonts.nunito(
          fontSize: 17,
          fontWeight: FontWeight.w700,
          color: AppColors.ink,
        ),
        bodyLarge: GoogleFonts.nunito(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.ink,
          height: 1.4,
        ),
        bodyMedium: GoogleFonts.nunito(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.mutedInk,
          height: 1.4,
        ),
        labelLarge: GoogleFonts.nunito(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: AppColors.ink,
        ),
      ),
      cardTheme: const CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: AppRadii.md),
      ),
      dividerColor: AppColors.divider,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.cream,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.fredoka(
          color: AppColors.ink,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        hintStyle: GoogleFonts.nunito(
          color: AppColors.mutedInk.withValues(alpha: 0.75),
          fontWeight: FontWeight.w600,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
        border: OutlineInputBorder(
          borderRadius: AppRadii.md,
          borderSide: const BorderSide(color: AppColors.divider),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadii.md,
          borderSide: const BorderSide(color: AppColors.divider),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadii.md,
          borderSide: const BorderSide(
            color: AppColors.primaryStrong,
            width: 1.5,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          minimumSize: const Size.fromHeight(52),
          shape: RoundedRectangleBorder(borderRadius: AppRadii.md),
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.ink,
          textStyle: GoogleFonts.nunito(
            fontWeight: FontWeight.w800,
            fontSize: 15,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(52),
          shape: RoundedRectangleBorder(borderRadius: AppRadii.md),
          side: const BorderSide(color: AppColors.divider),
          foregroundColor: AppColors.ink,
          textStyle: GoogleFonts.nunito(fontWeight: FontWeight.w800),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    final base = ThemeData.dark(useMaterial3: true);
    final nunito = GoogleFonts.nunitoTextTheme(base.textTheme);

    return base.copyWith(
      scaffoldBackgroundColor: const Color(0xFF1F1D19),
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        onPrimary: AppColors.ink,
        secondary: Color(0xFF9ABAF1),
        surface: Color(0xFF2A2722),
        onSurface: Color(0xFFF3EBDC),
        error: Color(0xFFFF9C9C),
      ),
      textTheme: nunito.copyWith(
        headlineLarge: GoogleFonts.fredoka(
          fontSize: 34,
          fontWeight: FontWeight.w600,
          color: const Color(0xFFF6EEDA),
          letterSpacing: -0.6,
        ),
        headlineMedium: GoogleFonts.fredoka(
          fontSize: 26,
          fontWeight: FontWeight.w600,
          color: const Color(0xFFF6EEDA),
        ),
        titleLarge: GoogleFonts.fredoka(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: const Color(0xFFF6EEDA),
        ),
        titleMedium: GoogleFonts.nunito(
          fontSize: 17,
          fontWeight: FontWeight.w700,
          color: const Color(0xFFF6EEDA),
        ),
        bodyLarge: GoogleFonts.nunito(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: const Color(0xFFDFD7C8),
        ),
        bodyMedium: GoogleFonts.nunito(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: const Color(0xFFB8AD9A),
        ),
      ),
      cardTheme: const CardThemeData(
        color: Color(0xFF2A2722),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: AppRadii.md),
      ),
      dividerColor: const Color(0xFF3A352D),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF1F1D19),
        elevation: 0,
        titleTextStyle: GoogleFonts.fredoka(
          color: const Color(0xFFF6EEDA),
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
