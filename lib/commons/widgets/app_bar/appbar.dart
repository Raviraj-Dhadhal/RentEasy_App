import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/features/authentication/screens/login/login.dart';
import 'package:renteasy_app/navigation_menu.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';

// implementing prefferedsizewidget as appBar: preferredSizeWidget so we can't put there widget like padding or container
class RAppBar extends StatelessWidget implements PreferredSizeWidget{
  const RAppBar({
    super.key,
    this.titleText,
    this.title,
    this.trailing,
    this.action,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow = false,
    this.showLogout = false,
    this.onLogoutPressed,
    this.height,
  });

  final String? titleText;
  final Widget? title;
  final Widget? trailing;
  final List<Widget>? action;
  final IconData? leadingIcon;
  final VoidCallback? leadingOnPressed;
  final bool showBackArrow;
  final bool showLogout;
  final VoidCallback? onLogoutPressed;
  final double? height;

  @override
  Widget build(BuildContext context){
    Widget? effectiveTrailing = trailing;
    if (effectiveTrailing == null && (action == null || action!.isEmpty) && showLogout) {
      effectiveTrailing = IconButton(
        icon: const Icon(Icons.logout_rounded, color: AppColors.button),
        onPressed: onLogoutPressed ?? () {
          Get.defaultDialog(
            title: 'Logout',
            middleText: 'Are you sure you want to log out of RentEasy?',
            textConfirm: 'Logout',
            textCancel: 'Cancel',
            confirmTextColor: Colors.white,
            buttonColor: AppColors.error,
            onConfirm: () => Get.offAll(() => const LoginScreen()),
          );
        },
      );
    }

    return Container(
      color: AppColors.appBarBg, // full-width solid background so scrolled content does not bleed through left/right edges
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.md), // as we only need padding from right and left
        child: AppBar(
          backgroundColor: AppColors.appBarBg,
          elevation: 0,
          scrolledUnderElevation: 0, // prevents Material 3 from changing AppBar color when scrolled
          surfaceTintColor: Colors.transparent, // prevents Material 3 from applying surface tint overlay on scroll
          centerTitle: false,
          titleSpacing: showBackArrow || leadingIcon != null ? null : 0,
          automaticallyImplyLeading: false, // as this have by default on means you get back arrow
          leading: showBackArrow
            ? IconButton(
                onPressed: leadingOnPressed ?? () {
                  if (Navigator.of(context).canPop()) {
                    Get.back(); // Pop navigation stack if opened via route
                  } else if (Get.isRegistered<NavigationController>()) {
                    Get.find<NavigationController>().selectedIndex.value = 0; // Return to Home tab if inside NavigationMenu
                  }
                },
                icon: const Icon(Icons.arrow_back, color: AppColors.button),
              ) 
            : leadingIcon != null 
              ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon, color: AppColors.button))
              : null,
          title: title ?? (titleText != null
            ? Text(
                titleText!,
                style: Theme.of(context).textTheme.headlineSmall!.apply(color: AppColors.primaryTextColor).copyWith(fontWeight: FontWeight.bold),
              )
            : null),
          actions: action ?? (effectiveTrailing != null ? [effectiveTrailing] : null),
        ),
      ),
    );
  }

  @override
  // Implementing PreferreedSizeWidget
  Size get preferredSize => Size.fromHeight(height ?? AppSizes.appBarHeight);
}