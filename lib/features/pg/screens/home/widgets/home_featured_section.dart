import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/commons/widgets/property_cards/property_card_vertical.dart';
import 'package:renteasy_app/commons/widgets/texts/section_heading.dart';
import 'package:renteasy_app/features/pg/screens/featured/featured_properties.dart';
import 'package:renteasy_app/features/pg/screens/search_results/property_list.dart';
import 'package:renteasy_app/utilities/constants/image_string.dart';

class HomeFeaturedSection extends StatelessWidget {
  const HomeFeaturedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RSectionHeading(
          title: 'Featured Properties',
          buttonTitle: 'See All',
          onPressed: () => Get.to(() => const FeaturedPropertiesScreen()),
        ),
        const SizedBox(height: 12.0),

        // Featured Card 1
        RPropertyCardVertical(
          image: images.propertyHome1,
          title: 'Luxury Studio',
          location: 'Downtown, NY',
          price: '₹12,000',
          rating: '4.8',
          isFeatured: true,
          tags: const ['Wi-Fi', 'AC', 'Furnished'],
          onViewDetailsTap: () => Get.to(() => const PropertyListScreen(searchQuery: 'Luxury Studio')),
        ),
        const SizedBox(height: 16.0),

        // Featured Card 2
        RPropertyCardVertical(
          image: images.propertyHome2,
          title: 'Skyline Penthouse',
          location: 'Upper East, NY',
          price: '₹25,000',
          rating: '4.9',
          isFeatured: true,
          tags: const ['Parking', 'Kitchen', 'Attached Bath'],
          onViewDetailsTap: () => Get.to(() => const PropertyListScreen(searchQuery: 'Skyline Penthouse')),
        ),
      ],
    );
  }
}
