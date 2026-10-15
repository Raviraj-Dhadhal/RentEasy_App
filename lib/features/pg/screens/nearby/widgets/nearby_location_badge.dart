import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class NearbyLocationBadge extends StatelessWidget {
  const NearbyLocationBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
          decoration: BoxDecoration(
            color: const Color(0xFFEFF2FE),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.location_on, size: 14.0, color: AppColors.button),
              SizedBox(width: 4.0),
              Text(
                'Current Location • Rajkot',
                style: TextStyle(
                  color: AppColors.button,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'poppins',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          'Properties within 5 km of your location',
          style: TextStyle(
            fontSize: AppSizes.fontSizeSm,
            color: AppColors.secondaryTextColor,
            fontFamily: 'poppins',
          ),
        ),
      ],
    );
  }
}
