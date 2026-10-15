import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/image_string.dart';

class RentalRequestApplicantCard extends StatelessWidget {
  const RentalRequestApplicantCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.propertyContainerBG,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: const Color(0xFFEBEBF5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Applicant Header
          Row(
            children: [
              const CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage(images.userProfileImage),
              ),
              const SizedBox(width: 14.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'poppins',
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                  Text(
                    'Individual Applicant',
                    style: TextStyle(
                      fontSize: 11.0,
                      color: AppColors.secondaryTextColor,
                      fontFamily: 'poppins',
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          const Divider(color: Color(0xFFEBEBF5), height: 1.0),
          const SizedBox(height: 14.0),

          // Details Grid
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDetailItem('MOVE-IN DATE', 'Oct 1st, 2023'),
              _buildDetailItem('DURATION', '12 Months'),
            ],
          ),
          const SizedBox(height: 14.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDetailItem('OCCUPANTS', '1 Person'),
              _buildDetailItem('CONTACT', '+91 98XXX XXX01'),
            ],
          ),
          const SizedBox(height: 14.0),

          // Personal Message
          const Text(
            'PERSONAL MESSAGE',
            style: TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
              color: AppColors.secondaryTextColor,
              fontFamily: 'poppins',
            ),
          ),
          const SizedBox(height: 6.0),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: const Color(0xFFEBEBF5)),
            ),
            child: const Text(
              '"Hi Sarah, I\'m a software engineer moving to Ahmedabad for work. I love the minimalist design of your studio and would take great care of it!"',
              style: TextStyle(
                fontSize: 12.0,
                height: 1.4,
                fontStyle: FontStyle.italic,
                color: AppColors.primaryTextColor,
                fontFamily: 'poppins',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 10.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
            color: AppColors.secondaryTextColor,
            fontFamily: 'poppins',
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryTextColor,
            fontFamily: 'poppins',
          ),
        ),
      ],
    );
  }
}
