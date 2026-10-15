import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/commons/style/button_styles.dart';
import 'package:renteasy_app/commons/style/spacing_styles.dart';
import 'package:renteasy_app/commons/widgets/success_screen/success_screen.dart';
import 'package:renteasy_app/features/authentication/screens/login/login.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';
import 'package:renteasy_app/utilities/constants/text_strings.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

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
          AppTexts.splashTitle,
          style: TextStyle(
            color: AppColors.primaryBrandTitleColor,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
            child: Container(
              padding: EdgeInsets.all(AppSizes.defaultSpace),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFF1F5F9)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),

                // Shield Icon Badge
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: AppColors.button.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.shield_outlined,
                      size: 36,
                      color: AppColors.button,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Title
                Text(
                  AppTexts.verifyIdentity,
                  style: TextStyle(
                    fontSize: AppSizes.fontSizeCustom + 2,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'poppins',
                    color: AppColors.primaryTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),

                // Subtitle
                Text(
                  AppTexts.verifyIdentitySubtitle,
                  style: TextStyle(
                    fontSize: AppSizes.fontSizeSm,
                    color: AppColors.secondaryTextColor,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 28),

                // 6 OTP Circular Bubble Fields
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    6,
                    (index) => Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.button.withOpacity(0.5),
                          width: 1.5,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '',
                          style: TextStyle(
                            fontSize: AppSizes.fontSizeLg,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryTextColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 28),

                // Resend OTP Section
                Text(
                  AppTexts.didntReceiveCode,
                  style: TextStyle(
                    color: AppColors.secondaryTextColor,
                    fontSize: AppSizes.fontSizeSm,
                  ),
                ),
                const SizedBox(height: 4),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    AppTexts.resendOTP,
                    style: TextStyle(
                      color: AppColors.button,
                      fontSize: AppSizes.fontSizeSm,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Verify OTP Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(
                        () => SuccessScreen(
                          title: AppTexts.yourAccountCreatedTitle,
                          subTitle: AppTexts.yourAccountCreatedSubTitle,
                          onPressed: () => Get.offAll(() => const LoginScreen()),
                        ),
                      );
                    },
                    style: AppButtonStyles.primaryButton,
                    child: Text(
                      AppTexts.verifyOTP,
                      style: TextStyle(fontSize: AppSizes.fontSizeLg),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}