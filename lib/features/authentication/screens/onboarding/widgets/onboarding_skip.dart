import 'package:flutter/material.dart';
// import 'package:renteasy_app/utilities/constants/image_string.dart';
// import 'package:renteasy_app/utilities/helpers/helper_function.dart';
// import 'package:renteasy_app/utilities/constants/text_strings.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/devices/devices_utilities.dart';
// import 'package:renteasy_app/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:renteasy_app/features/authentication/controllers/onboarding_controller.dart';

class OnBoardingSkip extends StatelessWidget{
  OnBoardingSkip({
    super.key
    });

  @override
  Widget build(BuildContext context){
    return Positioned(
      top: AppDeviceUtils.getAppBarHeight(), /*  or direct use kToolbarHeight it is defined in material.dart  */
      right: AppSizes.defaultSpace,
      child: TextButton(onPressed: () => OnBoardingController.instance.skipPage(),child: Text("Skip", style: TextStyle(fontFamily: 'poppins',color: AppColors.secondaryTextColor, fontSize: AppSizes.fontSizeSm),),)); // (){} means null
  } 
}