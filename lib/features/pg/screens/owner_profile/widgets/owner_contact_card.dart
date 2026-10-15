import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';

class OwnerContactCard extends StatelessWidget {
  const OwnerContactCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'About Rajesh',
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'poppins',
            color: AppColors.primaryTextColor,
          ),
        ),
        const SizedBox(height: 6.0),
        const Text(
          'Dedicated property owner with over 5 years of experience in the Rajkot real estate market. I pride myself on providing high-quality, well-maintained studio apartments and family homes.',
          style: TextStyle(
            fontSize: 12.0,
            height: 1.4,
            color: AppColors.secondaryTextColor,
            fontFamily: 'poppins',
          ),
        ),
        const SizedBox(height: 14.0),

        // Contact info box
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14.0),
          decoration: BoxDecoration(
            color: AppColors.propertyContainerBG,
            borderRadius: BorderRadius.circular(18.0),
            border: Border.all(color: const Color(0xFFEBEBF5)),
          ),
          child: Column(
            children: [
              _buildContactTile(
                icon: Icons.phone_outlined,
                title: 'Phone',
                value: '+91 98XXX XXX01',
              ),
              const SizedBox(height: 10.0),
              _buildContactTile(
                icon: Icons.email_outlined,
                title: 'Email',
                value: 'rajesh.p@renteasy.com',
              ),
              const SizedBox(height: 10.0),
              _buildContactTile(
                icon: Icons.translate_outlined,
                title: 'Preferred Languages',
                value: 'English, Gujarati, Hindi',
              ),
              const SizedBox(height: 12.0),
              const Divider(color: Color(0xFFEBEBF5), height: 1.0),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  _StatItem(label: 'Response Rate', value: '98% Rate'),
                  _StatItem(label: 'Avg. Time', value: '2h Avg. Time'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContactTile({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(7.0),
          decoration: BoxDecoration(
            color: const Color(0xFFEDEAFD),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Icon(icon, color: AppColors.button, size: 16),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 10.0,
                  color: AppColors.secondaryTextColor,
                  fontFamily: 'poppins',
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryTextColor,
                  fontFamily: 'poppins',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 10.0,
            color: AppColors.secondaryTextColor,
            fontFamily: 'poppins',
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            color: AppColors.button,
            fontFamily: 'poppins',
          ),
        ),
      ],
    );
  }
}
