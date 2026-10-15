import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/features/pg/screens/chat/chat_screen.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/image_string.dart';

class RoommateMatchCard extends StatelessWidget {
  const RoommateMatchCard({
    super.key,
    required this.name,
    required this.profession,
    required this.location,
    required this.budget,
    required this.compatibility,
    required this.moveInDate,
    required this.tags,
    this.image = images.userProfileImage,
  });

  final String name;
  final String profession;
  final String location;
  final String budget;
  final String compatibility;
  final String moveInDate;
  final List<String> tags;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.propertyContainerBG,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: const Color(0xFFEBEBF5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Avatar + Info + Compatibility Badge
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage(image),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: const Color(0xFF22C55E),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'poppins',
                        color: AppColors.primaryTextColor,
                      ),
                    ),
                    Text(
                      profession,
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                        color: AppColors.button,
                        fontFamily: 'poppins',
                      ),
                    ),
                    const SizedBox(height: 2.0),
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined, size: 13, color: AppColors.secondaryTextColor),
                        const SizedBox(width: 2),
                        Text(
                          location,
                          style: const TextStyle(
                            fontSize: 11.0,
                            color: AppColors.secondaryTextColor,
                            fontFamily: 'poppins',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2.0),
                    Row(
                      children: [
                        const Icon(Icons.account_balance_wallet_outlined, size: 13, color: AppColors.secondaryTextColor),
                        const SizedBox(width: 3),
                        Text(
                          'Budget: $budget',
                          style: const TextStyle(
                            fontSize: 11.0,
                            fontWeight: FontWeight.w500,
                            color: AppColors.secondaryTextColor,
                            fontFamily: 'poppins',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFEDEAFD),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Text(
                  '✦ $compatibility',
                  style: const TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'poppins',
                    color: AppColors.button,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),

          // Tags Row
          Wrap(
            spacing: 6.0,
            runSpacing: 4.0,
            children: tags.map((tag) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.0),
                  border: Border.all(color: const Color(0xFFE5E5F0)),
                ),
                child: Text(
                  tag,
                  style: const TextStyle(
                    fontSize: 11.0,
                    color: AppColors.secondaryTextColor,
                    fontFamily: 'poppins',
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 14.0),
          const Divider(color: Color(0xFFEBEBF5), height: 1.0),
          const SizedBox(height: 12.0),

          // Bottom Row: Move-in Date + View Profile Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Move-in',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: AppColors.secondaryTextColor,
                      fontFamily: 'poppins',
                    ),
                  ),
                  Text(
                    moveInDate,
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryTextColor,
                      fontFamily: 'poppins',
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () => Get.to(() => ChatScreen(ownerName: name)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.button,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  elevation: 0,
                ),
                child: const Text(
                  'Start Chatting',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
