import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/commons/widgets/app_bar/appbar.dart';
import 'package:renteasy_app/features/pg/screens/profile/edit_profile/edit_profile.dart';
import 'package:renteasy_app/features/pg/screens/profile/widgets/profile_activity_menu.dart';
import 'package:renteasy_app/features/pg/screens/profile/widgets/profile_header_card.dart';
import 'package:renteasy_app/features/pg/screens/profile/widgets/profile_settings_menu.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';
import 'package:renteasy_app/features/authentication/screens/login/login.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: RAppBar(
        showBackArrow: true,
        titleText: 'Profile',
        action: [
          IconButton(
            icon: const Icon(Icons.edit_outlined, color: AppColors.button),
            onPressed: () => Get.to(() => const EditProfileScreen()),
          ),
          IconButton(
            icon: const Icon(Icons.logout_rounded, color: AppColors.button),
            onPressed: () {
              Get.defaultDialog(
                title: 'Logout',
                middleText: 'Are you sure you want to log out of RentEasy?',
                textConfirm: 'Logout',
                textCancel: 'Cancel',
                confirmTextColor: Colors.white,
                buttonColor: AppColors.error,
                onConfirm: () => Get.offAll(() => LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Profile Header Card
              const ProfileHeaderCard(),
              SizedBox(height: AppSizes.spaceBtwSections),

              // Activity Menu (Bookings, Wishlist, etc.)
              const ProfileActivityMenu(),
              SizedBox(height: AppSizes.spaceBtwSections),

              // Settings Menu (Contact Us, Logout)
              const ProfileSettingsMenu(),
              const SizedBox(height: 36.0),
            ],
          ),
        ),
      ),
    );
  }
}
