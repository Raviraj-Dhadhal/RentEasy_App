import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/features/pg/screens/reviews/reviews_screen.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class PropertyDetailReviewsPreview extends StatelessWidget {
  const PropertyDetailReviewsPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Get.to(() => const ReviewsScreen()),
              child: Text(
                'Reviews',
                style: TextStyle(
                  fontSize: AppSizes.fontSizeMd,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'poppins',
                  color: AppColors.primaryTextColor,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Get.to(() => const ReviewsScreen()),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Color(0xFFF59E0B), size: 14),
                  const SizedBox(width: 4),
                  Text(
                    '4.8 (124)',
                    style: TextStyle(
                      fontSize: AppSizes.fontSizeXs,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'poppins',
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                  const Icon(Icons.chevron_right, size: 18, color: AppColors.secondaryTextColor),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0),

        // Review item 1
        _buildReviewItem(
          name: 'Ananya Sharma',
          rating: 5,
          comment: 'The apartment is even better in person. Great location and the landlord was very helpful!',
        ),
        const SizedBox(height: 10.0),

        // Review item 2
        _buildReviewItem(
          name: 'Rahul Verma',
          rating: 4,
          comment: 'Smooth check-in process. The locality is very quiet and safe.',
        ),
      ],
    );
  }

  Widget _buildReviewItem({required String name, required int rating, required String comment}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: AppColors.propertyContainerBG,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: const Color(0xFFEBEBF5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: AppSizes.fontSizeXs,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'poppins',
                  color: AppColors.primaryTextColor,
                ),
              ),
              Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    Icons.star,
                    size: 12,
                    color: index < rating ? const Color(0xFFF59E0B) : const Color(0xFFE5E7EB),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4.0),
          Text(
            comment,
            style: TextStyle(
              fontSize: AppSizes.fontSizeXs - 1,
              color: AppColors.secondaryTextColor,
              height: 1.35,
              fontFamily: 'poppins',
            ),
          ),
        ],
      ),
    );
  }
}
