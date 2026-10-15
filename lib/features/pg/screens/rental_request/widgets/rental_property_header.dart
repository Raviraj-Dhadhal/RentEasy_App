import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/image_string.dart';

class RentalPropertyHeader extends StatelessWidget {
  const RentalPropertyHeader({
    super.key,
    this.title = 'Modern 1BHK Apartment',
    this.location = 'Amin Marg, Rajkot',
    this.price = '₹18,000/mo',
    this.image = images.propertyHome1,
  });

  final String title;
  final String location;
  final String price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: AppColors.propertyContainerBG,
        borderRadius: BorderRadius.circular(18.0),
        border: Border.all(color: const Color(0xFFEBEBF5)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14.0),
            child: Image.asset(
              image,
              width: 68,
              height: 68,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 68,
                height: 68,
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
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'poppins',
                    color: AppColors.primaryTextColor,
                  ),
                ),
                const SizedBox(height: 3.0),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 14, color: AppColors.secondaryTextColor),
                    const SizedBox(width: 3),
                    Expanded(
                      child: Text(
                        location,
                        style: const TextStyle(
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
                const SizedBox(height: 4.0),
                Text(
                  price,
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
