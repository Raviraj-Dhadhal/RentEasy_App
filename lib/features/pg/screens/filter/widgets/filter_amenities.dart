import 'package:flutter/material.dart';
import 'package:renteasy_app/commons/widgets/chips/filter_chip_pill.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class FilterAmenities extends StatefulWidget {
  const FilterAmenities({super.key});

  @override
  State<FilterAmenities> createState() => _FilterAmenitiesState();
}

class _FilterAmenitiesState extends State<FilterAmenities> {
  final Set<String> selectedAmenities = {'AC', 'Kitchen'};
  double distance = 10.0;
  DateTime selectedDate = DateTime(2023, 10, 12);

  final List<Map<String, dynamic>> amenities = [
    {'title': 'Wi-Fi', 'icon': Icons.wifi},
    {'title': 'AC', 'icon': Icons.ac_unit},
    {'title': 'Parking', 'icon': Icons.local_parking},
    {'title': 'Kitchen', 'icon': Icons.kitchen},
    {'title': 'Laundry', 'icon': Icons.local_laundry_service_outlined},
    {'title': 'Attached Bathroom', 'icon': Icons.bathtub_outlined},
    {'title': 'Furnished', 'icon': Icons.chair_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Amenities Heading
        Text(
          'Amenities',
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
          children: amenities.map((item) {
            final title = item['title'] as String;
            final icon = item['icon'] as IconData;
            final isSelected = selectedAmenities.contains(title);

            return RFilterChipPill(
              label: title,
              icon: icon,
              isSelected: isSelected,
              onTap: () {
                setState(() {
                  if (isSelected) {
                    selectedAmenities.remove(title);
                  } else {
                    selectedAmenities.add(title);
                  }
                });
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 24.0),

        // Availability Section
        Text(
          'Availability',
          style: TextStyle(
            fontSize: AppSizes.fontSizeMd + 1,
            fontWeight: FontWeight.bold,
            fontFamily: 'poppins',
            color: AppColors.primaryTextColor,
          ),
        ),
        const SizedBox(height: 12.0),
        GestureDetector(
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime(2023),
              lastDate: DateTime(2030),
            );
            if (picked != null) {
              setState(() => selectedDate = picked);
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
            decoration: BoxDecoration(
              color: AppColors.propertyContainerBG,
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(color: const Color(0xFFE4E4ED)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                  style: TextStyle(
                    fontSize: AppSizes.fontSizeSm,
                    fontFamily: 'poppins',
                    color: AppColors.primaryTextColor,
                  ),
                ),
                const Icon(Icons.calendar_today_outlined, size: 18, color: AppColors.secondaryTextColor),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24.0),

        // Distance Section
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Distance',
              style: TextStyle(
                fontSize: AppSizes.fontSizeMd + 1,
                fontWeight: FontWeight.bold,
                fontFamily: 'poppins',
                color: AppColors.primaryTextColor,
              ),
            ),
            Text(
              'Up to ${distance.round()} km',
              style: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'poppins',
                color: AppColors.button,
              ),
            ),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: AppColors.button,
            inactiveTrackColor: const Color(0xFFE5E7EB),
            thumbColor: AppColors.button,
            trackHeight: 4.0,
          ),
          child: Slider(
            value: distance,
            min: 1.0,
            max: 20.0,
            onChanged: (val) => setState(() => distance = val),
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('1 km', style: TextStyle(color: AppColors.secondaryTextColor, fontSize: 11)),
            Text('20 km', style: TextStyle(color: AppColors.secondaryTextColor, fontSize: 11)),
          ],
        ),
      ],
    );
  }
}
