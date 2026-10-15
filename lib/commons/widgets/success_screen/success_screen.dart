import 'package:flutter/material.dart';
import 'package:renteasy_app/commons/style/button_styles.dart';
import 'package:renteasy_app/commons/style/spacing_styles.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onPressed,
    this.image,
  });

  final String title;
  final String subTitle;
  final VoidCallback onPressed;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: AppSpacingStyles.paddingWithAppBArHeight * 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              // Success Icon / Illustration
              if (image != null)
                Image.asset(image!, height: 180)
              else
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: AppColors.button.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check_circle_rounded,
                    size: 64,
                    color: AppColors.button,
                  ),
                ),
              const SizedBox(height: 32),

              // Title
              Text(
                title,
                style: TextStyle(
                  fontSize: AppSizes.fontSizeCustom,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'poppins',
                  color: AppColors.primaryTextColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),

              // Subtitle
              Text(
                subTitle,
                style: TextStyle(
                  fontSize: AppSizes.fontSizeSm,
                  color: AppColors.secondaryTextColor,
                  fontFamily: 'poppins',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 36),

              // Continue Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  style: AppButtonStyles.primaryButton,
                  child: Text(
                    'Continue',
                    style: TextStyle(fontSize: AppSizes.fontSizeLg),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
