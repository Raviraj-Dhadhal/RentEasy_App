import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/features/pg/screens/map_view/property_map.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';

/// Reusable Floating Action Button across RentEasy screens.
/// By default opens PropertyMapScreen to explore properties on the map.
class RFloatingActionButton extends StatelessWidget {
  const RFloatingActionButton({
    super.key,
    this.onPressed,
    this.icon = Icons.map_outlined,
    this.backgroundColor = AppColors.button,
    this.iconColor = Colors.white,
    this.iconSize = 28.0,
    this.heroTag,
  });

  final VoidCallback? onPressed;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double iconSize;
  final Object? heroTag;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: heroTag, // Set to avoid hero animation collision between multiple tabs
      onPressed: onPressed ?? () => Get.to(() => const PropertyMapScreen()),
      backgroundColor: backgroundColor,
      shape: const CircleBorder(),
      child: Icon(icon, color: iconColor, size: iconSize),
    );
  }
}
