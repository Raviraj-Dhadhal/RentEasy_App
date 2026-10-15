import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class ContactInfoTiles extends StatelessWidget {
  const ContactInfoTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildInfoCard(
          icon: Icons.email_outlined,
          title: 'Email Support',
          value: 'support@renteasy.com',
        ),
        const SizedBox(height: 12.0),
        _buildInfoCard(
          icon: Icons.phone_outlined,
          title: 'Phone Support',
          value: '+91 98765 43210',
        ),
        const SizedBox(height: 12.0),
        _buildInfoCard(
          icon: Icons.location_on_outlined,
          title: 'Office Address',
          value: 'RentEasy Office, Gujarat, India',
        ),
      ],
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
      decoration: BoxDecoration(
        color: AppColors.propertyContainerBG,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: const Color(0xFFEBEBF5)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: const Color(0xFFEDEAFD),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Icon(icon, color: AppColors.button, size: 20),
          ),
          const SizedBox(width: 14.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: AppSizes.fontSizeSm,
                    color: AppColors.secondaryTextColor,
                    fontFamily: 'poppins',
                  ),
                ),
                const SizedBox(height: 2.0),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: AppSizes.fontSizeSm,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryTextColor,
                    fontFamily: 'poppins',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
