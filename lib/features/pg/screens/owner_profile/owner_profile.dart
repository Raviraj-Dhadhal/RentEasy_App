import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/commons/widgets/app_bar/appbar.dart';
import 'package:renteasy_app/features/authentication/screens/login/login.dart';
import 'package:renteasy_app/features/pg/screens/book_visit/book_visit.dart';
import 'package:renteasy_app/features/pg/screens/owner_profile/widgets/owner_contact_card.dart';
import 'package:renteasy_app/features/pg/screens/owner_profile/widgets/owner_header_card.dart';
import 'package:renteasy_app/features/pg/screens/owner_profile/widgets/owner_listed_properties.dart';
import 'package:renteasy_app/features/pg/screens/owner_profile/widgets/owner_review_card.dart';
import 'package:renteasy_app/features/pg/screens/owner_profile/widgets/owner_stats_row.dart';
import 'package:renteasy_app/features/pg/screens/rental_request/rental_request_form.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class OwnerProfileScreen extends StatelessWidget {
  const OwnerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: RAppBar(
        showBackArrow: true,
        action: [
          IconButton(
            icon: const Icon(Icons.share_outlined, color: AppColors.button),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.logout_rounded, color: AppColors.button),
            onPressed: () {
              Get.defaultDialog(
                title: 'Logout',
                middleText: 'Are you sure you want to log out of RentEasy?',
                textConfirm: 'Logout',
                textCancel: 'Cancel',
                confirmTextColor: Colors.white,
                buttonColor: AppColors.error,
                onConfirm: () => Get.offAll(() => const LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              // Header & verified avatar
              OwnerHeaderCard(),
              SizedBox(height: 20.0),

              // 3 Stats circles
              OwnerStatsRow(),
              SizedBox(height: 20.0),

              // Bio & Contact Details
              OwnerContactCard(),
              SizedBox(height: 20.0),

              // Listed Properties
              OwnerListedProperties(),
              SizedBox(height: 20.0),

              // Reviews
              OwnerReviewCard(),
              SizedBox(height: 28.0),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const BookVisitScreen()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF38384E),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                    padding: const EdgeInsets.symmetric(vertical: 13.0),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Book Visit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'poppins',
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const RentalRequestFormScreen()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.button,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                    padding: const EdgeInsets.symmetric(vertical: 13.0),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Request Rental',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
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
}
