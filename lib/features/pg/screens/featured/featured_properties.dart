import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/commons/widgets/app_bar/appbar.dart';
import 'package:renteasy_app/commons/widgets/property_cards/property_card_vertical.dart';
import 'package:renteasy_app/features/pg/screens/search_results/property_list.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/image_string.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class FeaturedPropertiesScreen extends StatelessWidget {
  const FeaturedPropertiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: RAppBar(
        showBackArrow: true,
        showLogout: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Featured Properties',
              style: Theme.of(context).textTheme.headlineSmall!.apply(color: AppColors.primaryTextColor).copyWith(fontWeight: FontWeight.bold),
            ),
            const Text(
              'Handpicked homes recommended for you',
              style: TextStyle(
                fontSize: 12.0,
                color: AppColors.secondaryTextColor,
                fontFamily: 'poppins',
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.md),
          child: Column(
            children: [
              RPropertyCardVertical(
                image: images.propertyHome1,
                title: 'Skyline Penthouse',
                location: 'Upper East Side, NY',
                price: '₹25,000',
                rating: '4.9',
                isFeatured: true,
                tags: const ['Furnished', 'Wi-Fi', 'Parking'],
                onViewDetailsTap: () => Get.to(() => const PropertyListScreen(searchQuery: 'Skyline Penthouse')),
              ),
              const SizedBox(height: 16.0),

              RPropertyCardVertical(
                image: images.propertyHome2,
                title: 'Modern 2BHK Apartment',
                location: 'Rajkot, Gujarat',
                price: '₹35,000',
                rating: '4.8',
                isFeatured: true,
                tags: const ['Semi-Furnished', 'Gym', 'Pool'],
                onViewDetailsTap: () => Get.to(() => const PropertyListScreen(searchQuery: 'Modern 2BHK Apartment')),
              ),
              const SizedBox(height: 16.0),

              RPropertyCardVertical(
                image: images.propertyHome3,
                title: 'Luxury Glass Villa',
                location: 'Aspen, Colorado',
                price: '₹82,000',
                rating: '5.0',
                isFeatured: true,
                tags: const ['Private Pool', 'Smart Home', '6 Car Garage'],
                onViewDetailsTap: () => Get.to(() => const PropertyListScreen(searchQuery: 'Luxury Glass Villa')),
              ),
              const SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
    );
  }
}
