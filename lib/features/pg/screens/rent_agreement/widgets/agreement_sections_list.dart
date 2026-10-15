import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';

class AgreementSectionsList extends StatelessWidget {
  const AgreementSectionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSectionTile(
          icon: Icons.person_outline,
          iconBg: const Color(0xFFEDEAFD),
          iconColor: AppColors.button,
          title: 'Tenant Information',
          subtitle: 'Personal & contact details provided for the lease.',
        ),
        const SizedBox(height: 10.0),
        _buildSectionTile(
          icon: Icons.shield_outlined,
          iconBg: const Color(0xFFEDEAFD),
          iconColor: AppColors.button,
          title: 'Owner Information',
          subtitle: 'Legal ownership and representative details.',
        ),
        const SizedBox(height: 10.0),
        _buildSectionTile(
          icon: Icons.gavel_outlined,
          iconBg: const Color(0xFFFEF3C7),
          iconColor: const Color(0xFFD97706),
          title: 'Terms & Conditions',
          subtitle: 'Full legal framework of the rental agreement.',
        ),
        const SizedBox(height: 10.0),
        _buildSectionTile(
          icon: Icons.calendar_today_outlined,
          iconBg: const Color(0xFFDBEAFE),
          iconColor: const Color(0xFF2563EB),
          title: 'Payment Schedule',
          subtitle: 'Detailed monthly billing and due dates.',
        ),
        const SizedBox(height: 10.0),
        _buildSectionTile(
          icon: Icons.build_outlined,
          iconBg: const Color(0xFFE0E7FF),
          iconColor: const Color(0xFF4F46E5),
          title: 'Maintenance',
          subtitle: 'Responsibilities for repairs and property upkeep.',
        ),
        const SizedBox(height: 10.0),
        _buildSectionTile(
          icon: Icons.home_work_outlined,
          iconBg: const Color(0xFFF3F4F6),
          iconColor: const Color(0xFF4B5563),
          title: 'House Rules',
          subtitle: 'Community guidelines and property restrictions.',
        ),
      ],
    );
  }

  Widget _buildSectionTile({
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
    required String subtitle,
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
              color: iconBg,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryTextColor,
                    fontFamily: 'poppins',
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 10.0,
                    color: AppColors.secondaryTextColor,
                    fontFamily: 'poppins',
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, size: 18, color: AppColors.secondaryTextColor),
        ],
      ),
    );
  }
}
