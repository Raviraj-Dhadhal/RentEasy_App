import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/commons/widgets/chips/filter_chip_pill.dart';
import 'package:renteasy_app/features/pg/screens/search_results/property_list.dart';

class HomeCategoryChips extends StatefulWidget {
  const HomeCategoryChips({super.key});

  @override
  State<HomeCategoryChips> createState() => _HomeCategoryChipsState();
}

class _HomeCategoryChipsState extends State<HomeCategoryChips> {
  int selectedCategoryIndex = 0;

  final List<String> categoriesRow1 = ['Flat', 'PG', 'Room', 'Roommate'];
  final List<String> categoriesRow2 = ['Hostel', 'Villa', 'Studio', 'Co-Living'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row 1
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              categoriesRow1.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: RFilterChipPill(
                  label: categoriesRow1[index],
                  isSelected: selectedCategoryIndex == index,
                  onTap: () {
                    setState(() => selectedCategoryIndex = index);
                    Get.to(() => PropertyListScreen(searchQuery: categoriesRow1[index]));
                  },
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8.0),

        // Row 2
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              categoriesRow2.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: RFilterChipPill(
                  label: categoriesRow2[index],
                  isSelected: selectedCategoryIndex == index + 4,
                  onTap: () {
                    setState(() => selectedCategoryIndex = index + 4);
                    Get.to(() => PropertyListScreen(searchQuery: categoriesRow2[index]));
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
