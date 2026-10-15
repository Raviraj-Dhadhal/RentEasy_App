import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';

class PayRentBillDetails extends StatelessWidget {
  const PayRentBillDetails({
    super.key,
    this.monthlyRent = '₹2,400.00',
    this.maintenance = '₹150.00',
    this.securityDeposit = '₹0.00',
    this.discount = '-₹50.00',
    this.subtotal = '₹2,500.00',
  });

  final String monthlyRent;
  final String maintenance;
  final String securityDeposit;
  final String discount;
  final String subtotal;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.propertyContainerBG,
        borderRadius: BorderRadius.circular(18.0),
        border: Border.all(color: const Color(0xFFEBEBF5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'BILL DETAILS',
            style: TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.6,
              color: AppColors.secondaryTextColor,
              fontFamily: 'poppins',
            ),
          ),
          const SizedBox(height: 12.0),
          _buildRow('Monthly Rent', monthlyRent),
          const SizedBox(height: 8.0),
          _buildRow('Maintenance', maintenance),
          const SizedBox(height: 8.0),
          _buildRow('Security Deposit', securityDeposit),
          const SizedBox(height: 8.0),
          _buildRow('Discount', discount, isDiscount: true),
          const SizedBox(height: 12.0),
          const Divider(color: Color(0xFFEBEBF5), height: 1.0),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Subtotal',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryTextColor,
                  fontFamily: 'poppins',
                ),
              ),
              Text(
                subtotal,
                style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryTextColor,
                  fontFamily: 'poppins',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value, {bool isDiscount = false}) {
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
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
            color: isDiscount ? AppColors.button : AppColors.primaryTextColor,
            fontFamily: 'poppins',
          ),
        ),
      ],
    );
  }
}
