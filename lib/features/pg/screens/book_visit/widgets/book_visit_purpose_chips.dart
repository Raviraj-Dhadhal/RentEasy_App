import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';

class BookVisitPurposeChips extends StatefulWidget {
  const BookVisitPurposeChips({super.key});

  @override
  State<BookVisitPurposeChips> createState() => _BookVisitPurposeChipsState();
}

class _BookVisitPurposeChipsState extends State<BookVisitPurposeChips> {
  String selectedPurpose = 'View Property';
  final List<String> purposes = ['View Property', 'Finalize Rental', 'Meet Owner', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: purposes.map((purpose) {
            final isSelected = purpose == selectedPurpose;
            return GestureDetector(
              onTap: () => setState(() => selectedPurpose = purpose),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.button : Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: isSelected ? AppColors.button : const Color(0xFFE2E2EA),
                  ),
                ),
                child: Text(
                  purpose,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    color: isSelected ? Colors.white : AppColors.secondaryTextColor,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 12.0),
        TextField(
          maxLines: 3,
          decoration: InputDecoration(
            hintText: 'Add any special request...',
            hintStyle: const TextStyle(
              color: Color(0xFF9E9EAF),
              fontSize: 13.0,
              fontFamily: 'poppins',
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(14.0),
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
