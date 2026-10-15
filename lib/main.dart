import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/features/authentication/screens/splash_screen.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';

void main() {
  runApp(RentEasyApp());
}

class RentEasyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // we are using getx controller that's why 
      title: "RentEasy",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.backgroundColor, 
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          scrolledUnderElevation: 0, // disables Material 3 color change when page scrolls
          surfaceTintColor: Colors.transparent, // prevents surface tint overlay on scroll
          backgroundColor: AppColors.appBarBg,
          elevation: 0,
        ),
      ),
      home: SplashScreen(),
    );
  }
}
