import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_project/constants/App_fonts.dart';
import 'package:new_project/constants/app_icons.dart';

class NoResult extends StatelessWidget {
  const NoResult({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppIcons.emptySearchIcon,
              width: 160.w,
              height: 160.h,
            ),
            24.verticalSpace,
            Text(
              "Well, there is no result you are ",
              style: TextStyle(
                fontFamily: AppFonts.inter,
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "looking for :(",
              style: TextStyle(
                fontFamily: AppFonts.inter,
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            50.verticalSpace,
            Container(
              height: 45.h,
              decoration: BoxDecoration(
                color: Color(0xFF008C8C),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Text(
                  "Find Other",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppFonts.inter,
                    color: Colors.white,
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
