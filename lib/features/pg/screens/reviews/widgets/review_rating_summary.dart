import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';

class ReviewRatingSummary extends StatelessWidget {
  const ReviewRatingSummary({
    super.key,
    this.rating = '4.8',
    this.reviewCount = '124',
  });

  final String rating;
  final String reviewCount;

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
      child: Row(
        children: [
          // Left Rating Box
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
            decoration: BoxDecoration(
              color: const Color(0xFFEDEAFD),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      rating,
                      style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'poppins',
                        color: AppColors.button,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.star, color: AppColors.button, size: 20),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  '$reviewCount Reviews',
                  style: const TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w600,
                    color: AppColors.secondaryTextColor,
                    fontFamily: 'poppins',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16.0),

          // Right Breakdown Bars
          Expanded(
            child: Column(
              children: [
                _buildStarRow(5, 0.85),
                const SizedBox(height: 4),
                _buildStarRow(4, 0.15),
                const SizedBox(height: 4),
                _buildStarRow(3, 0.05),
                const SizedBox(height: 4),
                _buildStarRow(2, 0.02),
                const SizedBox(height: 4),
                _buildStarRow(1, 0.01),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStarRow(int starCount, double progress) {
    return Row(
      children: [
        Text(
          '$starCount',
          style: const TextStyle(
            fontSize: 10.0,
            color: AppColors.secondaryTextColor,
            fontWeight: FontWeight.w600,
            fontFamily: 'poppins',
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 5,
              backgroundColor: const Color(0xFFE5E5F0),
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.button),
            ),
          ),
        ),
      ],
    );
  }
}
