import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/commons/style/button_styles.dart';
import 'package:renteasy_app/commons/style/spacing_styles.dart';
import 'package:renteasy_app/features/authentication/screens/login/login.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';
import 'package:renteasy_app/utilities/constants/text_strings.dart';

class ResetPassScreen extends StatelessWidget {
  const ResetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () => Get.offAll(() => const LoginScreen()),
          ),
        ],
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppSpacingStyles.paddingWithAppBArHeight,
          child: Column(
            children: [
              const SizedBox(height: 20),

              // Illustration Badge
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.button.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.mark_email_read_outlined,
                  size: 56,
                  color: AppColors.button,
                ),
              ),
              const SizedBox(height: 32),

              // Title
              Text(
                AppTexts.changeYourPasswordTitle,
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
                AppTexts.changeYourPasswordSubtitle,
                style: TextStyle(
                  fontSize: AppSizes.fontSizeSm,
                  color: AppColors.secondaryTextColor,
                  fontFamily: 'poppins',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // Done Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAll(() => const LoginScreen()),
                  style: AppButtonStyles.primaryButton,
                  child: Text(
                    'Done',
                    style: TextStyle(fontSize: AppSizes.fontSizeLg),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Resend Email Button
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    AppTexts.resendEmail,
                    style: const TextStyle(color: AppColors.button),
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
