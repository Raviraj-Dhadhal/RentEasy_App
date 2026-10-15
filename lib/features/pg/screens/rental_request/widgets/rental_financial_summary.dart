import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';

class RentalFinancialSummary extends StatelessWidget {
  const RentalFinancialSummary({
    super.key,
    this.securityDeposit = '₹36,000',
    this.monthlyRent = '₹18,000',
    this.agreementDuration = '11 Months',
  });

  final String securityDeposit;
  final String monthlyRent;
  final String agreementDuration;

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
            'FINANCIAL SUMMARY',
            style: TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.6,
              color: AppColors.secondaryTextColor,
              fontFamily: 'poppins',
            ),
          ),
          const SizedBox(height: 12.0),
          _buildRow('Security Deposit', securityDeposit),
          const SizedBox(height: 8.0),
          _buildRow('Monthly Rent', monthlyRent),
          const SizedBox(height: 10.0),
          const Divider(color: Color(0xFFEBEBF5), height: 1.0),
          const SizedBox(height: 10.0),
          _buildRow('Agreement Duration', agreementDuration, isBold: true),
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12.0,
            color: isBold ? AppColors.primaryTextColor : AppColors.secondaryTextColor,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontFamily: 'poppins',
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.bold,
            color: isBold ? AppColors.button : AppColors.primaryTextColor,
            fontFamily: 'poppins',
          ),
        ),
      ],
    );
  }
}
