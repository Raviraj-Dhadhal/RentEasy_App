import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';

class BookVisitDetailsForm extends StatelessWidget {
  const BookVisitDetailsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTextField(hint: 'Full Name'),
        const SizedBox(height: 10.0),
        _buildTextField(hint: 'Phone Number', keyboardType: TextInputType.phone),
        const SizedBox(height: 10.0),
        _buildTextField(hint: 'Email Address', keyboardType: TextInputType.emailAddress),
      ],
    );
  }

  Widget _buildTextField({required String hint, TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: Color(0xFF9E9EAF),
          fontSize: 13.0,
          fontFamily: 'poppins',
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: const BorderSide(color: Color(0xFFE4E4ED)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: const BorderSide(color: AppColors.button, width: 1.5),
        ),
      ),
    );
  }
}
