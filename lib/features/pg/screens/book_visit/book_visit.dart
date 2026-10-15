import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/commons/widgets/app_bar/appbar.dart';
import 'package:renteasy_app/features/pg/screens/book_visit/widgets/book_visit_calendar.dart';
import 'package:renteasy_app/features/pg/screens/book_visit/widgets/book_visit_details_form.dart';
import 'package:renteasy_app/features/pg/screens/book_visit/widgets/book_visit_policy_card.dart';
import 'package:renteasy_app/features/pg/screens/book_visit/widgets/book_visit_property_card.dart';
import 'package:renteasy_app/features/pg/screens/book_visit/widgets/book_visit_purpose_chips.dart';
import 'package:renteasy_app/features/pg/screens/book_visit/widgets/book_visit_time_selector.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/image_string.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class BookVisitScreen extends StatelessWidget {
  const BookVisitScreen({
    super.key,
    this.propertyTitle = 'Skyline Modern Studio',
    this.propertyLocation = 'Ahmedabad, Gujarat',
    this.propertyPrice = '₹25,000',
    this.propertyImage = images.propertyHome1,
  });

  final String propertyTitle;
  final String propertyLocation;
  final String propertyPrice;
  final String propertyImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const RAppBar(
        showBackArrow: true,
        showLogout: true,
        titleText: 'Book Visit',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Property Card
              BookVisitPropertyCard(
                image: propertyImage,
                title: propertyTitle,
                location: propertyLocation,
                price: propertyPrice,
              ),
              const SizedBox(height: 18.0),

              // Select Date Section
              _buildSectionTitle('Select Date'),
              const SizedBox(height: 10.0),
              const BookVisitCalendar(),
              const SizedBox(height: 18.0),

              // Select Time Section
              _buildSectionTitle('Select Time'),
              const SizedBox(height: 10.0),
              const BookVisitTimeSelector(),
              const SizedBox(height: 18.0),

              // Your Details Section
              _buildSectionTitle('Your Details'),
              const SizedBox(height: 10.0),
              const BookVisitDetailsForm(),
              const SizedBox(height: 18.0),

              // Visit Purpose Section
              _buildSectionTitle('Visit Purpose'),
              const SizedBox(height: 10.0),
              const BookVisitPurposeChips(),
              const SizedBox(height: 18.0),

              // Policy and Instructions Card
              const BookVisitPolicyCard(),
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Total Cost',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: AppColors.secondaryTextColor,
                      fontFamily: 'poppins',
                    ),
                  ),
                  Text(
                    'Free Visit',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.button,
                      fontFamily: 'poppins',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.snackbar(
                      'Visit Scheduled',
                      'Your visit for $propertyTitle has been confirmed!',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: AppColors.button,
                      colorText: Colors.white,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.button,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Confirm Visit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'poppins',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'poppins',
        color: AppColors.primaryTextColor,
      ),
    );
  }
}
