import 'package:flutter/material.dart';
// import 'package:renteasy_app/utilities/constants/image_string.dart';
// import 'package:renteasy_app/utilities/helpers/helper_function.dart';
// import 'package:renteasy_app/utilities/constants/text_strings.dart';
// import 'package:renteasy_app/utilities/constants/sizes.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
// import 'package:renteasy_app/utilities/devices/devices_utilities.dart';
// import 'package:renteasy_app/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
// import 'package:renteasy_app/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:renteasy_app/utilities/devices/devices_utilities.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:renteasy_app/features/authentication/controllers/onboarding_controller.dart';


class OnBoardingDotNavigation extends StatelessWidget{
  OnBoardingDotNavigation({
    super.key
    });

  @override
  Widget build(BuildContext context){
    final controllerPage = OnBoardingController.instance; // it will call get.find

    return Positioned(
      bottom: AppDeviceUtils.getBottomNavigationBarHeight() + 100,
      left: 0, // left and right zero so it come to center
      right: 0,
      child: Center(
        child: SmoothPageIndicator(
          controller: controllerPage.pageController,
          onDotClicked: controllerPage.dotNavigationClick, 
          count: 3,
          effect: ExpandingDotsEffect(activeDotColor: AppColors.button, dotHeight: 12, dotWidth: 12), /* to make round perfect we use dotWidth */
        )
      ),
    );
  } 
}