import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';

class AppformDivider extends StatelessWidget {
  const AppformDivider({
    super.key,
    required this.dividerText,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: AppColors.grey,
            thickness: 0.5,
            indent: 60,
            endIndent: 10,
          ),
        ),
        Text(
          dividerText,
          style: TextStyle(color: AppColors.secondaryTextColor),
        ),
        Flexible(
          child: Divider(
            color: AppColors.grey,
            thickness: 0.5,
            indent: 10,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}
