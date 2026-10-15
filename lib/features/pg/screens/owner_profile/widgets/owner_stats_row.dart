import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';

class OwnerStatsRow extends StatelessWidget {
  const OwnerStatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildStatCircle('12', 'Total Properties'),
        _buildStatCircle('8', 'Active Listings'),
        _buildStatCircle('45', 'Properties Rented'),
      ],
    );
  }

  Widget _buildStatCircle(String count, String label) {
    return Container(
      width: 100,
      height: 90,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: AppColors.propertyContainerBG,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: const Color(0xFFEBEBF5)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            count,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: AppColors.button,
              fontFamily: 'poppins',
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 10.0,
              color: AppColors.secondaryTextColor,
              fontFamily: 'poppins',
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
