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
              // Screen-specific custom widget: Displays logo, sign-up title, and subtitle
              const AppSignUpHeader(),
              SizedBox(height: AppSizes.spaceBtwSections),

              // Screen-specific custom widget: Contains registration fields (Name, Email, Phone, Passwords, Terms checkbox)
              AppSignUpForm(),
              SizedBox(height: AppSizes.spaceBtwSections),

              // Shared reusable widget: Divides registration form from social sign-up options
              const AppformDivider(dividerText: AppTexts.or),
              SizedBox(height: AppSizes.spaceBtwSections),

              // Shared reusable widget: Third-party social registration buttons
              const AppSocialButtons(),
              const SizedBox(height: 28),

              // Footer: Navigation link to Login screen for returning users
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
