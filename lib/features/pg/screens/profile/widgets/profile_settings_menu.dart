import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/features/authentication/screens/login/login.dart';
import 'package:renteasy_app/features/pg/screens/contact_us/contact_us.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class ProfileSettingsMenu extends StatelessWidget {
  const ProfileSettingsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'SETTINGS',
          style: TextStyle(
            fontSize: 11.0,
            fontWeight: FontWeight.bold,
            color: AppColors.secondaryTextColor,
            fontFamily: 'poppins',
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: 10.0),
        Container(
          decoration: BoxDecoration(
            color: AppColors.propertyContainerBG,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: const Color(0xFFEBEBF5)),
          ),
          child: Column(
            children: [
              _buildMenuItem(
                icon: Icons.headset_mic_outlined,
                title: 'Contact Us',
                onTap: () => Get.to(() => const ContactUsScreen()),
              ),
              _buildDivider(),
              ListTile(
                onTap: () {
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
                leading: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: AppColors.error.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Icon(Icons.logout_rounded, color: AppColors.error, size: 20),
                ),
                title: const Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.error,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: const Color(0xFFEDEAFD),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Icon(icon, color: AppColors.button, size: 20),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: AppSizes.fontSizeSm,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryTextColor,
          fontFamily: 'poppins',
        ),
      ),
      trailing: const Icon(Icons.chevron_right, size: 20, color: AppColors.secondaryTextColor),
    );
  }

  Widget _buildDivider() {
    return const Divider(color: Color(0xFFEBEBF5), height: 1.0, indent: 60, endIndent: 16);
  }
}
