import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/constants/App_fonts.dart';
import 'package:get/get.dart';
import 'package:new_project/controller/recent_page_controller.dart';
import 'package:new_project/widgets/newest_list.dart';
import 'package:new_project/widgets/oldest_list.dart';

class Recent extends StatelessWidget {
  Recent({super.key});

  final controller = Get.put(RecentPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Recent",
          style: TextStyle(
            fontFamily: AppFonts.inter,
            fontWeight: FontWeight.w600,
            fontSize: 24.sp,
          ),
        ),
        centerTitle: false,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
            ()=> Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      controller.swipView(0);
                    },
                    child: Text(
                      "Newest",
                      style: TextStyle(
                        fontFamily: AppFonts.inter,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp,
                        color: controller.currentIndex.value == 0
                        ? Color(0xFF008C8C)
                        : Colors.grey
                      ),
                    ),
                  ),
                  SizedBox(width: 100.w,),
                  TextButton(
                    onPressed: () {
                      controller.swipView(1);
                    },
                    child: Text("Oldest",
                      style: TextStyle(
                          fontFamily: AppFonts.inter,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                          color: controller.currentIndex.value == 1
                             ?  Color(0xFF008C8C)
                              :  Colors.grey
                      ),),
                  ),
                ],
              ),
            ),
           // 12.verticalSpace,
            Obx( () =>
               Row(
                children: [
                  Container(
                    width: 165.w,
                    height: controller.currentIndex.value == 0
                    ? 4.h
                    :1.h,
                    decoration: BoxDecoration(
                      color: controller.currentIndex.value == 0
                          ? Color(0xFF008C8C)
                          : Colors.grey
                    ),
                  ), Container(
                    width: 165.w,
                    height: controller.currentIndex.value == 1
                    ? 4.h
                    :1.h,
                    decoration: BoxDecoration(
                      color: controller.currentIndex.value == 1
                          ? Color(0xFF008C8C)
                          : Colors.grey
                    ),
                  )
                ],
              ),
            ),
            24.verticalSpace,
            Expanded(
              child: PageView(
                controller: controller.pageController,
                onPageChanged: controller.swipView,
                children: [
                  NewestList(),
                  OldestList(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
