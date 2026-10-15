import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/features/authentication/screens/terms_privacy/privacy_policy.dart';
import 'package:renteasy_app/features/authentication/screens/terms_privacy/terms_of_use.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';
import 'package:renteasy_app/utilities/constants/text_strings.dart';

class AppTermsAndConditionsCheckbox extends StatelessWidget {
  const AppTermsAndConditionsCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: true,
            onChanged: (value) {},
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: AppTexts.iAgreeTo,
                  style: TextStyle(
                    fontSize: AppSizes.fontSizeSm,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
                TextSpan(
                  text: AppTexts.terms,
                  style: TextStyle(
                    fontSize: AppSizes.fontSizeSm,
                    color: AppColors.button,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.none
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.to(() => const TermsOfUseScreen()),
                ),
                TextSpan(
                  text: AppTexts.and,
                  style: TextStyle(
                    fontSize: AppSizes.fontSizeSm,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
                TextSpan(
                  text: AppTexts.privacyPolicy,
                  style: TextStyle(
                    fontSize: AppSizes.fontSizeSm,
                    color: AppColors.button,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.none
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.to(() => const PrivacyPolicyScreen()),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
