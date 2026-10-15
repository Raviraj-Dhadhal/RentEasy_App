import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/image_string.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';
import 'package:renteasy_app/utilities/constants/text_strings.dart';

class AppSignUpHeader extends StatelessWidget {
  const AppSignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Logo
        SvgPicture.asset(
          images.WhiteBrandLogo,
          height: 70,
        ),
        const SizedBox(height: 24),

        // Title
        Text(
          AppTexts.createAccountTitle,
          style: TextStyle(
            fontSize: AppSizes.fontSizeCustom + 6,
            fontFamily: 'poppins',
            fontWeight: FontWeight.bold,
            color: AppColors.primaryTextColor,
          ),
        ),
        const SizedBox(height: 8),

        // Subtitle
        Text(
          AppTexts.createAccountSubTitle,
          style: TextStyle(
            fontSize: AppSizes.fontSizeSm,
            color: AppColors.secondaryTextColor,
          ),
        ),
      ],
    );
  }
}
