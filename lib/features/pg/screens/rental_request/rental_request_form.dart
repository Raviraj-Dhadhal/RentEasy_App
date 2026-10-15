import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/commons/widgets/app_bar/appbar.dart';
import 'package:renteasy_app/features/pg/screens/rental_request/review_rental_request.dart';
import 'package:renteasy_app/features/pg/screens/rental_request/widgets/rental_financial_summary.dart';
import 'package:renteasy_app/features/pg/screens/rental_request/widgets/rental_form_fields.dart';
import 'package:renteasy_app/features/pg/screens/rental_request/widgets/rental_property_header.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/image_string.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class RentalRequestFormScreen extends StatefulWidget {
  const RentalRequestFormScreen({
    super.key,
    this.propertyTitle = 'Modern 1BHK Apartment',
    this.propertyLocation = 'Amin Marg, Rajkot',
    this.propertyPrice = '₹18,000/mo',
    this.propertyImage = images.propertyHome1,
  });

  final String propertyTitle;
  final String propertyLocation;
  final String propertyPrice;
  final String propertyImage;

  @override
  State<RentalRequestFormScreen> createState() => _RentalRequestFormScreenState();
}

class _RentalRequestFormScreenState extends State<RentalRequestFormScreen> {
  bool isAgreed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const RAppBar(
        showBackArrow: true,
        showLogout: true,
        titleText: 'Rental Request',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Property Header
              RentalPropertyHeader(
                title: widget.propertyTitle,
                location: widget.propertyLocation,
                price: widget.propertyPrice,
                image: widget.propertyImage,
              ),
              const SizedBox(height: 18.0),

              // Form Input Fields
              const RentalFormFields(),
              const SizedBox(height: 18.0),

              // Financial Summary
              const RentalFinancialSummary(
                securityDeposit: '₹36,000',
                monthlyRent: '₹18,000',
                agreementDuration: '11 Months',
              ),
              const SizedBox(height: 16.0),

              // Terms & Conditions Checkbox
              GestureDetector(
                onTap: () => setState(() => isAgreed = !isAgreed),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 18,
                      height: 18,
                      margin: const EdgeInsets.only(top: 2),
                      decoration: BoxDecoration(
                        color: isAgreed ? AppColors.button : Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isAgreed ? AppColors.button : const Color(0xFFC0C0D0),
                          width: 1.5,
                        ),
                      ),
                      child: isAgreed
                          ? const Icon(Icons.check, size: 12, color: Colors.white)
                          : null,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          text: 'I agree to the ',
                          style: TextStyle(
                            fontSize: 11.0,
                            color: AppColors.secondaryTextColor,
                            fontFamily: 'poppins',
                          ),
                          children: [
                            TextSpan(
                              text: 'Terms & Conditions',
                              style: TextStyle(
                                color: AppColors.button,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(text: ' and '),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(
                                color: AppColors.button,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(text: '.'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24.0),

              // Send Request Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isAgreed
                      ? () => Get.to(() => ReviewRentalRequestScreen(
                            propertyTitle: widget.propertyTitle,
                            propertyLocation: widget.propertyLocation,
                            propertyPrice: widget.propertyPrice,
                            propertyImage: widget.propertyImage,
                          ))
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.button,
                    disabledBackgroundColor: AppColors.button.withValues(alpha: 0.5),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Send Request',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'poppins',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),

              // Cancel Button
              Center(
                child: TextButton(
                  onPressed: () => Get.back(),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: AppColors.secondaryTextColor,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'poppins',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }
}
