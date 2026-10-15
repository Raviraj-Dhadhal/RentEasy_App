import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class BookVisitPropertyCard extends StatelessWidget {
  const BookVisitPropertyCard({
    super.key,
    required this.image,
    required this.title,
    required this.location,
    required this.price,
  });

  final String image;
  final String title;
  final String location;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: AppColors.propertyContainerBG,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: const Color(0xFFEBEBF5)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              image,
              width: 72,
              height: 72,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 72,
                height: 72,
                color: const Color(0xFFEFF2FE),
                child: const Icon(Icons.home, color: AppColors.button),
              ),
            ),
          ),
          const SizedBox(width: 14.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: AppSizes.fontSizeMd,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'poppins',
                    color: AppColors.primaryTextColor,
                  ),
                ),
                const SizedBox(height: 4.0),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 14, color: AppColors.secondaryTextColor),
                    const SizedBox(width: 3),
                    Expanded(
                      child: Text(
                        location,
                        style: TextStyle(
                          fontSize: 11.0,
                          fontFamily: 'poppins',
                          color: AppColors.secondaryTextColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6.0),
                Text(
                  '$price/mo',
                  style: const TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'poppins',
                    color: AppColors.button,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
