import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/features/authentication/controllers/onboarding_controller.dart';
import 'package:renteasy_app/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:renteasy_app/utilities/constants/image_string.dart';
// import 'package:renteasy_app/utilities/helpers/helper_function.dart';
import 'package:renteasy_app/utilities/constants/text_strings.dart';
// import 'package:renteasy_app/utilities/constants/sizes.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
// import 'package:renteasy_app/utilities/devices/devices_utilities.dart';
import 'package:renteasy_app/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:renteasy_app/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
// import 'package:renteasy_app/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:renteasy_app/features/authentication/screens/onboarding/widgets/onboarding_elevated_button.dart';
// import 'package:renteasy_app/utilities/devices/devices_utilities.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller managing active onboarding index and smooth page transitions
    final controllerPage = Get.put(OnBoardingController());

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          // Horizontal scrollable pages displaying illustrations, titles & subtitles
          PageView(
            controller: controllerPage.pageController,
            onPageChanged: controllerPage.updatePageIndicator,
            children: const [
              // Screen-specific custom widget: Page 1 slide
              OnBoardingPage(
                image: images.onBoardingImage1,
                title: AppTexts.onBoardingTitle1,
                subTitle: AppTexts.onBoardingSubTitle1,
              ),
              // Screen-specific custom widget: Page 2 slide
              OnBoardingPage(
                image: images.onBoardingImage2,
                title: AppTexts.onBoardingTitle2,
                subTitle: AppTexts.onBoardingSubTitle2,
              ),
              // Screen-specific custom widget: Page 3 slide
              OnBoardingPage(
                image: images.onBoardingImage3,
                title: AppTexts.onBoardingTitle3,
                subTitle: AppTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          // Screen-specific custom widget: Top-right Skip button to jump to last page
          OnBoardingSkip(),

          // Screen-specific custom widget: Bottom worm-style smooth dot page indicator
          OnBoardingDotNavigation(),

          // Screen-specific custom widget: Floating circular next/finish button
          OnBoardingElevatedButton(),
        ],
      ),
    );
  }
}
