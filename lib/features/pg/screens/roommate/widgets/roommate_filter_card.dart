import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';

class RoommateFilterCard extends StatefulWidget {
  const RoommateFilterCard({super.key});

  @override
  State<RoommateFilterCard> createState() => _RoommateFilterCardState();
}

class _RoommateFilterCardState extends State<RoommateFilterCard> {
  String selectedGender = 'Any Gender';
  String selectedBudget = '₹10k - 20k';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.propertyContainerBG,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: const Color(0xFFEBEBF5)),
      ),
      child: Column(
        children: [
          // Location Input
          TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.location_on_outlined, color: AppColors.button, size: 20),
              hintText: 'Search Location (e.g. Ahmedabad)',
              hintStyle: const TextStyle(
                fontSize: 12.0,
                color: Color(0xFF9E9EAF),
                fontFamily: 'poppins',
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
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
          const SizedBox(height: 12.0),

          // Budget & Gender Row
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 11.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(color: const Color(0xFFE2E2EA)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.account_balance_wallet_outlined, size: 16, color: AppColors.button),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          selectedBudget,
                          style: const TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryTextColor,
                            fontFamily: 'poppins',
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 11.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(color: const Color(0xFFE2E2EA)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedGender,
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryTextColor,
                          fontFamily: 'poppins',
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_down, size: 18, color: AppColors.secondaryTextColor),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14.0),

          // Apply Filters Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.button,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                elevation: 0,
              ),
              child: const Text(
                'Apply Filters',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'poppins',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
