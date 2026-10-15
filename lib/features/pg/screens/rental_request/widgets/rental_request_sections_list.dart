import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';

class RentalRequestSectionsList extends StatelessWidget {
  const RentalRequestSectionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSectionItem(
          icon: Icons.person_outline,
          title: 'Personal Information',
          onEdit: () {},
        ),
        const SizedBox(height: 10.0),
        _buildSectionItem(
          icon: Icons.tune,
          title: 'Rental Preferences',
          onEdit: () {},
        ),
        const SizedBox(height: 10.0),
        _buildSectionItem(
          icon: Icons.description_outlined,
          title: 'Documents',
          onEdit: () {},
        ),
        const SizedBox(height: 10.0),
        _buildSectionItem(
          icon: Icons.payment_outlined,
          title: 'Payment Details',
          onEdit: () {},
        ),
      ],
    );
  }

  Widget _buildSectionItem({
    required IconData icon,
    required String title,
    required VoidCallback onEdit,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: AppColors.propertyContainerBG,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: const Color(0xFFEBEBF5)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: const Color(0xFFEDEAFD),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Icon(icon, color: AppColors.button, size: 20),
          ),
          const SizedBox(width: 14.0),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryTextColor,
                fontFamily: 'poppins',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit_outlined, size: 18, color: AppColors.secondaryTextColor),
            onPressed: onEdit,
            constraints: const BoxConstraints(),
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
