import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class FilterBudgetSlider extends StatefulWidget {
  const FilterBudgetSlider({super.key});

  @override
  State<FilterBudgetSlider> createState() => _FilterBudgetSliderState();
}

class _FilterBudgetSliderState extends State<FilterBudgetSlider> {
  RangeValues _currentRangeValues = const RangeValues(2000, 25000);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Budget',
          style: TextStyle(
            fontSize: AppSizes.fontSizeMd + 1,
            fontWeight: FontWeight.bold,
            fontFamily: 'poppins',
            color: AppColors.primaryTextColor,
          ),
        ),
        const SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Min Price', style: TextStyle(color: AppColors.secondaryTextColor, fontSize: 12)),
                const SizedBox(height: 4),
                Text(
                  '₹${_currentRangeValues.start.round()}',
                  style: TextStyle(
                    fontSize: AppSizes.fontSizeMd + 2,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'poppins',
                    color: AppColors.primaryTextColor,
                  ),
                ),
              ],
            ),
            Container(width: 40, height: 1.5, color: const Color(0xFFDCDCE6)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text('Max Price', style: TextStyle(color: AppColors.secondaryTextColor, fontSize: 12)),
                const SizedBox(height: 4),
                Text(
                  '₹${_currentRangeValues.end.round()}',
                  style: TextStyle(
                    fontSize: AppSizes.fontSizeMd + 2,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'poppins',
                    color: AppColors.primaryTextColor,
                  ),
                ),
              ],
            ),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: AppColors.button,
            inactiveTrackColor: const Color(0xFFE5E7EB),
            thumbColor: AppColors.button,
            overlayColor: AppColors.button.withValues(alpha: 0.2),
            trackHeight: 4.0,
          ),
          child: RangeSlider(
            values: _currentRangeValues,
            min: 1000,
            max: 50000,
            divisions: 50,
            onChanged: (RangeValues values) {
              setState(() => _currentRangeValues = values);
            },
          ),
        ),
      ],
    );
  }
}
