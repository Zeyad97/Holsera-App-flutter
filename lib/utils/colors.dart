import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF2563EB); // Blue-600
  static const Color primaryDark = Color(0xFF1E40AF); // Blue-900
  static const Color background = Color(0xFFFFFFFF); // White
  static const Color lightGray = Color(0xFFF7F9FC);
  static const Color textDark = Color(0xFF0A0A0A);
  static const Color textLight = Color(0xFF6B7280);
  static const Color accent = Color(0xFF3B82F6);
  static const Color error = Color(0xFFEF4444);
  static const Color success = Color(0xFF10B981);
  static const Color divider = Color(0xFFE5E7EB);

  static const LinearGradient gradientBlue = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF2563EB), Color(0xFF1E40AF)],
  );
}
