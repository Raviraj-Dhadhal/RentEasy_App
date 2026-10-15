import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class PropertyDetailAmenities extends StatelessWidget {
  const PropertyDetailAmenities({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> amenities = [
      {'title': 'WiFi', 'icon': Icons.wifi},
      {'title': 'AC', 'icon': Icons.ac_unit},
      {'title': 'Security', 'icon': Icons.shield_outlined},
      {'title': 'Gym', 'icon': Icons.fitness_center},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Amenities',
          style: TextStyle(
            fontSize: AppSizes.fontSizeMd,
            fontWeight: FontWeight.bold,
            fontFamily: 'poppins',
            color: AppColors.primaryTextColor,
          ),
        ),
        const SizedBox(height: 10.0),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: amenities.map((item) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: AppColors.propertyContainerBG,
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: const Color(0xFFEBEBF5)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(item['icon'], size: 16, color: AppColors.secondaryTextColor),
                  const SizedBox(width: 6),
                  Text(
                    item['title'],
                    style: TextStyle(
                      fontSize: AppSizes.fontSizeXs,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
