import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';

class RentalFormFields extends StatelessWidget {
  const RentalFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInputField(label: 'Full Name', initialValue: 'John Doe'),
        const SizedBox(height: 12.0),
        _buildInputField(label: 'Mobile Number', initialValue: '+91 98765 43210', keyboardType: TextInputType.phone),
        const SizedBox(height: 12.0),
        _buildInputField(label: 'Email Address', initialValue: 'john.doe@example.com', keyboardType: TextInputType.emailAddress),
        const SizedBox(height: 12.0),

        // Preferred Move-in Date
        _buildFieldLabel('Preferred Move-in Date'),
        const SizedBox(height: 6.0),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 13.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(color: const Color(0xFFE2E2EA)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Select Date',
                style: TextStyle(
                  fontSize: 13.0,
                  color: Color(0xFF9E9EAF),
                  fontFamily: 'poppins',
                ),
              ),
              Icon(Icons.calendar_today_outlined, size: 18, color: AppColors.button),
            ],
          ),
        ),
        const SizedBox(height: 12.0),

        // Duration & Occupants Row
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFieldLabel('Rental Duration'),
                  const SizedBox(height: 6.0),
                  _buildDropdown('11 Months'),
                ],
              ),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFieldLabel('Occupants'),
                  const SizedBox(height: 6.0),
                  _buildDropdown('1 Person'),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12.0),

        // Message to Owner
        _buildFieldLabel('Message to Owner'),
        const SizedBox(height: 6.0),
        TextField(
          maxLines: 4,
          decoration: InputDecoration(
            hintText: 'Tell the owner a bit about yourself...',
            hintStyle: const TextStyle(
              color: Color(0xFF9E9EAF),
              fontSize: 13.0,
              fontFamily: 'poppins',
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(14.0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(color: Color(0xFFE2E2EA)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(color: AppColors.button, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFieldLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w600,
        color: AppColors.secondaryTextColor,
        fontFamily: 'poppins',
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required String initialValue,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel(label),
        const SizedBox(height: 6.0),
        TextFormField(
          initialValue: initialValue,
          keyboardType: keyboardType,
          style: const TextStyle(
            fontSize: 13.0,
            color: AppColors.primaryTextColor,
            fontFamily: 'poppins',
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 13.0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(color: Color(0xFFE2E2EA)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(color: AppColors.button, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown(String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: const Color(0xFFE2E2EA)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryTextColor,
              fontFamily: 'poppins',
            ),
          ),
          const Icon(Icons.keyboard_arrow_down, size: 18, color: AppColors.secondaryTextColor),
        ],
      ),
    );
  }
}
