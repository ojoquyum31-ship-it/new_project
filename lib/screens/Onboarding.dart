import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_project/screens/log_in.dart';
import 'sign_up.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 233.h,
          //bottom: 233.h,
          left: 20.w,
          right: 20.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "EatEasy",
              style: TextStyle(
                color: Color(0Xff008C8C),
                fontWeight: FontWeight.w700,
                fontSize: 32.sp,
                fontFamily: "Kantumruy Pro",
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              "Booking a table and food from everywhere.",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "inter",
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 140.h),
            GestureDetector(
              onTap: () {
                Get.to(() => SignUp());
              },
              child: Container(
                height: 45.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Color(0Xff008C8C),
                ),
                child: Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "inter",
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 24.h),
            GestureDetector(
              onTap: () {
                Get.to(LogIn());
              },
              child: Container(
                height: 45.h,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0Xff008C8C), width: 1),
                  borderRadius: BorderRadius.circular(6),
                  // color: Color(0Xff008C8C),
                ),
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Color(0Xff008C8C),
                      fontFamily: "inter",
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
