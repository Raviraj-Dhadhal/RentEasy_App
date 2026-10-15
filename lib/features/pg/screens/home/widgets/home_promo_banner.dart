import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/features/pg/screens/search/search.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class HomePromoBanner extends StatelessWidget {
  const HomePromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        gradient: AppColors.linearBoxGradient,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.button.withValues(alpha: 0.3),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Text & Button
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Find your\nperfect stay',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: AppSizes.fontSizeLg + 2,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 14.0),
                GestureDetector(
                  onTap: () => Get.to(() => const SearchScreen()),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Text(
                      'Explore Now',
                      style: TextStyle(
                        color: AppColors.button,
                        fontSize: 12.0,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Right Decorative Building Icon Graphic
          Icon(
            Icons.apartment_rounded,
            size: 80.0,
            color: Colors.white.withValues(alpha: 0.35),
          ),
        ],
      ),
    );
  }
}
