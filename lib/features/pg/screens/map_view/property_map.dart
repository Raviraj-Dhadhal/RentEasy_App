import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/commons/widgets/app_bar/appbar.dart';
import 'package:renteasy_app/commons/widgets/property_cards/property_card_horizontal.dart';
import 'package:renteasy_app/features/pg/screens/filter/filter.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/image_string.dart';

class PropertyMapScreen extends StatefulWidget {
  const PropertyMapScreen({super.key, this.locationName = 'Rajkot'});

  final String locationName;

  @override
  State<PropertyMapScreen> createState() => _PropertyMapScreenState();
}

class _PropertyMapScreenState extends State<PropertyMapScreen> {
  int selectedMarkerIndex = 2; // Default to 12k pin

  final List<Map<String, dynamic>> mapPins = [
    {'price': '₹8.5k', 'top': 0.28, 'left': 0.65},
    {'price': '₹6.5k', 'top': 0.36, 'left': 0.24},
    {'price': '₹12k', 'top': 0.50, 'left': 0.48},
    {'price': '₹15k', 'top': 0.55, 'left': 0.18},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      appBar: RAppBar(
        showBackArrow: true,
        titleText: widget.locationName,
        trailing: IconButton(
          icon: const Icon(Icons.tune, color: AppColors.button),
          onPressed: () => Get.to(() => const FilterScreen()),
        ),
      ),
      body: Stack(
        children: [
          // Styled Map Canvas Background
          CustomPaint(
            size: Size.infinite,
            painter: MapBackgroundPainter(),
          ),

          // Map Price Pins
          ...List.generate(mapPins.length, (index) {
            final pin = mapPins[index];
            final isSelected = selectedMarkerIndex == index;

            return Positioned(
              top: MediaQuery.of(context).size.height * (pin['top'] as double),
              left: MediaQuery.of(context).size.width * (pin['left'] as double),
              child: GestureDetector(
                onTap: () => setState(() => selectedMarkerIndex = index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.button : Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.15),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    pin['price'] as String,
                    style: TextStyle(
                      color: isSelected ? Colors.white : AppColors.button,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'poppins',
                    ),
                  ),
                ),
              ),
            );
          }),

          // Bottom Floating Property Preview Card Overlay
          Positioned(
            bottom: 24.0,
            left: 16.0,
            right: 16.0,
            child: RPropertyCardHorizontal(
              image: images.propertyHome1,
              title: 'Modern 2BHK Apartment',
              location: 'Kalawad Road, ${widget.locationName}',
              price: '₹12,000',
              rating: '4.8',
              showViewButton: true,
              onTap: () => Get.back(),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 110.0),
        child: FloatingActionButton(
          onPressed: () => Get.back(),
          backgroundColor: Colors.white,
          shape: const CircleBorder(),
          child: const Icon(Icons.list_alt_rounded, color: AppColors.button, size: 28),
        ),
      ),
    );
  }
}

/// Custom painter rendering a clean map road grid pattern
class MapBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint()..color = const Color(0xFFF3F4F6);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), backgroundPaint);

    final roadPaint = Paint()
      ..color = const Color(0xFFE5E7EB)
      ..strokeWidth = 14.0
      ..style = PaintingStyle.stroke;

    final secondaryRoadPaint = Paint()
      ..color = const Color(0xFFE5E7EB)
      ..strokeWidth = 6.0
      ..style = PaintingStyle.stroke;

    // Diagonal and grid road lines
    canvas.drawLine(Offset(0, size.height * 0.2), Offset(size.width, size.height * 0.7), roadPaint);
    canvas.drawLine(Offset(size.width * 0.1, 0), Offset(size.width * 0.8, size.height), roadPaint);
    canvas.drawLine(Offset(0, size.height * 0.5), Offset(size.width, size.height * 0.4), secondaryRoadPaint);
    canvas.drawLine(Offset(size.width * 0.5, 0), Offset(size.width * 0.5, size.height), secondaryRoadPaint);

    // Roundabout hub
    final circlePaint = Paint()
      ..color = const Color(0xFFE0E7FF)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.45), 28.0, circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
