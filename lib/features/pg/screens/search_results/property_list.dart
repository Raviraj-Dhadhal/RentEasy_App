import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/commons/widgets/app_bar/appbar.dart';
import 'package:renteasy_app/commons/widgets/floating_action_button/floating_action_button.dart';
import 'package:renteasy_app/commons/widgets/property_cards/property_card_vertical.dart';
import 'package:renteasy_app/features/pg/screens/filter/filter.dart';
import 'package:renteasy_app/features/pg/screens/map_view/property_map.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/image_string.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class PropertyListScreen extends StatefulWidget {
  const PropertyListScreen({super.key, this.searchQuery = 'Rajkot'});

  final String searchQuery;

  @override
  State<PropertyListScreen> createState() => _PropertyListScreenState();
}

class _PropertyListScreenState extends State<PropertyListScreen> {
  final List<String> activeFilterTags = ['Price: Low to High ✕', 'Apartment', '2+ BHK'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: RAppBar(
        showBackArrow: true,
        titleText: widget.searchQuery,
        trailing: IconButton(
          icon: const Icon(Icons.tune, color: AppColors.button),
          onPressed: () => Get.to(() => const FilterScreen()),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Results Count
              Text(
                '128 properties found in ${widget.searchQuery}',
                style: TextStyle(
                  fontSize: AppSizes.fontSizeSm,
                  color: AppColors.secondaryTextColor,
                  fontFamily: 'poppins',
                ),
              ),
              const SizedBox(height: 10.0),

              // Filter Summary Chips
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: activeFilterTags.map((tag) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                      decoration: BoxDecoration(
                        color: tag.contains('Price') ? AppColors.button : const Color(0xFFF1F1F8),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Text(
                        tag,
                        style: TextStyle(
                          color: tag.contains('Price') ? Colors.white : AppColors.secondaryTextColor,
                          fontSize: 11.0,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )).toList(),
                ),
              ),
              const SizedBox(height: 16.0),

              // Property List Cards
              RPropertyCardVertical(
                image: images.propertyHome1,
                title: 'Modern 2BHK Apartment',
                location: 'Kalawad Road, ${widget.searchQuery}',
                price: '₹12,000',
                rating: '4.8',
                tags: const ['Wi-Fi', 'AC', 'Furnished'],
              ),
              const SizedBox(height: 16.0),

              RPropertyCardVertical(
                image: images.propertyHome2Living,
                title: 'Cozy PG for Students',
                location: 'Yagnik Road, ${widget.searchQuery}',
                price: '₹8,500',
                rating: '4.6',
                tags: const ['High-speed Net', 'Meals'],
              ),
              const SizedBox(height: 16.0),

              RPropertyCardVertical(
                image: images.propertyHome3,
                title: 'Elite Studio Loft',
                location: 'Amin Marg, ${widget.searchQuery}',
                price: '₹18,000',
                rating: '4.9',
                tags: const ['Cleaning', 'Parking'],
              ),
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
      floatingActionButton: RFloatingActionButton(
        heroTag: 'search_results_fab',
        onPressed: () => Get.to(() => PropertyMapScreen(locationName: widget.searchQuery)),
      ),
    );
  }
}
