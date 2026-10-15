import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/features/pg/screens/search_results/property_list.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/image_string.dart';

class RentalRequestPropertyCard extends StatelessWidget {
  const RentalRequestPropertyCard({
    super.key,
    this.title = 'Skyline Modern Studio',
    this.location = 'Ahmedabad',
    this.price = '₹25,000/mo',
    this.rating = '4.8',
    this.unitType = 'STUDIO',
    this.ownerName = 'Sarah',
    this.image = images.propertyHome1,
  });

  final String title;
  final String location;
  final String price;
  final String rating;
  final String unitType;
  final String ownerName;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        color: AppColors.propertyContainerBG,
        borderRadius: BorderRadius.circular(18.0),
        border: Border.all(color: const Color(0xFFEBEBF5)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  image,
                  width: 76,
                  height: 76,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 76,
                    height: 76,
                    color: const Color(0xFFEFF2FE),
                    child: const Icon(Icons.home, color: AppColors.button),
                  ),
                ),
              ),
              const SizedBox(width: 14.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'poppins',
                              color: AppColors.primaryTextColor,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.star, color: Color(0xFFF59E0B), size: 13),
                            const SizedBox(width: 2),
                            Text(
                              rating,
                              style: const TextStyle(
                                fontSize: 11.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'poppins',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 2.0),
                    Text(
                      location,
                      style: const TextStyle(
                        fontSize: 11.0,
                        fontFamily: 'poppins',
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                    const SizedBox(height: 6.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          price,
                          style: const TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'poppins',
                            color: AppColors.button,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEDEAFD),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Text(
                            unitType,
                            style: const TextStyle(
                              fontSize: 9.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'poppins',
                              color: AppColors.button,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          const Divider(color: Color(0xFFEBEBF5), height: 1.0),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: const Color(0xFFEDEAFD),
                    child: Text(
                      ownerName.isNotEmpty ? ownerName[0] : 'O',
                      style: const TextStyle(
                        fontSize: 11.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.button,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Owned by $ownerName',
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'poppins',
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => Get.to(() => PropertyListScreen(searchQuery: title)),
                child: const Text(
                  'View Property',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'poppins',
                    color: AppColors.button,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
