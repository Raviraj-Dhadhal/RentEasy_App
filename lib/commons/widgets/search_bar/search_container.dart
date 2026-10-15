import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class RSearchContainer extends StatelessWidget {
  const RSearchContainer({
    super.key,
    required this.text,
    this.icon = Icons.search,
    this.trailingIcon,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.onTrailingTap,
    this.readOnly = true,
    this.controller,
    this.onChanged,
    this.padding,
  });

  final String text;
  final IconData? icon;
  final IconData? trailingIcon;
  final bool showBackground, showBorder, readOnly;
  final VoidCallback? onTap;
  final VoidCallback? onTrailingTap;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: showBackground ? AppColors.backgroundColor : Colors.transparent,
          borderRadius: BorderRadius.circular(16.0),
          border: showBorder
              ? Border.all(color: const Color(0xFFE2E2EA), width: 1.2)
              : null,
        ),
        child: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: AppColors.secondaryTextColor, size: AppSizes.iconMd),
              const SizedBox(width: 12.0),
            ],
            Expanded(
              child: readOnly
                  ? Text(
                      text,
                      style: TextStyle(
                        color: AppColors.secondaryTextColor.withValues(alpha: 0.8),
                        fontSize: AppSizes.fontSizeSm,
                        fontFamily: 'poppins',
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  : TextField(
                      controller: controller,
                      onChanged: onChanged,
                      decoration: InputDecoration(
                        hintText: text,
                        hintStyle: TextStyle(
                          color: AppColors.secondaryTextColor.withValues(alpha: 0.8),
                          fontSize: AppSizes.fontSizeSm,
                          fontFamily: 'poppins',
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: AppColors.primaryTextColor,
                        fontSize: AppSizes.fontSizeSm,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
            ),
            if (trailingIcon != null) ...[
              const SizedBox(width: 8.0),
              GestureDetector(
                onTap: onTrailingTap ?? onTap,
                child: Icon(
                  trailingIcon,
                  color: AppColors.button,
                  size: AppSizes.iconMd,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
