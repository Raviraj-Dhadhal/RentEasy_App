import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/commons/style/button_styles.dart';
import 'package:renteasy_app/commons/widgets/app_bar/appbar.dart';
import 'package:renteasy_app/features/pg/screens/filter/widgets/filter_amenities.dart';
import 'package:renteasy_app/features/pg/screens/filter/widgets/filter_budget_slider.dart';
import 'package:renteasy_app/features/pg/screens/filter/widgets/filter_property_type.dart';
import 'package:renteasy_app/features/pg/screens/filter/widgets/filter_room_type.dart';
import 'package:renteasy_app/features/pg/screens/search_results/property_list.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: RAppBar(
        showBackArrow: true,
        titleText: 'Filters',
        trailing: TextButton(
          onPressed: () {
            // Reset filter logic
            Get.snackbar('Reset', 'Filters reset to default', snackPosition: SnackPosition.BOTTOM);
          },
          child: const Text(
            'Reset',
            style: TextStyle(
              color: AppColors.button,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              fontFamily: 'poppins',
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Budget Range Slider
              const FilterBudgetSlider(),
              SizedBox(height: AppSizes.spaceBtwSections),

              // Property Type & Gender Selection
              const FilterPropertyType(),
              SizedBox(height: AppSizes.spaceBtwSections),

              // Room Type 2x2 Grid
              const FilterRoomType(),
              SizedBox(height: AppSizes.spaceBtwSections),

              // Amenities, Availability & Distance
              const FilterAmenities(),
              SizedBox(height: AppSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(AppSizes.md),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          child: ElevatedButton(
            onPressed: () => Get.to(() => const PropertyListScreen(searchQuery: 'Filtered Properties')),
            style: AppButtonStyles.primaryButton,
            child: const Text(
              'Show 128 Properties',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'poppins'),
            ),
          ),
        ),
      ),
    );
  }
}
