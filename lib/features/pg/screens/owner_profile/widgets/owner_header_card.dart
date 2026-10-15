import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/features/pg/screens/chat/chat_screen.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/image_string.dart';

class OwnerHeaderCard extends StatelessWidget {
  const OwnerHeaderCard({
    super.key,
    this.name = 'Mahek Patel',
    this.memberSince = 'Member since Oct 2020',
    this.rating = '4.9',
    this.reviewCount = '124',
    this.image = images.userProfileImage,
  });

  final String name;
  final String memberSince;
  final String rating;
  final String reviewCount;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Avatar with verified badge
        Center(
          child: Stack(
            children: [
              Container(
                width: 88,
                height: 88,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.button, width: 2),
                ),
                padding: const EdgeInsets.all(2.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage(image),
                ),
              ),
              Positioned(
                bottom: 2,
                right: 2,
                child: Container(
                  width: 22,
                  height: 22,
                  decoration: const BoxDecoration(
                    color: AppColors.button,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check, color: Colors.white, size: 14),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0),

        // Name & Member Since
        Text(
          name,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'poppins',
            color: AppColors.primaryTextColor,
          ),
        ),
        const SizedBox(height: 2.0),
        Text(
          memberSince,
          style: const TextStyle(
            fontSize: 11.0,
            color: AppColors.secondaryTextColor,
            fontFamily: 'poppins',
          ),
        ),
        const SizedBox(height: 6.0),

        // Rating Pill
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
          decoration: BoxDecoration(
            color: const Color(0xFFEDEAFD),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$rating ★',
                style: const TextStyle(
                  fontSize: 11.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'poppins',
                  color: AppColors.button,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '($reviewCount Reviews)',
                style: const TextStyle(
                  fontSize: 10.0,
                  fontFamily: 'poppins',
                  color: AppColors.secondaryTextColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),

        // Action Buttons: Chat Now & Call Owner
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () => Get.to(() => ChatScreen(ownerName: name)),
                icon: const Icon(Icons.chat_bubble_outline, size: 16, color: Colors.white),
                label: const Text(
                  'Chat Now',
                  style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold, fontFamily: 'poppins'),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.button,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  padding: const EdgeInsets.symmetric(vertical: 11.0),
                  elevation: 0,
                ),
              ),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.phone_outlined, size: 16, color: AppColors.button),
                label: const Text(
                  'Call Owner',
                  style: TextStyle(color: AppColors.button, fontSize: 13, fontWeight: FontWeight.bold, fontFamily: 'poppins'),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.button, width: 1.5),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  padding: const EdgeInsets.symmetric(vertical: 11.0),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
