import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';

class BookVisitCalendar extends StatefulWidget {
  const BookVisitCalendar({super.key});

  @override
  State<BookVisitCalendar> createState() => _BookVisitCalendarState();
}

class _BookVisitCalendarState extends State<BookVisitCalendar> {
  int selectedDay = 6;

  final List<String> weekdays = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
  final List<int?> row1 = [28, 27, 28, 29, 30, 1, 2];
  final List<int> row2 = [3, 4, 5, 6, 7, 8, 9];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.propertyContainerBG,
        borderRadius: BorderRadius.circular(18.0),
        border: Border.all(color: const Color(0xFFEBEBF5)),
      ),
      child: Column(
        children: [
          // Month Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'October 2023',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'poppins',
                  color: AppColors.primaryTextColor,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.chevron_left, size: 20),
                    onPressed: () {},
                    constraints: const BoxConstraints(),
                    padding: const EdgeInsets.all(4),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.chevron_right, size: 20),
                    onPressed: () {},
                    constraints: const BoxConstraints(),
                    padding: const EdgeInsets.all(4),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12.0),

          // Weekday Labels
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: weekdays
                .map((day) => SizedBox(
                      width: 32,
                      child: Text(
                        day,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 11.0,
                          fontWeight: FontWeight.w600,
                          color: AppColors.secondaryTextColor,
                          fontFamily: 'poppins',
                        ),
                      ),
                    ))
                .toList(),
          ),
          const SizedBox(height: 8.0),

          // Row 1
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: row1
                .map((d) => _buildDayCell(d!, isPreviousMonth: d > 20))
                .toList(),
          ),
          const SizedBox(height: 6.0),

          // Row 2
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: row2
                .map((d) => _buildDayCell(d, isSelected: d == selectedDay))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildDayCell(int day, {bool isSelected = false, bool isPreviousMonth = false}) {
    return GestureDetector(
      onTap: () => setState(() => selectedDay = day),
      child: Container(
        width: 32,
        height: 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.button : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Text(
          '$day',
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            color: isSelected
                ? Colors.white
                : isPreviousMonth
                    ? const Color(0xFFB0B0C4)
                    : AppColors.primaryTextColor,
            fontFamily: 'poppins',
          ),
        ),
      ),
    );
  }
}
