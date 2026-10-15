import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/commons/widgets/app_bar/appbar.dart';
import 'package:renteasy_app/features/authentication/screens/login/login.dart';
import 'package:renteasy_app/features/pg/screens/book_visit/book_visit.dart';
import 'package:renteasy_app/features/pg/screens/property_details/widgets/property_detail_amenities.dart';
import 'package:renteasy_app/features/pg/screens/property_details/widgets/property_detail_gallery_preview.dart';
import 'package:renteasy_app/features/pg/screens/property_details/widgets/property_detail_hero.dart';
import 'package:renteasy_app/features/pg/screens/property_details/widgets/property_detail_location_card.dart';
import 'package:renteasy_app/features/pg/screens/property_details/widgets/property_detail_owner_card.dart';
import 'package:renteasy_app/features/pg/screens/property_details/widgets/property_detail_reviews_preview.dart';
import 'package:renteasy_app/features/pg/screens/property_details/widgets/property_detail_specs.dart';
import 'package:renteasy_app/features/pg/screens/rental_request/rental_request_form.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/image_string.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class PropertyDetailsScreen extends StatefulWidget {
  const PropertyDetailsScreen({
    super.key,
    this.title = 'Modern 2BHK Apartment',
    this.location = 'Navrangpura, Ahmedabad',
    this.price = '₹18,000',
    this.rating = '4.8',
    this.unitType = 'Apartment',
    this.image = images.propertyHome2,
  });

  final String title;
  final String location;
  final String price;
  final String rating;
  final String unitType;
  final String image;

  @override
  State<PropertyDetailsScreen> createState() => _PropertyDetailsScreenState();
}

class _PropertyDetailsScreenState extends State<PropertyDetailsScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: RAppBar(
        showBackArrow: true,
        titleText: 'Property Profile',
        action: [
          IconButton(
            icon: const Icon(Icons.share_outlined, color: AppColors.button),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : AppColors.button,
            ),
            onPressed: () => setState(() => isFavorite = !isFavorite),
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
              // Hero Photo Banner with Available status & 1/11 count
              PropertyDetailHero(image: widget.image),
              const SizedBox(height: 16.0),

              // Title & Rating
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: AppSizes.fontSizeLg + 1,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'poppins',
                        color: AppColors.primaryTextColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDEAFD),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star, color: Color(0xFFF59E0B), size: 14),
                        const SizedBox(width: 3),
                        Text(
                          widget.rating,
                          style: TextStyle(
                            fontSize: AppSizes.fontSizeXs,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'poppins',
                            color: AppColors.button,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4.0),

              // Location
              Row(
                children: [
                  const Icon(Icons.location_on_outlined, size: 14, color: AppColors.secondaryTextColor),
                  const SizedBox(width: 3),
                  Text(
                    widget.location,
                    style: TextStyle(
                      fontSize: AppSizes.fontSizeXs,
                      color: AppColors.secondaryTextColor,
                      fontFamily: 'poppins',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12.0),

              // Price & Apartment Pill
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: widget.price,
                      style: TextStyle(
                        fontSize: AppSizes.fontSizeCustom - 2,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'poppins',
                        color: AppColors.button,
                      ),
                      children: [
                        TextSpan(
                          text: '/month',
                          style: TextStyle(
                            fontSize: AppSizes.fontSizeXs,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'poppins',
                            color: AppColors.secondaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDEAFD),
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    child: Text(
                      widget.unitType,
                      style: TextStyle(
                        fontSize: AppSizes.fontSizeXs,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'poppins',
                        color: AppColors.button,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18.0),

              // 2x3 Key Features / Specs Grid
              const PropertyDetailSpecs(),
              const SizedBox(height: 18.0),

              // Description Section
              Text(
                'Luminous Living',
                style: TextStyle(
                  fontSize: AppSizes.fontSizeMd,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'poppins',
                  color: AppColors.primaryTextColor,
                ),
              ),
              const SizedBox(height: 6.0),
              RichText(
                text: TextSpan(
                  text: 'Experience unparalleled comfort in this bright and airy 2BHK. Nestled in the heart of Navrangpura, this home features floor-to-... ',
                  style: TextStyle(
                    fontSize: AppSizes.fontSizeXs,
                    color: AppColors.secondaryTextColor,
                    fontFamily: 'poppins',
                    height: 1.4,
                  ),
                  children: const [
                    TextSpan(
                      text: 'Read More',
                      style: TextStyle(
                        color: AppColors.button,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18.0),

              // Amenities
              const PropertyDetailAmenities(),
              const SizedBox(height: 18.0),

              // Gallery Preview (Living room, kitchen, bedroom thumbnails)
              const PropertyDetailGalleryPreview(),
              const SizedBox(height: 18.0),

              // Location with Map Preview
              const PropertyDetailLocationCard(),
              const SizedBox(height: 18.0),

              // Verified Owner Card
              const PropertyDetailOwnerCard(),
              const SizedBox(height: 18.0),

              // Reviews Preview
              const PropertyDetailReviewsPreview(),
              const SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Get.to(() => BookVisitScreen(
                        propertyTitle: widget.title,
                        propertyLocation: widget.location,
                        propertyPrice: widget.price,
                        propertyImage: widget.image,
                      )),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF38384E),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                    padding: const EdgeInsets.symmetric(vertical: 13.0),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Book Visit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'poppins',
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Get.to(() => RentalRequestFormScreen(
                        propertyTitle: widget.title,
                        propertyLocation: widget.location,
                        propertyPrice: '${widget.price}/mo',
                        propertyImage: widget.image,
                      )),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.button,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                    padding: const EdgeInsets.symmetric(vertical: 13.0),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Request Rental',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'poppins',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
