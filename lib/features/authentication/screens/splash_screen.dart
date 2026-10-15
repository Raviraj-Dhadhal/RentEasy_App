import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:renteasy_app/utilities/constants/image_string.dart';
import 'package:renteasy_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer(const Duration(seconds: 5), () {
      if (!mounted) return;

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => OnBoardingScreen(),
        ),
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              images.WhiteBrandLogo,
              width: 200,
              height: 200,
              fit: BoxFit.contain,
              placeholderBuilder: (_) => const SizedBox(
                width: 200,
                height: 200,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            Text(
              'RentEasy',
              style: TextStyle(
                color: AppColors.primaryBrandTitleColor,
                fontSize: 38,
                fontFamily: 'poppins',
                fontWeight: FontWeight.w800,
                wordSpacing: -1,
              ),
            ),
            Text(
              'Smart Rental & Roommate Finder',
              style: TextStyle(
                color: AppColors.secondaryBrandTitleColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}