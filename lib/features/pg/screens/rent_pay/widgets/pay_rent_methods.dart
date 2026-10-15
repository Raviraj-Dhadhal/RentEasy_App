import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';

class PayRentMethods extends StatefulWidget {
  const PayRentMethods({super.key});

  @override
  State<PayRentMethods> createState() => _PayRentMethodsState();
}

class _PayRentMethodsState extends State<PayRentMethods> {
  String selectedMethod = 'UPI';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Payment Method',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'poppins',
            color: AppColors.primaryTextColor,
          ),
        ),
        const SizedBox(height: 10.0),
        _buildMethodTile(
          id: 'UPI',
          icon: Icons.account_balance_wallet_outlined,
          title: 'UPI',
          subtitle: 'Google Pay, PhonePe, BHIM',
        ),
        const SizedBox(height: 10.0),
        _buildMethodTile(
          id: 'Card',
          icon: Icons.credit_card_outlined,
          title: 'Credit Card',
          subtitle: 'Visa, Mastercard, Amex',
        ),
        const SizedBox(height: 10.0),
        _buildMethodTile(
          id: 'NetBanking',
          icon: Icons.account_balance_outlined,
          title: 'Net Banking',
          subtitle: 'Instant bank transfer',
        ),
      ],
    );
  }

  Widget _buildMethodTile({
    required String id,
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    final isSelected = selectedMethod == id;
    return GestureDetector(
      onTap: () => setState(() => selectedMethod = id),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: AppColors.propertyContainerBG,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: isSelected ? AppColors.button : const Color(0xFFEBEBF5),
            width: isSelected ? 1.5 : 1.0,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.button : const Color(0xFFC0C0D0),
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: AppColors.button,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 14),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color(0xFFEDEAFD),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Icon(icon, color: AppColors.button, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'poppins',
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 10.0,
                      color: AppColors.secondaryTextColor,
                      fontFamily: 'poppins',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
