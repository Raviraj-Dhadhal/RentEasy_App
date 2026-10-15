import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';

class AgreementIdCard extends StatelessWidget {
  const AgreementIdCard({
    super.key,
    this.agreementId = '#RE-2024-884',
    this.status = 'Pending Signature',
    this.createdDate = 'Oct 20, 2024',
    this.effectiveDate = 'Nov 01, 2024',
    this.expiryDate = 'Oct 31, 2025',
  });

  final String agreementId;
  final String status;
  final String createdDate;
  final String effectiveDate;
  final String expiryDate;

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'AGREEMENT ID',
                    style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      color: AppColors.secondaryTextColor,
                      fontFamily: 'poppins',
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    agreementId,
                    style: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryTextColor,
                      fontFamily: 'poppins',
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                decoration: BoxDecoration(
                  color: AppColors.button,
                  borderRadius: BorderRadius.circular(14.0),
                ),
                child: Text(
                  status,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14.0),
          const Divider(color: Color(0xFFEBEBF5), height: 1.0),
          const SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDateItem('Created', createdDate),
              _buildDateItem('Effective', effectiveDate),
              _buildDateItem('Expiry', expiryDate),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDateItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 10.0,
            color: AppColors.secondaryTextColor,
            fontFamily: 'poppins',
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            fontSize: 11.0,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryTextColor,
            fontFamily: 'poppins',
          ),
        ),
      ],
    );
  }
}
