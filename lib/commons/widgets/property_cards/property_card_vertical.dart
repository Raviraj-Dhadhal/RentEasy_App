import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/features/pg/screens/property_details/property_details.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class RPropertyCardVertical extends StatelessWidget {
  const RPropertyCardVertical({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.location,
    this.rating = '4.8',
    this.isFeatured = true,
    this.isFavorite = false,
    this.tags,
    this.onTap,
    this.onFavoriteTap,
    this.onViewDetailsTap,
  });

  final String image;
  final String title;
  final String price;
  final String location;
  final String rating;
  final bool isFeatured;
  final bool isFavorite;
  final List<String>? tags;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onViewDetailsTap;

  @override
  Widget build(BuildContext context) {
    final defaultAction = () => Get.to(() => PropertyDetailsScreen(
          title: title,
          location: location,
          price: price,
          rating: rating,
          image: image,
        ));

    return GestureDetector(
      onTap: onTap ?? onViewDetailsTap ?? defaultAction,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.propertyContainerBG,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: const Color(0xFFEBEBF2), width: 1.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Image with upper corner radius matching the boxRadius
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  child: Image.asset(
                    image,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 180,
                      color: const Color(0xFFF3F3FA),
                      child: const Center(
                        child: Icon(Icons.home_work_outlined, size: 48, color: AppColors.grey),
                      ),
                    ),
                  ),
                ),

                // Featured Badge
                if (isFeatured)
                  Positioned(
                    bottom: 12.0,
                    left: 12.0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        color: AppColors.button,
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: const Text(
                        'Featured',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.0,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                // Favorite Heart Button
                Positioned(
                  top: 12.0,
                  right: 12.0,
                  child: GestureDetector(
                    onTap: onFavoriteTap,
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.9),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        size: 20,
                        color: isFavorite ? Colors.red : AppColors.primaryTextColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Card Content
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title & Rating Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: AppSizes.fontSizeMd + 1,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryTextColor,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF7ED),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.star, color: Color(0xFFF59E0B), size: 14),
                            const SizedBox(width: 4),
                            Text(
                              rating,
                              style: const TextStyle(
                                fontSize: 12.0,
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFB45309),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6.0),

                  // Location
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 15,
                        color: AppColors.secondaryTextColor,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          location,
                          style: TextStyle(
                            fontSize: AppSizes.fontSizeSm,
                            fontFamily: 'poppins',
                            color: AppColors.secondaryTextColor,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  // Optional Tags
                  if (tags != null && tags!.isNotEmpty) ...[
                    const SizedBox(height: 10.0),
                    Wrap(
                      spacing: 6.0,
                      runSpacing: 4.0,
                      children: tags!.map((tag) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFF2FE),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Text(
                          tag,
                          style: const TextStyle(
                            color: AppColors.button,
                            fontSize: 11.0,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )).toList(),
                    ),
                  ],

                  const SizedBox(height: 10.0),
                  const Divider(color: Color(0xFFF0F0F6), height: 1.0),
                  const SizedBox(height: 12.0),

                  // Price & Action Button Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: price,
                          style: TextStyle(
                            color: AppColors.button,
                            fontSize: AppSizes.fontSizeLg + 1,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: ' /mo',
                              style: TextStyle(
                                color: AppColors.secondaryTextColor,
                                fontSize: AppSizes.fontSizeSm,
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: onViewDetailsTap ?? onTap ?? defaultAction,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: AppColors.button,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: const Text(
                            'View Details',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.bold,
                            ),
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
      ),
    );
  }
}
