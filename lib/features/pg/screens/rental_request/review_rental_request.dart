import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/commons/widgets/app_bar/appbar.dart';
import 'package:renteasy_app/features/pg/screens/rental_request/widgets/rental_request_applicant_card.dart';
import 'package:renteasy_app/features/pg/screens/rental_request/widgets/rental_request_property_card.dart';
import 'package:renteasy_app/features/pg/screens/rental_request/widgets/rental_request_sections_list.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/image_string.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class ReviewRentalRequestScreen extends StatefulWidget {
  const ReviewRentalRequestScreen({
    super.key,
    this.propertyTitle = 'Skyline Modern Studio',
    this.propertyLocation = 'Ahmedabad',
    this.propertyPrice = '₹25,000/mo',
    this.propertyImage = images.propertyHome1,
  });

  final String propertyTitle;
  final String propertyLocation;
  final String propertyPrice;
  final String propertyImage;

  @override
  State<ReviewRentalRequestScreen> createState() => _ReviewRentalRequestScreenState();
}

class _ReviewRentalRequestScreenState extends State<ReviewRentalRequestScreen> {
  bool isConfirmed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: RAppBar(
        showBackArrow: true,
        showLogout: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Review Rental Request',
              style: Theme.of(context).textTheme.headlineSmall!.apply(color: AppColors.primaryTextColor).copyWith(fontWeight: FontWeight.bold),
            ),
            const Text(
              'Check your request details before submitting',
              style: TextStyle(
                fontSize: 12.0,
                color: AppColors.secondaryTextColor,
                fontFamily: 'poppins',
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Property Summary Card
              RentalRequestPropertyCard(
                title: widget.propertyTitle,
                location: widget.propertyLocation,
                price: widget.propertyPrice,
                image: widget.propertyImage,
              ),
              const SizedBox(height: 18.0),

              // Applicant Card
              const RentalRequestApplicantCard(),
              const SizedBox(height: 20.0),

              // Review Sections
              const Text(
                'Review Sections',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'poppins',
                  color: AppColors.primaryTextColor,
                ),
              ),
              const SizedBox(height: 10.0),
              const RentalRequestSectionsList(),
              const SizedBox(height: 18.0),

              // Confirmation Checkbox Row
              GestureDetector(
                onTap: () => setState(() => isConfirmed = !isConfirmed),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      margin: const EdgeInsets.only(top: 2),
                      decoration: BoxDecoration(
                        color: isConfirmed ? AppColors.button : Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isConfirmed ? AppColors.button : const Color(0xFFC0C0D0),
                          width: 1.5,
                        ),
                      ),
                      child: isConfirmed
                          ? const Icon(Icons.check, size: 14, color: Colors.white)
                          : null,
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        'I confirm all details are correct and I authorize RentEasy to share my profile information with the property owner.',
                        style: TextStyle(
                          fontSize: 11.0,
                          color: AppColors.secondaryTextColor,
                          fontFamily: 'poppins',
                          height: 1.35,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24.0),

              // Action Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isConfirmed
                      ? () {
                          Get.snackbar(
                            'Request Submitted',
                            'Your rental request has been sent to the property owner!',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppColors.button,
                            colorText: Colors.white,
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF38384E),
                    disabledBackgroundColor: const Color(0xFF38384E).withValues(alpha: 0.5),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Submit Rental Request',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'poppins',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Get.back(),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFE2E2EA)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                  ),
                  child: const Text(
                    'Edit Details',
                    style: TextStyle(
                      color: AppColors.button,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'poppins',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
    );
  }
}
