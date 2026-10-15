import 'package:flutter/material.dart';
import 'package:renteasy_app/commons/widgets/texts/section_heading.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/image_string.dart';

class RoommateRecommendedSection extends StatelessWidget {
  const RoommateRecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> recommended = [
      {
        'name': 'Rohan, 26',
        'profession': 'Software Engineer',
        'match': '98% Match',
        'image': images.propertyHome1,
      },
      {
        'name': 'Priya, 23',
        'profession': 'Graphic Designer',
        'match': '92% Match',
        'image': images.propertyBedroom,
      },
      {
        'name': 'Rahul, 28',
        'profession': 'Data Scientist',
        'match': '90% Match',
        'image': images.propertyHome2,
      },
    ];

    return Column(
      children: [
        RSectionHeading(
          title: 'Recommended for You',
          buttonTitle: 'See all',
          onPressed: () {},
        ),
        const SizedBox(height: 12.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: recommended.map((item) {
              return Container(
                width: 170,
                margin: const EdgeInsets.only(right: 12.0),
                decoration: BoxDecoration(
                  color: AppColors.propertyContainerBG,
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(color: const Color(0xFFEBEBF5)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                          child: Image.asset(
                            item['image']!,
                            height: 110,
                            width: 170,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(
                              height: 110,
                              color: const Color(0xFFEDEAFD),
                              child: const Icon(Icons.person, color: AppColors.button, size: 40),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 8.0,
                          right: 8.0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF8B5CF6), Color(0xFF5B5FEF)],
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Text(
                              item['match']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'poppins',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['name']!,
                            style: const TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'poppins',
                              color: AppColors.primaryTextColor,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2.0),
                          Text(
                            item['profession']!,
                            style: const TextStyle(
                              fontSize: 11.0,
                              fontFamily: 'poppins',
                              color: AppColors.secondaryTextColor,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
