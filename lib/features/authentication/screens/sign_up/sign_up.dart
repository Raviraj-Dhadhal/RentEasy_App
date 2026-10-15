import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/commons/style/spacing_styles.dart';
import 'package:renteasy_app/commons/widgets/login_signup/form_divider.dart';
import 'package:renteasy_app/commons/widgets/login_signup/social_buttons.dart';
import 'package:renteasy_app/features/authentication/screens/login/login.dart';
import 'package:renteasy_app/features/authentication/screens/sign_up/widgets/sign_up_form.dart';
import 'package:renteasy_app/features/authentication/screens/sign_up/widgets/sign_up_header.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';
import 'package:renteasy_app/utilities/constants/text_strings.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        // physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: AppSpacingStyles.paddingWithAppBArHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              const AppSignUpHeader(),
              SizedBox(height: AppSizes.spaceBtwSections),

              // Form
              AppSignUpForm(),
              SizedBox(height: AppSizes.spaceBtwSections),

              // Divider
              const AppformDivider(dividerText: AppTexts.or),
              SizedBox(height: AppSizes.spaceBtwSections),

              // Social Buttons
              const AppSocialButtons(),
              const SizedBox(height: 28),

              // Footer: Already have an account? Sign In
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppTexts.alreadyHaveAccount,
                    style: TextStyle(color: AppColors.secondaryTextColor),
                  ),
                  GestureDetector(
                    onTap: () => Get.offAll(() => const LoginScreen()),
                    child: Text(
                      AppTexts.signIn,
                      style: TextStyle(
                        color: AppColors.button,
                        fontSize: AppSizes.fontSizeSm,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
