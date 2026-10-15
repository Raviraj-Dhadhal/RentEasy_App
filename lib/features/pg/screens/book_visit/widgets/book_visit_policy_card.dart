import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';

class BookVisitPolicyCard extends StatelessWidget {
  const BookVisitPolicyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        color: AppColors.propertyContainerBG,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: const Color(0xFFEBEBF5)),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.info_outline, color: AppColors.button, size: 18),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Visit Instructions',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'poppins',
                        color: AppColors.primaryTextColor,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Please arrive 5 minutes early. The agent will meet you at the main gate.',
                      style: TextStyle(
                        fontSize: 11.0,
                        color: AppColors.secondaryTextColor,
                        fontFamily: 'poppins',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.cancel_outlined, color: Color(0xFFEF4444), size: 18),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Cancellation Policy',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'poppins',
                        color: AppColors.primaryTextColor,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Cancel up to 2 hours before the scheduled visit for free.',
                      style: TextStyle(
                        fontSize: 11.0,
                        color: AppColors.secondaryTextColor,
                        fontFamily: 'poppins',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
