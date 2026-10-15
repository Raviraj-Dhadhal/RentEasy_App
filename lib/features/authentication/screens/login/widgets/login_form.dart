import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/commons/style/button_styles.dart';
import 'package:renteasy_app/features/authentication/screens/pass_config/forgot_pass.dart';
import 'package:renteasy_app/navigation_menu.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';
import 'package:renteasy_app/utilities/constants/text_strings.dart';
import 'package:renteasy_app/utilities/validators/validation.dart';

class AppLoginForm extends StatelessWidget {
  AppLoginForm({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          // Email Field
          TextFormField(
            validator: AppValidators.validateEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: AppTexts.emailAddress,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
              ),
            ),
          ),
          SizedBox(height: AppSizes.spaceBtwInputFields),

          // Password Field
          TextFormField(
            obscureText: true,
            validator: (value) =>
                value == null || value.isEmpty ? 'Password is Required.' : null,
            decoration: InputDecoration(
              hintText: AppTexts.password,
              suffixIcon: const Icon(Icons.remove_red_eye),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
              ),
            ),
          ),
          SizedBox(height: AppSizes.spaceBtwInputFields / 2),

          // Forgot Password (aligned right)
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => Get.to(() => ForgotPassScreen()),
              child: Text(
                AppTexts.forgetPassword,
                style: const TextStyle(color: AppColors.button),
              ),
            ),
          ),
          SizedBox(height: AppSizes.spaceBtwSections),

          // Sign In Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Get.offAll(() => const NavigationMenu());
                }
              },
              style: AppButtonStyles.primaryButton,
              child: Text(
                AppTexts.signIn,
                style: TextStyle(fontSize: AppSizes.fontSizeLg),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
