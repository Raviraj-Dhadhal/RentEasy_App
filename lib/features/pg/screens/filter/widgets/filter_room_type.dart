import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class FilterRoomType extends StatefulWidget {
  const FilterRoomType({super.key});

  @override
  State<FilterRoomType> createState() => _FilterRoomTypeState();
}

class _FilterRoomTypeState extends State<FilterRoomType> {
  String selectedRoom = 'Shared';

  final List<Map<String, dynamic>> roomOptions = [
    {'title': 'Private', 'icon': Icons.person_outline},
    {'title': 'Shared', 'icon': Icons.groups_outlined},
    {'title': '1BHK', 'icon': Icons.home_outlined},
    {'title': '2BHK', 'icon': Icons.apartment_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Room Type',
          style: TextStyle(
            fontSize: AppSizes.fontSizeMd + 1,
            fontWeight: FontWeight.bold,
            fontFamily: 'poppins',
            color: AppColors.primaryTextColor,
          ),
        ),
        const SizedBox(height: 12.0),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2.8,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: roomOptions.length,
          itemBuilder: (context, index) {
            final option = roomOptions[index];
            final isSelected = selectedRoom == option['title'];

            return GestureDetector(
              onTap: () => setState(() => selectedRoom = option['title']),
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.button : AppColors.propertyContainerBG,
                  borderRadius: BorderRadius.circular(24.0),
                  border: Border.all(
                    color: isSelected ? AppColors.button : const Color(0xFFE4E4ED),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      option['icon'],
                      size: 18,
                      color: isSelected ? Colors.white : AppColors.secondaryTextColor,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      option['title'],
                      style: TextStyle(
                        color: isSelected ? Colors.white : AppColors.secondaryTextColor,
                        fontSize: AppSizes.fontSizeSm,
                        fontFamily: 'poppins',
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
