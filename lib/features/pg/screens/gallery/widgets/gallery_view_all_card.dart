import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';

class GalleryViewAllCard extends StatelessWidget {
  const GalleryViewAllCard({
    super.key,
    required this.image,
    this.totalPhotos = '12',
    this.onTap,
  });

  final String image;
  final String totalPhotos;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Kitchen & Bathroom',
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'poppins',
            color: AppColors.primaryTextColor,
          ),
        ),
        const SizedBox(height: 10.0),
        Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  image,
                  height: 130,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 130,
                    color: const Color(0xFFEFF2FE),
                    child: const Icon(Icons.kitchen, color: AppColors.button),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  height: 130,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEDEAFD),
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(color: const Color(0xFFDFDAFB)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: AppColors.button.withValues(alpha: 0.15),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.arrow_forward_rounded, color: AppColors.button, size: 20),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'View All Photos',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.button,
                          fontFamily: 'poppins',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
