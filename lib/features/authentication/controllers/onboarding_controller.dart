import 'package:flutter/material.dart';
import 'package:get/get.dart'; //GetxController
import 'package:renteasy_app/features/authentication/screens/login/login.dart';

class OnBoardingController extends GetxController{
  static OnBoardingController get instance => Get.find();

  // variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs; // obs is observer widget that will change design without stateful widget,
  // you can use final instead of Rx<int> but Rx<int> is getx method to define variable that can change and state can change on the design
                                  
  // Update Current index when page scroll
  void updatePageIndicator(index) => currentPageIndex.value = index; // instead of {return } directly use =>

  // Jump to the specefic dot selected page
  void dotNavigationClick(index){
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  // Update current index & jump to next page
  void nextPage(){
    if (currentPageIndex.value == 2){
      Get.offAll(LoginScreen());
    }
    else{
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  // Update current index & jump to last page
  void skipPage(){
    Get.to(LoginScreen());
  }

}