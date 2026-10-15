import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/image_string.dart';

class AgreementPropertyCard extends StatelessWidget {
  const AgreementPropertyCard({
    super.key,
    this.title = 'The Aura Residences',
    this.location = '123 Skyview Terrace, Downtown',
    this.monthlyRent = '₹2,400',
    this.securityDeposit = '₹2,400',
    this.duration = '12 Months',
    this.ownerName = 'Sarah Mitchell',
    this.image = images.propertyHome3,
  });

  final String title;
  final String location;
  final String monthlyRent;
  final String securityDeposit;
  final String duration;
  final String ownerName;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.propertyContainerBG,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: const Color(0xFFEBEBF5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Image with upper corner radius
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
            child: Image.asset(
              image,
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 140,
                color: const Color(0xFFEDEAFD),
                child: const Icon(Icons.apartment, size: 48, color: AppColors.button),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'poppins',
                    color: AppColors.primaryTextColor,
                  ),
                ),
                const SizedBox(height: 3.0),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 14, color: AppColors.secondaryTextColor),
                    const SizedBox(width: 3),
                    Expanded(
                      child: Text(
                        location,
                        style: const TextStyle(
                          fontSize: 11.0,
                          fontFamily: 'poppins',
                          color: AppColors.secondaryTextColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),

                // Stat Boxes (Monthly Rent & Security Deposit)
                Row(
                  children: [
                    Expanded(child: _buildStatBox('Monthly Rent', monthlyRent)),
                    const SizedBox(width: 10),
                    Expanded(child: _buildStatBox('Security Deposit', securityDeposit)),
                  ],
                ),
                const SizedBox(height: 12.0),
                const Divider(color: Color(0xFFEBEBF5), height: 1.0),
                const SizedBox(height: 10.0),

                // Duration & Owner Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.access_time, size: 14, color: AppColors.secondaryTextColor),
                        const SizedBox(width: 4),
                        Text(
                          '$duration Duration',
                          style: const TextStyle(
                            fontSize: 11.0,
                            color: AppColors.secondaryTextColor,
                            fontFamily: 'poppins',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.person_outline, size: 14, color: AppColors.secondaryTextColor),
                        const SizedBox(width: 4),
                        Text(
                          'Owner: $ownerName',
                          style: const TextStyle(
                            fontSize: 11.0,
                            color: AppColors.secondaryTextColor,
                            fontFamily: 'poppins',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatBox(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F3FE),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
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
              fontSize: 13.0,
              fontWeight: FontWeight.bold,
              color: AppColors.button,
              fontFamily: 'poppins',
            ),
          ),
        ],
      ),
    );
  }
}
