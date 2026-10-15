import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/features/pg/screens/map_view/property_map.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class PropertyDetailLocationCard extends StatelessWidget {
  const PropertyDetailLocationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Location',
          style: TextStyle(
            fontSize: AppSizes.fontSizeMd,
            fontWeight: FontWeight.bold,
            fontFamily: 'poppins',
            color: AppColors.primaryTextColor,
          ),
        ),
        const SizedBox(height: 10.0),

        // Interactive Map Preview
        GestureDetector(
          onTap: () => Get.to(() => const PropertyMapScreen()),
          child: Container(
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFEBF0F8),
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(color: const Color(0xFFEBEBF5)),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Minimalist map route illustration
                CustomPaint(
                  size: const Size(double.infinity, 130),
                  painter: _MiniMapPainter(),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: const BoxDecoration(
                    color: AppColors.button,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.home, color: Colors.white, size: 20),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12.0),

        // Nearby Places Row 1
        _buildNearbyRow(Icons.train_outlined, 'Metro Station', '500m'),
        const SizedBox(height: 8.0),

        // Nearby Places Row 2
        _buildNearbyRow(Icons.local_hospital_outlined, 'Civil Hospital', '1.2km'),
      ],
    );
  }

  Widget _buildNearbyRow(IconData icon, String title, String distance) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: AppColors.propertyContainerBG,
        borderRadius: BorderRadius.circular(14.0),
        border: Border.all(color: const Color(0xFFEBEBF5)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.button),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: AppSizes.fontSizeXs,
                fontFamily: 'poppins',
                color: AppColors.primaryTextColor,
              ),
            ),
          ),
          Text(
            distance,
            style: TextStyle(
              fontSize: AppSizes.fontSizeXs,
              fontWeight: FontWeight.bold,
              color: AppColors.secondaryTextColor,
              fontFamily: 'poppins',
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.6)
      ..strokeWidth = 6.0
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(0, size.height * 0.4);
    path.quadraticBezierTo(size.width * 0.4, size.height * 0.2, size.width * 0.6, size.height * 0.6);
    path.quadraticBezierTo(size.width * 0.8, size.height * 0.9, size.width, size.height * 0.7);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
