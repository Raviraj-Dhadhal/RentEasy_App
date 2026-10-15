import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class RSectionHeading extends StatelessWidget {
  const RSectionHeading({
    super.key,
    required this.title,
    this.buttonTitle = 'See All',
    this.showActionButton = true,
    this.textColor,
    this.onPressed,
  });

  final String title;
  final String buttonTitle;
  final bool showActionButton;
  final Color? textColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: AppSizes.fontSizeLg,
            fontFamily: 'poppins',
            fontWeight: FontWeight.bold,
            color: textColor ?? AppColors.primaryTextColor,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              buttonTitle,
              style: TextStyle(
                color: AppColors.button,
                fontSize: AppSizes.fontSizeSm,
                fontFamily: 'poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }
}
