import 'package:flutter/material.dart';
import 'package:renteasy_app/commons/widgets/chips/filter_chip_pill.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class FilterPropertyType extends StatefulWidget {
  const FilterPropertyType({super.key});

  @override
  State<FilterPropertyType> createState() => _FilterPropertyTypeState();
}

class _FilterPropertyTypeState extends State<FilterPropertyType> {
  String selectedType = 'PG';
  String selectedGender = 'Any';

  final List<String> propertyTypes = ['Flat', 'PG', 'Room', 'Hostel', 'Villa'];
  final List<String> genderOptions = ['Male', 'Female', 'Any'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Property Type
        Text(
          'Property Type',
          style: TextStyle(
            fontSize: AppSizes.fontSizeMd + 1,
            fontWeight: FontWeight.bold,
            fontFamily: 'poppins',
            color: AppColors.primaryTextColor,
          ),
        ),
        const SizedBox(height: 12.0),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: propertyTypes.map((type) => RFilterChipPill(
            label: type,
            isSelected: selectedType == type,
            onTap: () => setState(() => selectedType = type),
          )).toList(),
        ),
        const SizedBox(height: 24.0),

        // Gender Preference
        Text(
          'Gender Preference',
          style: TextStyle(
            fontSize: AppSizes.fontSizeMd + 1,
            fontWeight: FontWeight.bold,
            fontFamily: 'poppins',
            color: AppColors.primaryTextColor,
          ),
        ),
        const SizedBox(height: 12.0),
        Row(
          children: genderOptions.map((gender) => Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: GestureDetector(
                onTap: () => setState(() => selectedGender = gender),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: selectedGender == gender ? AppColors.button : AppColors.propertyContainerBG,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: selectedGender == gender ? AppColors.button : const Color(0xFFE4E4ED),
                    ),
                  ),
                  child: Text(
                    gender,
                    style: TextStyle(
                      color: selectedGender == gender ? Colors.white : AppColors.secondaryTextColor,
                      fontSize: AppSizes.fontSizeSm,
                      fontFamily: 'poppins',
                      fontWeight: selectedGender == gender ? FontWeight.bold : FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          )).toList(),
        ),
      ],
    );
  }
}
