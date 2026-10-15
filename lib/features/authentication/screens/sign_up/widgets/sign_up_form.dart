import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/commons/style/button_styles.dart';
import 'package:renteasy_app/features/authentication/screens/sign_up/verify_email.dart';
import 'package:renteasy_app/features/authentication/screens/sign_up/widgets/terms_and_conditions_checkbox.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';
import 'package:renteasy_app/utilities/constants/text_strings.dart';
import 'package:renteasy_app/utilities/validators/validation.dart';

class AppSignUpForm extends StatelessWidget {
  AppSignUpForm({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          // Full Name
          TextFormField(
            validator: AppValidators.validatorFullName,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person_outline),
              hintText: AppTexts.fullName,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
              ),
            ),
          ),
          SizedBox(height: AppSizes.spaceBtwInputFields),

          // Email Address
          TextFormField(
            validator: AppValidators.validateEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.mail_outline),
              hintText: AppTexts.emailAddress,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
              ),
            ),
          ),
          SizedBox(height: AppSizes.spaceBtwInputFields),

          // Phone Number
          TextFormField(
            validator: AppValidators.validatePhoneNumber,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.phone_outlined),
              hintText: AppTexts.phoneNo,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
              ),
            ),
          ),
          SizedBox(height: AppSizes.spaceBtwInputFields),

          // Password
          TextFormField(
            obscureText: true,
            validator: AppValidators.validatePassword,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock_outline),
              hintText: AppTexts.password,
              suffixIcon: const Icon(Icons.remove_red_eye),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
              ),
            ),
          ),
          SizedBox(height: AppSizes.spaceBtwInputFields),

          // Confirm Password
          TextFormField(
            obscureText: true,
            validator: AppValidators.validateConfirmPassword,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock_reset),
              hintText: AppTexts.confirmPassword,
              suffixIcon: const Icon(Icons.remove_red_eye),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
              ),
            ),
          ),
          SizedBox(height: AppSizes.spaceBtwInputFields),

          // Terms & Conditions Checkbox
          const AppTermsAndConditionsCheckbox(),
          SizedBox(height: AppSizes.spaceBtwSections),

          // Create Account Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Get.to(() => const VerifyEmailScreen());
                }
              },
              style: AppButtonStyles.primaryButton,
              child: Text(
                AppTexts.createAccount,
                style: TextStyle(fontSize: AppSizes.fontSizeLg),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
