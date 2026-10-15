import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';

class AgreementSignatureBox extends StatefulWidget {
  const AgreementSignatureBox({super.key});

  @override
  State<AgreementSignatureBox> createState() => _AgreementSignatureBoxState();
}

class _AgreementSignatureBoxState extends State<AgreementSignatureBox> {
  bool hasSigned = false;
  bool agreeTerms = true;
  bool agreeLegal = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Digital Signature',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'poppins',
                color: AppColors.primaryTextColor,
              ),
            ),
            GestureDetector(
              onTap: () => setState(() => hasSigned = false),
              child: const Text(
                'Clear Signature',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'poppins',
                  color: AppColors.button,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0),

        // Signature Canvas Box
        GestureDetector(
          onTap: () => setState(() => hasSigned = true),
          child: Container(
            width: double.infinity,
            height: 110,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(
                color: const Color(0xFFC8CEE5),
                style: BorderStyle.solid,
                width: 1.2,
              ),
            ),
            child: hasSigned
                ? Center(
                    child: Text(
                      'John Doe',
                      style: TextStyle(
                        fontFamily: 'cursive',
                        fontSize: 28.0,
                        color: AppColors.button,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.draw_outlined, size: 24, color: Color(0xFF9E9EAF)),
                      SizedBox(height: 6),
                      Text(
                        'Draw Your Signature',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color(0xFF9E9EAF),
                          fontFamily: 'poppins',
                        ),
                      ),
                    ],
                  ),
          ),
        ),
        const SizedBox(height: 14.0),

        // Checkbox 1
        _buildCheckboxRow(
          value: agreeTerms,
          onTap: () => setState(() => agreeTerms = !agreeTerms),
          text: 'I have read and agree to the Terms & Conditions.',
        ),
        const SizedBox(height: 8.0),

        // Checkbox 2
        _buildCheckboxRow(
          value: agreeLegal,
          onTap: () => setState(() => agreeLegal = !agreeLegal),
          text: 'I confirm the information provided is accurate and represent legal commitment.',
        ),
      ],
    );
  }

  Widget _buildCheckboxRow({required bool value, required VoidCallback onTap, required String text}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 18,
            height: 18,
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
              color: value ? AppColors.button : Colors.transparent,
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(
                color: value ? AppColors.button : const Color(0xFFC0C0D0),
                width: 1.5,
              ),
            ),
            child: value ? const Icon(Icons.check, size: 12, color: Colors.white) : null,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 11.0,
                color: AppColors.secondaryTextColor,
                fontFamily: 'poppins',
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
