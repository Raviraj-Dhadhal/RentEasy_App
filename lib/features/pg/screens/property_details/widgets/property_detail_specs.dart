import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class PropertyDetailSpecs extends StatelessWidget {
  const PropertyDetailSpecs({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> specs = [
      {'title': '2 Bedrooms', 'icon': Icons.bed_outlined},
      {'title': '2 Bathrooms', 'icon': Icons.bathtub_outlined},
      {'title': '1200 sq ft', 'icon': Icons.square_foot_outlined},
      {'title': 'Furnished', 'icon': Icons.chair_outlined},
      {'title': 'Parking', 'icon': Icons.local_parking_outlined},
      {'title': '4th Floor', 'icon': Icons.layers_outlined},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: specs.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.35,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemBuilder: (context, index) {
        final spec = specs[index];
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: AppColors.propertyContainerBG,
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(color: const Color(0xFFEBEBF5)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(spec['icon'], size: 20, color: AppColors.button),
              const SizedBox(height: 6.0),
              Text(
                spec['title'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: AppSizes.fontSizeXs - 1,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'poppins',
                  color: AppColors.primaryTextColor,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
  }
}
