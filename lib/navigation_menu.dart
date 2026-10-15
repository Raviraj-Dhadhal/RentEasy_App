import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/features/pg/screens/home/home.dart';
import 'package:renteasy_app/features/pg/screens/profile/profile.dart';
import 'package:renteasy_app/features/pg/screens/roommate/find_roommate.dart';
import 'package:renteasy_app/features/pg/screens/search/search.dart';
import 'package:renteasy_app/features/pg/screens/wishlist/wishlist.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';

  class NavigationMenu extends StatelessWidget {
    const NavigationMenu({super.key});

    @override
    Widget build(BuildContext context) {
      final controller = Get.put(NavigationController());  // using Get.put so we don't have to craete instamce
      
      return Scaffold(
        bottomNavigationBar: Obx(  // obx is observer and obs is being observed
          () => NavigationBar(
            backgroundColor: AppColors.bottomBarBG,
            indicatorColor: Colors.transparent,  // this will make background green type pill effect transparent
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value ,
            onDestinationSelected: (index) => controller.selectedIndex.value = index ,

            destinations:[
              NavigationDestination(icon: Icon(Icons.home, color: Color(0xFF000000),), label: 'Home', selectedIcon: Icon(Icons.home, color: AppColors.bottomIcon)),
              NavigationDestination(icon: Icon(Icons.search, color: Color(0xFF000000)), label: 'Search', selectedIcon: Icon(Icons.search, color: AppColors.bottomIcon)),
              NavigationDestination(icon: Icon(Iconsax.heart, color: Color(0xFF000000)), label: 'Wishlist', selectedIcon: Icon(Iconsax.heart, color: AppColors.bottomIcon)),
              NavigationDestination(icon: Icon(Iconsax.people, color: Color(0xFF000000)), label: 'Comp', selectedIcon: Icon(Iconsax.people, color: AppColors.bottomIcon)),
              NavigationDestination(icon: Icon(Iconsax.user_search, color: Color(0xFF000000)), label: 'Profile', selectedIcon: Icon(Iconsax.user_search, color: AppColors.bottomIcon)),
            ]
          ),
        ),
        // body: controller.screens[controller.selectedIndex.value], // it will only becomes one colour that wherevr index wa
        body: Obx(() => controller.screens[controller.selectedIndex.value]),
      );
    }
  }


  class NavigationController extends GetxController{
    final Rx<int> selectedIndex = 0.obs; // reactive index observing currently selected bottom navigation tab

    // List of screens corresponding to bottom navigation tabs
    final screens = [
      const HomeScreen(),         // Tab 0: Home screen with featured and nearby properties
      const SearchScreen(),       // Tab 1: Search screen with recent queries & popular locations
      const WishlistScreen(),     // Tab 2: Wishlist screen with saved favorite properties
      const FindRoommateScreen(), // Tab 3: Comp (Companion) roommate finder screen
      const ProfileScreen(),      // Tab 4: User profile, activities, and settings
    ];
  }