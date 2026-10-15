import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/commons/style/spacing_styles.dart';
import 'package:renteasy_app/commons/widgets/login_signup/form_divider.dart';
import 'package:renteasy_app/commons/widgets/login_signup/social_buttons.dart';
import 'package:renteasy_app/features/authentication/screens/login/widgets/login_form.dart';
import 'package:renteasy_app/features/authentication/screens/login/widgets/login_header.dart';
import 'package:renteasy_app/features/authentication/screens/sign_up/sign_up.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';
import 'package:renteasy_app/utilities/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        // Allows scrolling when the keyboard appears
        child: Padding(
          padding: AppSpacingStyles.paddingWithAppBArHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Screen-specific custom widget: Displays logo, greeting title, and subtitle
              const AppLoginHeader(),
              SizedBox(height: AppSizes.spaceBtwSections),

              // Screen-specific custom widget: Contains email/password form fields & sign-in action
              AppLoginForm(),
              SizedBox(height: AppSizes.spaceBtwSections),

              // Shared reusable widget: Divides form from social authentication options
              const AppformDivider(dividerText: AppTexts.or),
              SizedBox(height: AppSizes.spaceBtwSections),

              // Shared reusable widget: Third-party social login buttons (Google auth)
              const AppSocialButtons(),
              const SizedBox(height: 28),

              // Footer: Navigation link to Sign Up screen for new users
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppTexts.dontHaveAccount,
                    style: TextStyle(color: AppColors.secondaryTextColor),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(() => const SignUpScreen()),
                    child: Text(
                      AppTexts.signUp,
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