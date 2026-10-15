import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/features/pg/screens/book_visit/book_visit.dart';
import 'package:renteasy_app/features/pg/screens/rent_agreement/rent_agreement.dart';
import 'package:renteasy_app/features/pg/screens/rent_pay/pay_rent.dart';
import 'package:renteasy_app/features/pg/screens/rental_request/review_rental_request.dart';
import 'package:renteasy_app/features/pg/screens/reviews/reviews_screen.dart';
import 'package:renteasy_app/features/pg/screens/wishlist/wishlist.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class ProfileActivityMenu extends StatelessWidget {
  const ProfileActivityMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'ACTIVITY',
          style: TextStyle(
            fontSize: 11.0,
            fontWeight: FontWeight.bold,
            color: AppColors.secondaryTextColor,
            fontFamily: 'poppins',
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: 10.0),
        Container(
          decoration: BoxDecoration(
            color: AppColors.propertyContainerBG,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: const Color(0xFFEBEBF5)),
          ),
          child: Column(
            children: [
              _buildMenuItem(
                icon: Icons.calendar_month_outlined,
                title: 'Book Visit',
                onTap: () => Get.to(() => const BookVisitScreen()),
              ),
              _buildDivider(),
              _buildMenuItem(
                icon: Icons.favorite_border_rounded,
                title: 'Wishlist',
                onTap: () => Get.to(() => const WishlistScreen()),
              ),
              _buildDivider(),
              _buildMenuItem(
                icon: Icons.assignment_outlined,
                title: 'Rental Request',
                onTap: () => Get.to(() => const ReviewRentalRequestScreen()),
              ),
              _buildDivider(),
              _buildMenuItem(
                icon: Icons.description_outlined,
                title: 'Rent Agreement',
                onTap: () => Get.to(() => const RentAgreementScreen()),
              ),
              _buildDivider(),
              _buildMenuItem(
                icon: Icons.account_balance_wallet_outlined,
                title: 'Pay Rent',
                onTap: () => Get.to(() => const PayRentScreen()),
              ),
              _buildDivider(),
              _buildMenuItem(
                icon: Icons.star_border_rounded,
                title: 'Reviews',
                onTap: () => Get.to(() => const ReviewsScreen()),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: const Color(0xFFEDEAFD),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Icon(icon, color: AppColors.button, size: 20),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: AppSizes.fontSizeSm,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryTextColor,
          fontFamily: 'poppins',
        ),
      ),
      trailing: const Icon(Icons.chevron_right, size: 20, color: AppColors.secondaryTextColor),
    );
  }

  Widget _buildDivider() {
    return const Divider(color: Color(0xFFEBEBF5), height: 1.0, indent: 60, endIndent: 16);
  }
}
