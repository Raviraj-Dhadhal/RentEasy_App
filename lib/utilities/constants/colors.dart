import 'package:flutter/material.dart';

class AppColors{
  AppColors._(); // ._ means private constructor in dart

  // Background Color
  // static const Color backgroundColor = Color(0xFFF8F7FF);
  static const Color backgroundColor = Color(0xFFFFFFFF);

  // Title Color
  static const Color primaryBrandTitleColor = Color(0xFF4143D5);
  static const Color secondaryBrandTitleColor = Color(0xFF64748B);

  // Error and Validators Colors
  static const Color error = Color(0xFFD32F2f);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // Text Colors
  static const Color primaryTextColor = Color(0xFF1B1B23);
  static const Color secondaryTextColor = Color(0xFF464555);

  // Button Colors
  static const Color button = Color(0xFF5B5FEF);
  static const Color buttonTextColor = Color(0xFfF9F6FF);

  //App Bar Colors
  static const Color appBarBg = Color(0xFFFCF8FF);

  // BottomBar Colors
  static const Color bottomBarBG = Color(0xFFFCF8FF);
  static const Color bottomIcon = Color(0xFF4143D5);

  // Container of pages
  static const Color propertyContainerBG = Color(0xFFFCF8FF);



  // Gradient for HomePage Box
  static const Gradient linearBoxGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFF5B5FEF),
      Color(0xFF8B5CF6)
    ]
  );

  // default colours
  static const Color grey = Color(0xFF808080);

}