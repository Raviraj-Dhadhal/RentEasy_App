import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';
import 'package:renteasy_app/utilities/constants/text_strings.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: Text(
          AppTexts.privacyPolicy,
          style: TextStyle(
            color: AppColors.primaryTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '1. Information We Collect',
                style: TextStyle(
                  fontSize: AppSizes.fontSizeMd,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryTextColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'We collect information you provide directly to us when creating an account, updating your profile, or communicating with potential roommates and landlords.',
                style: TextStyle(
                  fontSize: AppSizes.fontSizeSm,
                  color: AppColors.secondaryTextColor,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '2. How We Use Your Information',
                style: TextStyle(
                  fontSize: AppSizes.fontSizeMd,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryTextColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'We use your data to facilitate rental matches, verify user identities, process rental applications, and improve your overall experience on RentEasy.',
                style: TextStyle(
                  fontSize: AppSizes.fontSizeSm,
                  color: AppColors.secondaryTextColor,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '3. Data Protection & Security',
                style: TextStyle(
                  fontSize: AppSizes.fontSizeMd,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryTextColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'We implement strict technical and organizational security measures to protect your personal information against unauthorized access, loss, or misuse.',
                style: TextStyle(
                  fontSize: AppSizes.fontSizeSm,
                  color: AppColors.secondaryTextColor,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
