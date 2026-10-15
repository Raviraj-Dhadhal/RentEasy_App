import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/commons/style/button_styles.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class ContactMessageForm extends StatelessWidget {
  const ContactMessageForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Send us a message',
          style: TextStyle(
            fontSize: AppSizes.fontSizeMd + 1,
            fontWeight: FontWeight.bold,
            fontFamily: 'poppins',
            color: AppColors.primaryTextColor,
          ),
        ),
        const SizedBox(height: 14.0),

        // Full Name
        _buildInputField(label: 'Full Name', hint: 'Enter your full name'),
        const SizedBox(height: 12.0),

        // Email
        _buildInputField(label: 'Email', hint: 'Enter your email address'),
        const SizedBox(height: 12.0),

        // Subject
        _buildInputField(label: 'Subject', hint: 'What is this about?'),
        const SizedBox(height: 12.0),

        // Message
        _buildInputField(
          label: 'Message',
          hint: 'Type your message here...',
          maxLines: 4,
        ),
        const SizedBox(height: 20.0),

        // Submit Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Get.snackbar(
                'Message Sent',
                'Thank you for contacting RentEasy support!',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: AppColors.button,
                colorText: Colors.white,
              );
            },
            style: AppButtonStyles.primaryButton,
            child: const Text(
              'Send Message',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'poppins'),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInputField({
    required String label,
    required String hint,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: AppSizes.fontSizeSm,
            color: AppColors.secondaryTextColor,
            fontFamily: 'poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6.0),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Color(0xFF9E9EAF), fontSize: 13.0, fontFamily: 'poppins'),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.0),
              borderSide: const BorderSide(color: Color(0xFFE4E4ED)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.0),
              borderSide: const BorderSide(color: AppColors.button, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
