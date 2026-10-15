import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';

class PayRentPromoCode extends StatefulWidget {
  const PayRentPromoCode({super.key});

  @override
  State<PayRentPromoCode> createState() => _PayRentPromoCodeState();
}

class _PayRentPromoCodeState extends State<PayRentPromoCode> {
  final TextEditingController _codeController = TextEditingController();

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'PROMO CODE',
          style: TextStyle(
            fontSize: 10.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.6,
            color: AppColors.secondaryTextColor,
            fontFamily: 'poppins',
          ),
        ),
        const SizedBox(height: 8.0),
        Container(
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(color: const Color(0xFFE2E2EA)),
          ),
          child: Row(
            children: [
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  controller: _codeController,
                  decoration: const InputDecoration(
                    hintText: 'Enter coupon code',
                    hintStyle: TextStyle(
                      fontSize: 12.0,
                      color: Color(0xFF9E9EAF),
                      fontFamily: 'poppins',
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.button,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                  padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
                  elevation: 0,
                ),
                child: const Text(
                  'Apply',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
