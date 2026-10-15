import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/commons/widgets/texts/section_heading.dart';
import 'package:renteasy_app/features/pg/screens/search_results/property_list.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class SearchRecentList extends StatelessWidget {
  const SearchRecentList({super.key});

  final List<String> recentSearches = const [
    'Gondal Road, Rajkot',
    'Satellite, Ahmedabad',
    'VIP Road, Baroda',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const RSectionHeading(title: 'Recent Searches', showActionButton: false),
        const SizedBox(height: 12.0),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: recentSearches.map((item) => GestureDetector(
            onTap: () => Get.to(() => PropertyListScreen(searchQuery: item)),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: const Color(0xFFE4E4ED)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.history, size: 16.0, color: AppColors.secondaryTextColor),
                  const SizedBox(width: 6.0),
                  Text(
                    item,
                    style: TextStyle(
                      color: AppColors.primaryTextColor,
                      fontSize: AppSizes.fontSizeSm,
                      fontFamily: 'poppins',
                    ),
                  ),
                ],
              ),
            ),
          )).toList(),
        ),
      ],
    );
  }
}
