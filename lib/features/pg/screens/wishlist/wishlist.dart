import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/commons/widgets/app_bar/appbar.dart';
import 'package:renteasy_app/commons/widgets/floating_action_button/floating_action_button.dart';
import 'package:renteasy_app/features/pg/screens/search_results/property_list.dart';
import 'package:renteasy_app/features/pg/screens/wishlist/widgets/wishlist_card.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/image_string.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

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
              'Wishlist',
              style: Theme.of(context).textTheme.headlineSmall!.apply(color: AppColors.primaryTextColor).copyWith(fontWeight: FontWeight.bold),
            ),
            const Text(
              'Your saved properties',
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
              WishlistCard(
                image: images.propertyHome1,
                title: 'Skyline Modern Studio',
                location: 'Ahmedabad, Gujarat',
                price: '₹25,000',
                rating: '4.8',
                reviewCount: '120',
                tags: const ['1 BHK', '2 Baths', 'Furnished'],
                onViewDetailsTap: () => Get.to(() => const PropertyListScreen(searchQuery: 'Skyline Modern Studio')),
              ),
              const SizedBox(height: 16.0),

              WishlistCard(
                image: images.propertyHome2,
                title: 'Luxury Zen Apartment',
                location: 'Gandhinagar, Gujarat',
                price: '₹35,000',
                rating: '4.9',
                reviewCount: '85',
                tags: const ['2 BHK', '2 Baths', 'Luxury'],
                onViewDetailsTap: () => Get.to(() => const PropertyListScreen(searchQuery: 'Luxury Zen Apartment')),
              ),
              const SizedBox(height: 16.0),

              WishlistCard(
                image: images.propertyBedroom,
                title: 'Urban Loft Studio',
                location: 'Satellite, Ahmedabad',
                price: '₹18,500',
                rating: '4.7',
                reviewCount: '210',
                tags: const ['1 RK', '1 Bath', 'Minimalist'],
                onViewDetailsTap: () => Get.to(() => const PropertyListScreen(searchQuery: 'Urban Loft Studio')),
              ),
              const SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
      floatingActionButton: const RFloatingActionButton(heroTag: 'wishlist_fab'),
    );
  }
}
