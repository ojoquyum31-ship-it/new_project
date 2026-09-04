import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_project/constants/App_fonts.dart';
import 'package:new_project/controller/bottom_nav_controller.dart';
import 'package:new_project/screens/home_screen.dart';
import 'package:new_project/screens/profile.dart';
import 'package:new_project/screens/search.dart';
import 'package:new_project/screens/recent.dart';

class BottomNav extends StatelessWidget {
  BottomNav({super.key});

  final controller = Get.put(BottomNavController());
  final List<Widget> tabs = [HomeScreen(), Search(), Recent(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: tabs[controller.tabIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          unselectedLabelStyle: TextStyle(
            fontFamily: AppFonts.inter,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          selectedLabelStyle: TextStyle(
            fontFamily: AppFonts.inter,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
          onTap: controller.navigation,
          backgroundColor: Colors.white,
          elevation: 40.h,
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.tabIndex.value,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30.sp),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 30.sp),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.replay, size: 30.sp),
              label: "Recent",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 24.sp),
              label: "Profile",
            ),
          ],
        ),
      );
    });
  }
}
