import 'package:flutter/material.dart';
// import 'package:renteasy_app/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
// import 'package:renteasy_app/utilities/constants/image_string.dart';
// // import 'package:renteasy_app/utilities/helpers/helper_function.dart';
// import 'package:renteasy_app/utilities/constants/text_strings.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
// import 'package:renteasy_app/utilities/devices/devices_utilities.dart';
// import 'package:renteasy_app/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
// import 'package:renteasy_app/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
// import 'package:renteasy_app/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
// import 'package:renteasy_app/features/authentication/screens/onboarding/widgets/onboarding_elevated_button.dart';
import 'package:renteasy_app/utilities/devices/devices_utilities.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:renteasy_app/features/authentication/controllers/onboarding_controller.dart';



class OnBoardingElevatedButton extends StatelessWidget{
  OnBoardingElevatedButton({
    super.key
    });

  @override
  Widget build(BuildContext context){
    return Positioned(
      bottom: AppDeviceUtils.getBottomNavigationBarHeight(),
      left: 0, // left and right zero so it come to center
      right: 0,
      child: Padding(
        padding: EdgeInsets.all(AppSizes.defaultSpace),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () => OnBoardingController.instance.nextPage(), 
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.button,
              foregroundColor: AppColors.buttonTextColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(AppSizes.buttonRadius)
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Continue', style: TextStyle(fontSize: AppSizes.fontSizeLg),),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward),
              ],
            )
          ),
        ),
      )
    );
  } 
}