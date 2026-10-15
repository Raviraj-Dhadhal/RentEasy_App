import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/commons/widgets/property_cards/property_card_horizontal.dart';
import 'package:renteasy_app/commons/widgets/texts/section_heading.dart';
import 'package:renteasy_app/features/pg/screens/map_view/property_map.dart';
import 'package:renteasy_app/features/pg/screens/nearby/nearby_properties.dart';
import 'package:renteasy_app/utilities/constants/image_string.dart';

class HomeNearbySection extends StatelessWidget {
  const HomeNearbySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RSectionHeading(
          title: 'Nearby You',
          buttonTitle: 'View Map',
          onPressed: () => Get.to(() => const NearbyPropertiesScreen()),
        ),
        const SizedBox(height: 12.0),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              RPropertyCardHorizontal(
                image: images.propertyHome3,
                title: 'Cozy Urban Nest',
                location: 'Brooklyn, NY',
                price: '₹8,500',
                rating: '4.7',
                onTap: () => Get.to(() => const PropertyMapScreen()),
              ),
              const SizedBox(width: 12.0),
              RPropertyCardHorizontal(
                image: images.propertyBedroom,
                title: 'Comfort PG Stay',
                location: 'Queens, NY',
                price: '₹6,500',
                rating: '4.5',
                onTap: () => Get.to(() => const PropertyMapScreen()),
              ),
              const SizedBox(width: 12.0),
              RPropertyCardHorizontal(
                image: images.propertyKitchen,
                title: 'Modern Studio Flat',
                location: 'Hoboken, NY',
                price: '₹10,500',
                rating: '4.8',
                onTap: () => Get.to(() => const PropertyMapScreen()),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
