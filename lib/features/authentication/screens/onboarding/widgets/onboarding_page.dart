import 'package:flutter/material.dart';
import 'package:renteasy_app/utilities/constants/sizes.dart';
import 'package:renteasy_app/utilities/helpers/helper_function.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';

class OnBoardingPage extends StatelessWidget{
  const OnBoardingPage({
    super.key, required this.image, required this.title, required this.subTitle,
  });

  final String image,title,subTitle;

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.all(AppSizes.defaultSpace),
      child: Column(
          children: [                
            Image(
              image: AssetImage(image),
              width: AppHelperFunction.screenWidth() * 0.9,
              height: AppHelperFunction.screenHeight() * 0.6,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: AppSizes.fontSizeCustom, 
                fontFamily: 'poppins', fontWeight: 
                FontWeight(800),
                color: AppColors.primaryTextColor,
                ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 8),
            Text(
              subTitle,
              style: TextStyle(
                fontSize: AppSizes.fontSizeMd, 
                fontFamily: 'poppins', 
                fontWeight: FontWeight(400),
                color: AppColors.secondaryTextColor,
                ),
                textAlign: TextAlign.center,
            ),
          ]
        )
      );
  }
}