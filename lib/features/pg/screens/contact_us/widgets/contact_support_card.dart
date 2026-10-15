import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class ContactSupportCard extends StatelessWidget {
  const ContactSupportCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: AppColors.propertyContainerBG,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: const Color(0xFFEBEBF2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              color: AppColors.button,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.headset_mic_rounded, color: Colors.white, size: 30),
          ),
          const SizedBox(height: 14.0),
          Text(
            'Customer Support',
            style: TextStyle(
              fontSize: AppSizes.fontSizeMd + 1,
              fontWeight: FontWeight.bold,
              fontFamily: 'poppins',
              color: AppColors.primaryTextColor,
            ),
          ),
          const SizedBox(height: 18.0),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.button, width: 1.5),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                  ),
                  child: const Text(
                    'Call',
                    style: TextStyle(color: AppColors.button, fontWeight: FontWeight.bold, fontFamily: 'poppins'),
                  ),
                ),
              ),
              const SizedBox(width: 14.0),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.button,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Chat',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'poppins'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
