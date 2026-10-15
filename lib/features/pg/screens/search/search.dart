import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/commons/style/button_styles.dart';
import 'package:renteasy_app/commons/widgets/app_bar/appbar.dart';
import 'package:renteasy_app/commons/widgets/chips/filter_chip_pill.dart';
import 'package:renteasy_app/commons/widgets/search_bar/search_container.dart';
import 'package:renteasy_app/commons/widgets/texts/section_heading.dart';
import 'package:renteasy_app/features/pg/screens/filter/filter.dart';
import 'package:renteasy_app/features/pg/screens/search/widgets/search_popular_grid.dart';
import 'package:renteasy_app/features/pg/screens/search/widgets/search_recent_list.dart';
import 'package:renteasy_app/features/pg/screens/search_results/property_list.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  final List<String> quickFilters = ['Flat', 'PG', 'Room', 'Roommate'];
  int selectedQuickFilter = 0;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: RAppBar(
        showBackArrow: true,
        titleText: 'Search',
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
              // Search Input Field
              RSearchContainer(
                readOnly: false,
                text: 'Search by city, area, or property name',
                controller: searchController,
              ),
              SizedBox(height: AppSizes.spaceBtwSections),

              // Recent Searches
              const SearchRecentList(),
              SizedBox(height: AppSizes.spaceBtwSections),

              // Popular Locations Grid
              const SearchPopularGrid(),
              SizedBox(height: AppSizes.spaceBtwSections),

              // Quick Filters
              const RSectionHeading(title: 'Quick Filters', showActionButton: false),
              const SizedBox(height: 12.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    quickFilters.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: RFilterChipPill(
                        label: quickFilters[index],
                        isSelected: selectedQuickFilter == index,
                        onTap: () => setState(() => selectedQuickFilter = index),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
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
          child: ElevatedButton.icon(
            onPressed: () {
              final query = searchController.text.trim().isEmpty ? 'Rajkot' : searchController.text.trim();
              Get.to(() => PropertyListScreen(searchQuery: query));
            },
            icon: const Icon(Icons.search, color: Colors.white),
            label: const Text(
              'Show Properties',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'poppins'),
            ),
            style: AppButtonStyles.primaryButton,
          ),
        ),
      ),
    );
  }
}
