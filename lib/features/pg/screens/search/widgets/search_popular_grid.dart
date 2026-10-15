import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/commons/widgets/texts/section_heading.dart';
import 'package:renteasy_app/features/pg/screens/search_results/property_list.dart';
import 'package:renteasy_app/utilities/constants/image_string.dart';

class SearchPopularGrid extends StatelessWidget {
  const SearchPopularGrid({super.key});

  final List<Map<String, String>> popularCities = const [
    {'name': 'Rajkot', 'image': images.cityRajkot},
    {'name': 'Ahmedabad', 'image': images.cityAhmedabad},
    {'name': 'Baroda', 'image': images.cityBaroda},
    {'name': 'Surat', 'image': images.citySurat},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RSectionHeading(
          title: 'Popular Locations',
          buttonTitle: 'View all',
          onPressed: () {},
        ),
        const SizedBox(height: 12.0),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.45,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
          ),
          itemCount: popularCities.length,
          itemBuilder: (context, index) {
            final city = popularCities[index];

            return GestureDetector(
              onTap: () => Get.to(() => PropertyListScreen(searchQuery: city['name']!)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      city['image']!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: const Color(0xFFF3F3FA),
                        child: Center(child: Text(city['name']!)),
                      ),
                    ),
                    // Dark Bottom Gradient for text readability
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withValues(alpha: 0.65),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10.0,
                      left: 12.0,
                      child: Text(
                        city['name']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'poppins',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
