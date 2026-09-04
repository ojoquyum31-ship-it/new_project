import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/constants/app_colors.dart';
import 'package:new_project/constants/app_images.dart';
import 'package:new_project/screens/Onboarding.dart';

import '../constants/app_icons.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();

     Future.delayed(Duration(seconds: 4), () {
       Get.off(() => Onboarding());
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1.sw,
        height: 1.sh,
        color: AppColors.primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(AppImages.splashGrpImg),
            SizedBox(height: 203.26.h),
            Center(
              child: Text(
                "EatEasy",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 48.sp,
                  fontFamily: "Kantumruy Pro",
                  color: Color(0XFFFFFFFF),
                ),
              ),
            ),
            SizedBox(height: 83.h),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset("assets/images/Vector.png"),
            ),
          ],
        ),
      ),
    );
  }
}
