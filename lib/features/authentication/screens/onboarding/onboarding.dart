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

class OnBoardingScreen extends StatelessWidget{
  OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context){

    final controllerPage = Get.put(OnBoardingController());  // this means we have created instance of OnBoardingController

    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Stack(
          children: [
            // Horizontal Scrollable Pages
            PageView(

              controller: controllerPage.pageController,
              onPageChanged: controllerPage.updatePageIndicator, // you can pass index here after updatePageIndictor(index)

              children: const [
              OnBoardingPage(
                image: images.onBoardingImage1,
                title: AppTexts.onBoardingTitle1,
                subTitle: AppTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: images.onBoardingImage2,
                title: AppTexts.onBoardingTitle2,
                subTitle: AppTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: images.onBoardingImage3,
                title: AppTexts.onBoardingTitle3,
                subTitle: AppTexts.onBoardingSubTitle3,
              ),
              ]
            ),

            // Skip Button
            OnBoardingSkip(),
          
            // Dot Navigation SmoothPageIndicator
            OnBoardingDotNavigation(),
            

            // Circular Button or floating action button
            OnBoardingElevatedButton(),
          ]
        )
    );
  }
}
