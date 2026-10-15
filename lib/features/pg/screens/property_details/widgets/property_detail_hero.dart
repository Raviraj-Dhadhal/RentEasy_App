import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/features/pg/screens/gallery/gallery.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/image_string.dart';

class PropertyDetailHero extends StatefulWidget {
  const PropertyDetailHero({
    super.key,
    this.image = images.propertyHome2,
    this.status = 'Available',
    this.countText = '1/11',
    this.onTap,
  });

  final String image;
  final String status;
  final String countText;
  final VoidCallback? onTap;

  @override
  State<PropertyDetailHero> createState() => _PropertyDetailHeroState();
}

class _PropertyDetailHeroState extends State<PropertyDetailHero> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap ?? () => Get.to(() => const GalleryScreen()),
      child: Stack(
      children: [
        // Main Photo with rounded corners
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.asset(
            widget.image,
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              height: 250,
              color: const Color(0xFFEFF2FE),
              child: const Icon(Icons.home_work_outlined, size: 56, color: AppColors.button),
            ),
          ),
        ),

        // Top Status Badge (Available)
        Positioned(
          top: 14.0,
          right: 14.0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
            decoration: BoxDecoration(
              color: AppColors.button,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Text(
              widget.status,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'poppins',
              ),
            ),
          ),
        ),

        // Bottom Count Badge (1/11)
        Positioned(
          bottom: 14.0,
          left: 14.0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.65),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Text(
              widget.countText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'poppins',
              ),
            ),
          ),
        ),
      ],
      ),
    );
  }
}
