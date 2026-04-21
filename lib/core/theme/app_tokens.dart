import 'package:flutter/material.dart';

class AppSpacing {
  static const double xxs = 4;
  static const double xs = 8;
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 20;
  static const double xl = 24;
  static const double xxl = 32;
}

class AppRadii {
  static const BorderRadius sm = BorderRadius.all(Radius.circular(12));
  static const BorderRadius md = BorderRadius.all(Radius.circular(16));
  static const BorderRadius lg = BorderRadius.all(Radius.circular(24));
  static const BorderRadius pill = BorderRadius.all(Radius.circular(999));
}

class AppShadows {
  static List<BoxShadow> get soft => [
    BoxShadow(
      color: const Color(0xFF463A1C).withValues(alpha: 0.08),
      blurRadius: 20,
      offset: const Offset(0, 10),
    ),
    BoxShadow(
      color: const Color(0xFF463A1C).withValues(alpha: 0.04),
      blurRadius: 6,
      offset: const Offset(0, 2),
    ),
  ];
}
