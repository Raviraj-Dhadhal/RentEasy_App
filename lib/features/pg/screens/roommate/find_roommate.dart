import 'package:flutter/material.dart';
import 'package:renteasy_app/commons/widgets/app_bar/appbar.dart';
import 'package:renteasy_app/commons/widgets/floating_action_button/floating_action_button.dart';
import 'package:renteasy_app/features/pg/screens/roommate/widgets/roommate_filter_card.dart';
import 'package:renteasy_app/features/pg/screens/roommate/widgets/roommate_match_card.dart';
import 'package:renteasy_app/features/pg/screens/roommate/widgets/roommate_recommended_section.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/image_string.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';

class FindRoommateScreen extends StatelessWidget {
  const FindRoommateScreen({super.key});

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
              'Find Roommate',
              style: Theme.of(context).textTheme.headlineSmall!.apply(color: AppColors.primaryTextColor).copyWith(fontWeight: FontWeight.bold),
            ),
            const Text(
              'Find your perfect roommate match',
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
              // Search & Filter Card
              const RoommateFilterCard(),
              const SizedBox(height: 20.0),

              // Recommended For You (Horizontal Carousel)
              const RoommateRecommendedSection(),
              const SizedBox(height: 20.0),

              // Top Matches Heading
              const Text(
                'Top Matches',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'poppins',
                  color: AppColors.primaryTextColor,
                ),
              ),
              const SizedBox(height: 12.0),

              // Candidate 1
              const RoommateMatchCard(
                name: 'Mahek, 19',
                profession: 'UX Designer',
                location: 'Ahmedabad',
                budget: '₹15,000/mo',
                compatibility: '95% Compatibility',
                moveInDate: 'Oct 1st, 2023',
                tags: ['Non-smoker', 'Pet friendly', 'Working professional'],
                image: images.userProfileImage,
              ),
              const SizedBox(height: 14.0),

              // Candidate 2
              const RoommateMatchCard(
                name: 'Dhara, 19',
                profession: 'Marketing Lead',
                location: 'Satellite, Ahmedabad',
                budget: '₹18,000/mo',
                compatibility: '88% Compatibility',
                moveInDate: 'Sept 20th, 2023',
                tags: ['Vegetarian', 'Gym enthusiast', 'Quiet environment'],
                image: images.userProfileImage,
              ),
              const SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
      floatingActionButton: const RFloatingActionButton(heroTag: 'roommate_fab'),
    );
  }
}
