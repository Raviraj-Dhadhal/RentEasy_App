import 'package:flutter/material.dart';
import 'package:renteasy_app/commons/widgets/app_bar/appbar.dart';
import 'package:renteasy_app/features/pg/screens/nearby/widgets/nearby_location_badge.dart';
import 'package:renteasy_app/features/pg/screens/nearby/widgets/nearby_property_tile.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/image_string.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class NearbyPropertiesScreen extends StatelessWidget {
  const NearbyPropertiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const RAppBar(
        showBackArrow: true,
        showLogout: true,
        titleText: 'Nearby You',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Current Location Badge & Info
              const NearbyLocationBadge(),
              const SizedBox(height: 18.0),

              // Nearby Property List
              NearbyPropertyTile(
                image: images.propertyHome1,
                title: 'Skyline Heights',
                distance: '450 m away',
                location: 'Amin Marg, Rajkot',
                price: '₹24,000',
                rating: '4.8',
              ),
              const SizedBox(height: 12.0),

              NearbyPropertyTile(
                image: images.propertyHome2,
                title: 'The Green Villa',
                distance: '1.2 km away',
                location: 'Kalawad Road, Rajkot',
                price: '₹42,000',
                rating: '4.6',
              ),
              const SizedBox(height: 12.0),

              NearbyPropertyTile(
                image: images.propertyHome3,
                title: 'Modern Studio',
                distance: '2.5 km away',
                location: 'Yagnik Road, Rajkot',
                price: '₹18,500',
                rating: '4.9',
              ),
              const SizedBox(height: 12.0),

              NearbyPropertyTile(
                image: images.propertyBedroom,
                title: 'Royal Residency',
                distance: '3.8 km away',
                location: 'University Road, Rajkot',
                price: '₹35,000',
                rating: '4.7',
              ),
              const SizedBox(height: 12.0),

              NearbyPropertyTile(
                image: images.propertyKitchen,
                title: 'The Penthouse',
                distance: '4.2 km away',
                location: 'Race Course Road, Rajkot',
                price: '₹65,000',
                rating: '5.0',
              ),
              const SizedBox(height: 36.0),
            ],
          ),
        ),
      ),
    );
  }
}
