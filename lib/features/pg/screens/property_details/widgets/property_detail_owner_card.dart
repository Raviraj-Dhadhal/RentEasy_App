import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/features/pg/screens/chat/chat_screen.dart';
import 'package:renteasy_app/features/pg/screens/owner_profile/owner_profile.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/image_string.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class PropertyDetailOwnerCard extends StatelessWidget {
  const PropertyDetailOwnerCard({
    super.key,
    this.name = 'Mahek Patel',
    this.title = 'Verified Owner',
    this.image = images.userProfileImage,
  });

  final String name;
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: AppColors.propertyContainerBG,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: const Color(0xFFEBEBF5)),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Get.to(() => const OwnerProfileScreen()),
            child: CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage(image),
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: GestureDetector(
              onTap: () => Get.to(() => const OwnerProfileScreen()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: AppSizes.fontSizeSm,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'poppins',
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: AppSizes.fontSizeXs - 1,
                      color: AppColors.secondaryTextColor,
                      fontFamily: 'poppins',
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                color: Color(0xFFEDEAFD),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.chat_bubble_outline, color: AppColors.button, size: 18),
            ),
            onPressed: () => Get.to(() => ChatScreen(ownerName: name)),
          ),
          IconButton(
            icon: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                color: Color(0xFFEDEAFD),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.phone_outlined, color: AppColors.button, size: 18),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
