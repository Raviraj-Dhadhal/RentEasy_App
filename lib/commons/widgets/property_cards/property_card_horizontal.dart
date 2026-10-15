import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class RPropertyCardHorizontal extends StatelessWidget {
  const RPropertyCardHorizontal({
    super.key,
    required this.image,
    required this.title,
    required this.location,
    required this.price,
    this.rating,
    this.showViewButton = false,
    this.onTap,
  });

  final String image;
  final String title;
  final String location;
  final String price;
  final String? rating;
  final bool showViewButton;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 280,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: AppColors.propertyContainerBG,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: const Color(0xFFEBEBF2), width: 1.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            // Left Thumbnail
            Stack(
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
                      color: const Color(0xFFF3F3FA),
                      child: const Icon(Icons.home, color: AppColors.grey),
                    ),
                  ),
                ),
                if (rating != null)
                  Positioned(
                    top: 4,
                    left: 4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.star, color: Color(0xFFF59E0B), size: 10),
                          const SizedBox(width: 2),
                          Text(
                            rating!,
                            style: const TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'poppins',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12.0),

            // Right Information
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: AppSizes.fontSizeSm,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryTextColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 13,
                        color: AppColors.secondaryTextColor,
                      ),
                      const SizedBox(width: 2),
                      Expanded(
                        child: Text(
                          location,
                          style: TextStyle(
                            fontSize: 11.0,
                            fontFamily: 'poppins',
                            color: AppColors.secondaryTextColor,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: price,
                          style: const TextStyle(
                            color: AppColors.button,
                            fontSize: 13.0,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.bold,
                          ),
                          children: const [
                            TextSpan(
                              text: ' /mo',
                              style: TextStyle(
                                color: AppColors.secondaryTextColor,
                                fontSize: 10.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (showViewButton)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 5.0),
                          decoration: BoxDecoration(
                            color: AppColors.button,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: const Text(
                            'View',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11.0,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.bold,
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
