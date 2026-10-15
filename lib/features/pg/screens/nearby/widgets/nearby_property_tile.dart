import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/features/pg/screens/search_results/property_list.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class NearbyPropertyTile extends StatelessWidget {
  const NearbyPropertyTile({
    super.key,
    required this.image,
    required this.title,
    required this.distance,
    required this.location,
    required this.price,
    required this.rating,
  });

  final String image;
  final String title;
  final String distance;
  final String location;
  final String price;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => PropertyListScreen(searchQuery: title)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: AppColors.propertyContainerBG,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: const Color(0xFFEBEBF5)),
        ),
        child: Row(
          children: [
            // Left Image with Rating badge
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14.0),
                  child: Image.asset(
                    image,
                    width: 84,
                    height: 84,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 84,
                      height: 84,
                      color: const Color(0xFFE5E7EB),
                      child: const Icon(Icons.home, color: AppColors.grey),
                    ),
                  ),
                ),
                Positioned(
                  top: 4,
                  left: 4,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.95),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star, color: Color(0xFFF59E0B), size: 10),
                        const SizedBox(width: 2),
                        Text(
                          rating,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'poppins',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 14.0),

            // Middle Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: AppSizes.fontSizeSm + 1,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'poppins',
                      color: AppColors.primaryTextColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3.0),
                  Text(
                    distance,
                    style: const TextStyle(
                      fontSize: 11.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'poppins',
                      color: AppColors.button,
                    ),
                  ),
                  const SizedBox(height: 3.0),
                  Text(
                    location,
                    style: TextStyle(
                      fontSize: 11.0,
                      fontFamily: 'poppins',
                      color: AppColors.secondaryTextColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6.0),
                  RichText(
                    text: TextSpan(
                      text: price,
                      style: const TextStyle(
                        color: AppColors.button,
                        fontSize: 14.0,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.bold,
                      ),
                      children: const [
                        TextSpan(
                          text: ' /mo',
                          style: TextStyle(
                            color: AppColors.secondaryTextColor,
                            fontSize: 10.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Trailing Chevron
            const Icon(Icons.chevron_right, size: 20, color: AppColors.secondaryTextColor),
          ],
        ),
      ),
    );
  }
}
