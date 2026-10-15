import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/commons/widgets/app_bar/appbar.dart';
import 'package:renteasy_app/features/authentication/screens/login/login.dart';
import 'package:renteasy_app/features/pg/screens/gallery/widgets/gallery_category_grid.dart';
import 'package:renteasy_app/features/pg/screens/gallery/widgets/gallery_hero_image.dart';
import 'package:renteasy_app/features/pg/screens/gallery/widgets/gallery_view_all_card.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/image_string.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: RAppBar(
        showBackArrow: true,
        titleText: 'Gallery',
        action: [
          IconButton(
            icon: const Icon(Icons.share_outlined, color: AppColors.button),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.logout_rounded, color: AppColors.button),
            onPressed: () {
              Get.defaultDialog(
                title: 'Logout',
                middleText: 'Are you sure you want to log out of RentEasy?',
                textConfirm: 'Logout',
                textCancel: 'Cancel',
                confirmTextColor: Colors.white,
                buttonColor: AppColors.error,
                onConfirm: () => Get.offAll(() => const LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Main Featured Hero Image with count badge
              const GalleryHeroImage(
                image: images.propertyLivingRoom,
                countText: '1/12',
              ),
              const SizedBox(height: 20.0),

              // Living Room Category
              const GalleryCategoryGrid(
                title: 'Living Room',
                image1: images.propertyLivingRoom,
                image2: images.propertyHome2Living,
              ),
              const SizedBox(height: 20.0),

              // Bedroom Category
              const GalleryCategoryGrid(
                title: 'Bedroom',
                image1: images.propertyBedroom,
                image2: images.propertyHome1,
              ),
              const SizedBox(height: 20.0),

              // Kitchen & Bathroom Category with View All action
              GalleryViewAllCard(
                image: images.propertyKitchen,
                totalPhotos: '12',
                onTap: () {
                  Get.snackbar(
                    'Full Gallery',
                    'Showing all 12 high-resolution photos',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: AppColors.button,
                    colorText: Colors.white,
                  );
                },
              ),
              const SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
    );
  }
}
