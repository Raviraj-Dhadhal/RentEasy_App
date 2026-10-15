import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/image_string.dart';

class GalleryHeroImage extends StatelessWidget {
  const GalleryHeroImage({
    super.key,
    this.image = images.propertyLivingRoom,
    this.countText = '1/12',
  });

  final String image;
  final String countText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.asset(
            image,
            width: double.infinity,
            height: 220,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              height: 220,
              color: const Color(0xFFEFF2FE),
              child: const Icon(Icons.photo_library_outlined, size: 48, color: AppColors.button),
            ),
          ),
        ),
        Positioned(
          bottom: 14.0,
          right: 14.0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.65),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Text(
              countText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'poppins',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
