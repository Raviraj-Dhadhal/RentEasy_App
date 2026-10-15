import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/commons/widgets/app_bar/appbar.dart';
import 'package:renteasy_app/features/authentication/screens/login/login.dart';
import 'package:renteasy_app/features/pg/screens/reviews/widgets/review_card.dart';
import 'package:renteasy_app/features/pg/screens/reviews/widgets/review_property_header.dart';
import 'package:renteasy_app/features/pg/screens/reviews/widgets/review_rating_summary.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/image_string.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({
    super.key,
    this.propertyTitle = 'Modern 1BHK Apartment',
    this.propertyLocation = 'Amin Marg, Rajkot',
    this.propertyImage = images.propertyHome1,
  });

  final String propertyTitle;
  final String propertyLocation;
  final String propertyImage;

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  String selectedFilter = 'All';
  final List<String> filters = ['All', 'Latest', 'Highest Rating', 'Lowest Rating'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: RAppBar(
        showBackArrow: true,
        titleText: 'Reviews',
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
              // Property Header Card
              ReviewPropertyHeader(
                title: widget.propertyTitle,
                location: widget.propertyLocation,
                image: widget.propertyImage,
              ),
              const SizedBox(height: 16.0),

              // Rating Summary Box
              const ReviewRatingSummary(rating: '4.8', reviewCount: '124'),
              const SizedBox(height: 16.0),

              // Filter Chips
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: filters.map((filter) {
                    final isSelected = filter == selectedFilter;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        onTap: () => setState(() => selectedFilter = filter),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: isSelected ? AppColors.button : const Color(0xFFF0F1FA),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text(
                            filter,
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                              color: isSelected ? Colors.white : AppColors.secondaryTextColor,
                              fontFamily: 'poppins',
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16.0),

              // Review Cards
              const ReviewCard(
                name: 'Anish Sharma',
                timeAgo: '2 days ago',
                comment: 'Rajesh is an excellent owner. He responds very quickly to maintenance requests and ensured the moving process was seamless.',
                rating: 5,
                helpfulCount: 12,
              ),
              const SizedBox(height: 12.0),

              ReviewCard(
                name: 'Megha Varma',
                timeAgo: '1 week ago',
                comment: 'The apartment is exactly as shown in the photos. Very clean and well-maintained. The neighborhood is quiet and safe.',
                rating: 5,
                helpfulCount: 8,
                attachedImage: widget.propertyImage,
              ),
              const SizedBox(height: 12.0),

              const ReviewCard(
                name: 'Karan Mehta',
                timeAgo: '2 weeks ago',
                comment: 'Great value for money. The Wi-Fi is fast and the location is perfect for commuters.',
                rating: 5,
                helpfulCount: 5,
              ),
              const SizedBox(height: 12.0),

              const ReviewCard(
                name: 'Priya Singh',
                timeAgo: '1 month ago',
                comment: 'Smooth check-in process. The owner was very helpful with local recommendations.',
                rating: 5,
                helpfulCount: 0,
              ),
              const SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
    );
  }
}
