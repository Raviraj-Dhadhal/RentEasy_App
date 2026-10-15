import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/commons/widgets/app_bar/appbar.dart';
import 'package:renteasy_app/commons/widgets/floating_action_button/floating_action_button.dart';
import 'package:renteasy_app/commons/widgets/search_bar/search_container.dart';
import 'package:renteasy_app/features/pg/screens/filter/filter.dart';
import 'package:renteasy_app/features/pg/screens/home/widgets/home_category_chips.dart';
import 'package:renteasy_app/features/pg/screens/home/widgets/home_featured_section.dart';
import 'package:renteasy_app/features/pg/screens/home/widgets/home_nearby_section.dart';
import 'package:renteasy_app/features/pg/screens/home/widgets/home_promo_banner.dart';
import 'package:renteasy_app/features/pg/screens/map_view/property_map.dart';
import 'package:renteasy_app/features/pg/screens/profile/profile.dart';
import 'package:renteasy_app/features/pg/screens/search/search.dart';
import 'package:renteasy_app/navigation_menu.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/image_string.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';
import 'package:renteasy_app/utilities/constants/text_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // header, 
            Container(
              child: Column(
                children: [
                  RAppBar(
                    showBackArrow: false,
                    titleText: AppTexts.homeAppbarTitle,
                    trailing: GestureDetector(
                      onTap: () {
                        if (Get.isRegistered<NavigationController>()) {
                          Get.find<NavigationController>().selectedIndex.value = 4; // Navigate to Profile tab
                        } else {
                          Get.to(() => const ProfileScreen());
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.button, width: 2),
                        ),
                        padding: const EdgeInsets.all(2),
                        child: const CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(images.userProfileImage),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Body Content
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8.0),

                  // Search Bar with Filter Icon
                  RSearchContainer(
                    text: 'Search rooms, flats, PGs...',
                    trailingIcon: Icons.tune,
                    onTap: () => Get.to(() => const SearchScreen()),
                    onTrailingTap: () => Get.to(() => const FilterScreen()),
                  ),
                  SizedBox(height: AppSizes.spaceBtwSections),

                  // Category Pills
                  const HomeCategoryChips(),
                  SizedBox(height: AppSizes.spaceBtwSections),

                  // Promo Banner Card ("Find your perfect stay")
                  const HomePromoBanner(),
                  SizedBox(height: AppSizes.spaceBtwSections),

                  // Featured Properties Section
                  const HomeFeaturedSection(),
                  SizedBox(height: AppSizes.spaceBtwSections),

                  // Nearby You Section
                  const HomeNearbySection(),
                  const SizedBox(height: 36.0),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const RFloatingActionButton(heroTag: 'home_fab'),
    );
  }
}
