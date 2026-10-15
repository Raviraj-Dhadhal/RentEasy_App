import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/features/pg/screens/profile/edit_profile/edit_profile.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/image_string.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';
import 'package:renteasy_app/utilities/constants/text_strings.dart';

class ProfileHeaderCard extends StatelessWidget {
  const ProfileHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Avatar with Blue Ring & Checkmark (Tappable to edit)
        Center(
          child: GestureDetector(
            onTap: () => Get.to(() => const EditProfileScreen()),
            child: Stack(
              children: [
                Container(
                  width: 100,
                  height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.button, width: 2.5),
                ),
                padding: const EdgeInsets.all(3.0),
                child: const CircleAvatar(
                  backgroundImage: AssetImage(images.userProfileImage),
                ),
              ),
              Positioned(
                bottom: 2,
                right: 2,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: AppColors.button,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check, color: Colors.white, size: 15),
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 12.0),

        // Name & City
        Text(
          AppTexts.userName,
          style: TextStyle(
            fontSize: AppSizes.fontSizeLg + 2,
            fontWeight: FontWeight.bold,
            fontFamily: 'poppins',
            color: AppColors.primaryTextColor,
          ),
        ),
        const SizedBox(height: 4.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_on_outlined, size: 15, color: AppColors.secondaryTextColor),
            const SizedBox(width: 4),
            Text(
              AppTexts.userCity,
              style: TextStyle(
                fontSize: AppSizes.fontSizeSm,
                fontFamily: 'poppins',
                color: AppColors.secondaryTextColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20.0),

        // User Info Container
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18.0),
          decoration: BoxDecoration(
            color: AppColors.propertyContainerBG,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: const Color(0xFFEBEBF5)),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: _buildDetailItem('FULL NAME', AppTexts.userName)),
                  const SizedBox(width: 16.0),
                  Expanded(child: _buildDetailItem('EMAIL', AppTexts.userEmail)),
                ],
              ),
              const SizedBox(height: 14.0),
              Row(
                children: [
                  Expanded(child: _buildDetailItem('PHONE', AppTexts.userPhone)),
                  const SizedBox(width: 16.0),
                  Expanded(child: _buildDetailItem('GENDER', AppTexts.userGender)),
                ],
              ),
              const SizedBox(height: 14.0),
              Row(
                children: [
                  Expanded(child: _buildDetailItem('DOB', AppTexts.userDob)),
                  const SizedBox(width: 16.0),
                  const Expanded(child: SizedBox()),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 10.0,
            fontWeight: FontWeight.bold,
            color: AppColors.secondaryTextColor,
            fontFamily: 'poppins',
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryTextColor,
            fontFamily: 'poppins',
          ),
        ),
      ],
    );
  }
}
