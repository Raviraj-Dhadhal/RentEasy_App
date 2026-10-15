import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';

class GalleryCategoryGrid extends StatelessWidget {
  const GalleryCategoryGrid({
    super.key,
    required this.title,
    required this.image1,
    required this.image2,
  });

  final String title;
  final String image1;
  final String image2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'poppins',
            color: AppColors.primaryTextColor,
          ),
        ),
        const SizedBox(height: 10.0),
        Row(
          children: [
            Expanded(child: _buildPhoto(image1)),
            const SizedBox(width: 12.0),
            Expanded(child: _buildPhoto(image2)),
          ],
        ),
      ],
    );
  }

  Widget _buildPhoto(String image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Image.asset(
        image,
        height: 130,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          height: 130,
          color: const Color(0xFFEFF2FE),
          child: const Icon(Icons.image, color: AppColors.button),
        ),
      ),
    );
  }
}
