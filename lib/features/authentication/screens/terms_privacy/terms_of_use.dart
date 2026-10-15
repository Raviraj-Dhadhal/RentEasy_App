import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';
import 'package:renteasy_app/utilities/constants/text_strings.dart';

class TermsOfUseScreen extends StatelessWidget {
  const TermsOfUseScreen({super.key});

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
          AppTexts.termsOfUse,
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
                '1. Acceptance of Terms',
                style: TextStyle(
                  fontSize: AppSizes.fontSizeMd,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryTextColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'By accessing or using RentEasy, you agree to be bound by these Terms of Use. If you do not agree to these terms, please do not use the application.',
                style: TextStyle(
                  fontSize: AppSizes.fontSizeSm,
                  color: AppColors.secondaryTextColor,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '2. User Accounts',
                style: TextStyle(
                  fontSize: AppSizes.fontSizeMd,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryTextColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account.',
                style: TextStyle(
                  fontSize: AppSizes.fontSizeSm,
                  color: AppColors.secondaryTextColor,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '3. Rental Listings & Agreements',
                style: TextStyle(
                  fontSize: AppSizes.fontSizeMd,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryTextColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'All rental listings and roommate pairings are subject to verification and local property laws. RentEasy acts as a platform to connect renters and hosts.',
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
