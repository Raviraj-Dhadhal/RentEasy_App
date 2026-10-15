import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';

class BookVisitTimeSelector extends StatefulWidget {
  const BookVisitTimeSelector({super.key});

  @override
  State<BookVisitTimeSelector> createState() => _BookVisitTimeSelectorState();
}

class _BookVisitTimeSelectorState extends State<BookVisitTimeSelector> {
  String selectedTime = '11:30 AM';
  final List<String> times = ['10:00 AM', '11:30 AM', '1:00 PM'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: times.map((time) {
        final isSelected = time == selectedTime;
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: GestureDetector(
              onTap: () => setState(() => selectedTime = time),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.button : Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: isSelected ? AppColors.button : const Color(0xFFE2E2EA),
                  ),
                ),
                child: Text(
                  time,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    color: isSelected ? Colors.white : AppColors.primaryTextColor,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
