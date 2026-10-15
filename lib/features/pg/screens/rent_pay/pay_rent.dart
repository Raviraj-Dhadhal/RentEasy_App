import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/commons/widgets/app_bar/appbar.dart';
import 'package:renteasy_app/features/pg/screens/rent_pay/widgets/pay_rent_bill_details.dart';
import 'package:renteasy_app/features/pg/screens/rent_pay/widgets/pay_rent_methods.dart';
import 'package:renteasy_app/features/pg/screens/rent_pay/widgets/pay_rent_promo_code.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class PayRentScreen extends StatelessWidget {
  const PayRentScreen({
    super.key,
    this.totalPayable = '₹2,517.50',
  });

  final String totalPayable;

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
              'Pay Rent',
              style: Theme.of(context).textTheme.headlineSmall!.apply(color: AppColors.primaryTextColor).copyWith(fontWeight: FontWeight.bold),
            ),
            const Text(
              'Secure and hassle-free rent payment',
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
              // Bill Details Card
              const PayRentBillDetails(),
              const SizedBox(height: 18.0),

              // Payment Methods
              const PayRentMethods(),
              const SizedBox(height: 18.0),

              // Promo Code Box
              const PayRentPromoCode(),
              const SizedBox(height: 18.0),

              // Fee Breakdown
              _buildFeeRow('Transaction fee', '₹5.00'),
              const SizedBox(height: 6.0),
              _buildFeeRow('GST / Taxes', '₹12.50'),
              const SizedBox(height: 12.0),
              const Divider(color: Color(0xFFEBEBF5), height: 1.0),
              const SizedBox(height: 10.0),

              // Final Amount
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Final Payable Amount',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'poppins',
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                  Text(
                    totalPayable,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'poppins',
                      color: AppColors.button,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14.0),

              // Security Guarantee
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0FDF4),
                  borderRadius: BorderRadius.circular(14.0),
                  border: Border.all(color: const Color(0xFFDCFCE7)),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.verified_user_outlined, color: Color(0xFF16A34A), size: 18),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Your payment is protected with end-to-end encryption.',
                        style: TextStyle(
                          fontSize: 11.0,
                          color: Color(0xFF15803D),
                          fontWeight: FontWeight.w500,
                          fontFamily: 'poppins',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32.0),
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
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total Payable',
                    style: TextStyle(
                      fontSize: 11.0,
                      color: AppColors.secondaryTextColor,
                      fontFamily: 'poppins',
                    ),
                  ),
                  Text(
                    totalPayable,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryTextColor,
                      fontFamily: 'poppins',
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Get.snackbar(
                    'Payment Successful',
                    'Your rent payment of $totalPayable has been processed!',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: AppColors.button,
                    colorText: Colors.white,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.button,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                  padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 12.0),
                  elevation: 0,
                ),
                child: const Text(
                  'Pay Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeeRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12.0,
            color: AppColors.secondaryTextColor,
            fontFamily: 'poppins',
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryTextColor,
            fontFamily: 'poppins',
          ),
        ),
      ],
    );
  }
}
