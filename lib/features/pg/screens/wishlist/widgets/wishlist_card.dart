import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/features/pg/screens/property_details/property_details.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class WishlistCard extends StatefulWidget {
  const WishlistCard({
    super.key,
    required this.image,
    required this.title,
    required this.location,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.tags,
    this.onViewDetailsTap,
  });

  final String image;
  final String title;
  final String location;
  final String price;
  final String rating;
  final String reviewCount;
  final List<String> tags;
  final VoidCallback? onViewDetailsTap;

  @override
  State<WishlistCard> createState() => _WishlistCardState();
}

class _WishlistCardState extends State<WishlistCard> {
  bool isFavorite = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.propertyContainerBG,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: const Color(0xFFEBEBF2), width: 1.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with upper corner radius
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                child: Image.asset(
                  widget.image,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 180,
                    color: const Color(0xFFF3F3FA),
                    child: const Icon(Icons.home_work_outlined, size: 48, color: AppColors.grey),
                  ),
                ),
              ),

              // Rating Pill on Image
              Positioned(
                bottom: 12.0,
                left: 12.0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.95),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star, color: Color(0xFFF59E0B), size: 14),
                      const SizedBox(width: 4),
                      Text(
                        '${widget.rating} (${widget.reviewCount})',
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'poppins',
                          color: AppColors.primaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Favorite Heart Button (active red)
              Positioned(
                top: 12.0,
                right: 12.0,
                child: GestureDetector(
                  onTap: () => setState(() => isFavorite = !isFavorite),
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.95),
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

          // Details
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: AppSizes.fontSizeMd + 1,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryTextColor,
                  ),
                ),
                const SizedBox(height: 6.0),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 15, color: AppColors.secondaryTextColor),
                    const SizedBox(width: 4),
                    Text(
                      widget.location,
                      style: TextStyle(
                        fontSize: AppSizes.fontSizeSm,
                        fontFamily: 'poppins',
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),

                // Tags Row (e.g. 1 BHK • 2 Baths • Furnished)
                Wrap(
                  spacing: 6.0,
                  children: widget.tags.map((tag) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F3FA),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      tag,
                      style: const TextStyle(
                        color: AppColors.secondaryTextColor,
                        fontSize: 11.0,
                        fontFamily: 'poppins',
                      ),
                    ),
                  )).toList(),
                ),
                const SizedBox(height: 12.0),

                // Price & Action Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: widget.price,
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
                      onTap: widget.onViewDetailsTap ?? () => Get.to(() => PropertyDetailsScreen(
                            title: widget.title,
                            location: widget.location,
                            price: widget.price,
                            rating: widget.rating,
                            image: widget.image,
                          )),
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
    );
  }
}
