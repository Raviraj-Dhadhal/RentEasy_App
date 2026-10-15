import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/commons/widgets/texts/section_heading.dart';
import 'package:renteasy_app/features/pg/screens/search_results/property_list.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/image_string.dart';

class OwnerListedProperties extends StatelessWidget {
  const OwnerListedProperties({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RSectionHeading(
          title: 'Listed Properties',
          buttonTitle: 'View all',
          onPressed: () => Get.to(() => const PropertyListScreen(searchQuery: 'Rajkot')),
        ),
        const SizedBox(height: 12.0),
        _buildPropertyTile(
          image: images.propertyHome1,
          title: 'Modern Studio',
          location: 'Rajkot',
          rating: '4.8',
          price: '₹15,000/mo',
        ),
        const SizedBox(height: 10.0),
        _buildPropertyTile(
          image: images.propertyHome2,
          title: 'Luxury Loft',
          location: 'Rajkot East',
          rating: '4.9',
          price: '₹22,000/mo',
        ),
      ],
    );
  }

  Widget _buildPropertyTile({
    required String image,
    required String title,
    required String location,
    required String rating,
    required String price,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
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
              width: 64,
              height: 64,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 64,
                height: 64,
                color: const Color(0xFFEFF2FE),
                child: const Icon(Icons.home, color: AppColors.button),
              ),
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'poppins',
                        color: AppColors.primaryTextColor,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star, color: Color(0xFFF59E0B), size: 12),
                        const SizedBox(width: 2),
                        Text(
                          rating,
                          style: const TextStyle(
                            fontSize: 11.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'poppins',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  location,
                  style: const TextStyle(
                    fontSize: 11.0,
                    color: AppColors.secondaryTextColor,
                    fontFamily: 'poppins',
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.button,
                    fontFamily: 'poppins',
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
