import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/commons/widgets/app_bar/appbar.dart';
import 'package:renteasy_app/features/pg/screens/rent_agreement/widgets/agreement_id_card.dart';
import 'package:renteasy_app/features/pg/screens/rent_agreement/widgets/agreement_property_card.dart';
import 'package:renteasy_app/features/pg/screens/rent_agreement/widgets/agreement_sections_list.dart';
import 'package:renteasy_app/features/pg/screens/rent_agreement/widgets/agreement_signature_box.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/image_string.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class RentAgreementScreen extends StatelessWidget {
  const RentAgreementScreen({
    super.key,
    this.agreementId = '#RE-2024-884',
    this.propertyTitle = 'The Aura Residences',
    this.propertyLocation = '123 Skyview Terrace, Downtown',
    this.monthlyRent = '₹2,400',
    this.securityDeposit = '₹2,400',
    this.propertyImage = images.propertyHome3,
  });

  final String agreementId;
  final String propertyTitle;
  final String propertyLocation;
  final String monthlyRent;
  final String securityDeposit;
  final String propertyImage;

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
              'Sign Rent Agreement',
              style: Theme.of(context).textTheme.headlineSmall!.apply(color: AppColors.primaryTextColor).copyWith(fontWeight: FontWeight.bold),
            ),
            const Text(
              'Review and sign your rental agreement',
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
              // Agreement ID & Dates Card
              AgreementIdCard(agreementId: agreementId),
              const SizedBox(height: 16.0),

              // Property Card with Top Rounded Image
              AgreementPropertyCard(
                title: propertyTitle,
                location: propertyLocation,
                monthlyRent: monthlyRent,
                securityDeposit: securityDeposit,
                image: propertyImage,
              ),
              const SizedBox(height: 18.0),

              // Agreement Clauses and Sections
              const AgreementSectionsList(),
              const SizedBox(height: 20.0),

              // Digital Signature Box
              const AgreementSignatureBox(),
              const SizedBox(height: 24.0),

              // Sign & Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.snackbar(
                      'Agreement Signed',
                      'Your digital agreement $agreementId has been securely signed and submitted!',
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
                    'Sign & Finalize Agreement',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
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
