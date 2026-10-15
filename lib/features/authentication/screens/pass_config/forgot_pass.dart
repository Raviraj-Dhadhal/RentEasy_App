import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/commons/style/button_styles.dart';
import 'package:renteasy_app/commons/style/spacing_styles.dart';
import 'package:renteasy_app/features/authentication/screens/pass_config/reset_pass.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';
import 'package:renteasy_app/utilities/constants/text_strings.dart';
import 'package:renteasy_app/utilities/validators/validation.dart';

class ForgotPassScreen extends StatelessWidget {
  ForgotPassScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: AppSpacingStyles.paddingWithAppBArHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                AppTexts.forgetPasswordTitle,
                style: TextStyle(
                  fontSize: AppSizes.fontSizeCustom + 6,
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryTextColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                AppTexts.forgetPasswordSubtitle,
                style: TextStyle(
                  fontSize: AppSizes.fontSizeSm,
                  color: AppColors.secondaryTextColor,
                ),
              ),
              const SizedBox(height: 32),

              // Lock Illustration Badge (matching Figma)
              Center(
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    color: AppColors.button.withOpacity(0.08),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.lock_reset_rounded,
                      size: 80,
                      color: AppColors.button,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 36),

              // Form
              Form(
                key: formKey,
                child: Column(
                  children: [
                    // Email Input Field
                    TextFormField(
                      validator: AppValidators.validateEmail,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.mail_outline),
                        hintText: 'name@example.com',
                        labelText: AppTexts.emailAddress,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Send Reset Link Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Get.to(() => const ResetPassScreen());
                          }
                        },
                        style: AppButtonStyles.primaryButton,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppTexts.sendResetLink,
                              style: TextStyle(fontSize: AppSizes.fontSizeLg),
                            ),
                            const SizedBox(width: 8),
                            const Icon(Icons.send_rounded, size: 18),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Back to Sign In Link
              Center(
                child: TextButton(
                  onPressed: () => Get.back(),
                  child: Text(
                    AppTexts.backToSignIn,
                    style: const TextStyle(
                      color: AppColors.button,
                      fontWeight: FontWeight.w600,
                    ),
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
