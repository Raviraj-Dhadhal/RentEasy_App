import 'package:flutter/material.dart';
import 'package:renteasy_app/commons/widgets/app_bar/appbar.dart';
import 'package:renteasy_app/features/pg/screens/contact_us/widgets/contact_info_tiles.dart';
import 'package:renteasy_app/features/pg/screens/contact_us/widgets/contact_message_form.dart';
import 'package:renteasy_app/features/pg/screens/contact_us/widgets/contact_support_card.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

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
              'Contact Us',
              style: Theme.of(context).textTheme.headlineSmall!.apply(color: AppColors.primaryTextColor).copyWith(fontWeight: FontWeight.bold),
            ),
            const Text(
              'Get in touch with our support team',
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
              // Customer Support Card (Call & Chat)
              const ContactSupportCard(),
              SizedBox(height: AppSizes.spaceBtwSections),

              // Contact Info Tiles (Email, Phone, Address)
              const ContactInfoTiles(),
              SizedBox(height: AppSizes.spaceBtwSections),

              // Message Form
              const ContactMessageForm(),
              const SizedBox(height: 36.0),
            ],
          ),
        ),
      ),
    );
  }
}
