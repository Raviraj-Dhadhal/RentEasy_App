import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';

class OwnerReviewCard extends StatelessWidget {
  const OwnerReviewCard({
    super.key,
    this.initials = 'AS',
    this.name = 'Anish Sharma',
    this.rating = 5,
    this.review = 'Rajesh is an excellent owner. He responds very quickly to maintenance requests and ensured the moving process was seamless.',
  });

  final String initials;
  final String name;
  final int rating;
  final String review;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        color: AppColors.propertyContainerBG,
        borderRadius: BorderRadius.circular(18.0),
        border: Border.all(color: const Color(0xFFEBEBF5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: const Color(0xFFEDEAFD),
                child: Text(
                  initials,
                  style: const TextStyle(
                    fontSize: 11.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.button,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryTextColor,
                        fontFamily: 'poppins',
                      ),
                    ),
                    Row(
                      children: List.generate(
                        rating,
                        (index) => const Icon(Icons.star, color: Color(0xFFF59E0B), size: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(
            '"$review"',
            style: const TextStyle(
              fontSize: 12.0,
              fontStyle: FontStyle.italic,
              height: 1.4,
              color: AppColors.secondaryTextColor,
              fontFamily: 'poppins',
            ),
          ),
        ],
      ),
    );
  }
}
