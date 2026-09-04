import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/constants/App_fonts.dart';
import 'package:get/get.dart';
import 'package:new_project/screens/Onboarding.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  final List<Map<String, dynamic>> account = [
    {
      "icon": Icon(Icons.account_balance_wallet, color: Colors.grey),
      "text": "Payment Method",
    },
    {
      "icon": Icon(Icons.shopping_cart_sharp, color: Colors.grey),
      "text": "My Cart",
    },
    {"icon": Icon(Icons.help, color: Colors.grey), "text": "Help & Report"},
    {"icon": Icon(Icons.translate, color: Colors.grey), "text": "Language"},
    {
      "icon": Icon(Icons.notifications, color: Colors.grey),
      "text": "Notification",
    },
  ];
  final List<Map<String, dynamic>> more = [
    {"icon": Icon(Icons.shield, color: Colors.grey), "text": "Privacy Policy"},
    {
      "icon": Icon(Icons.event_note, color: Colors.grey),
      "text": "News & Services",
    },
    {"icon": Icon(Icons.star, color: Colors.grey), "text": "Give Rating"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Profile",
          style: TextStyle(
            fontFamily: AppFonts.inter,
            fontWeight: FontWeight.w600,
            fontSize: 24.sp,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(60.r),
                  child: Image.asset(
                    "assets/images/burger.jpg",
                    height: 80.h,
                    width: 80.h,
                    fit: BoxFit.cover,
                  ),
                ),
                6.horizontalSpace,
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextCard(
                            text: "Michael Antonio",
                            fontWeight: FontWeight.w500,
                            style: 20.sp,
                          ),
                          4.verticalSpace,
                          TextCard(
                            text: "mich@gmail.com",
                            fontWeight: FontWeight.w400,
                            style: 16.sp,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.edit, size: 24.sp, color: Colors.grey),
                          6.horizontalSpace,
                          TextCard(
                            text: "Edit",
                            fontWeight: FontWeight.w400,
                            style: 14.sp,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            40.verticalSpace,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextCard(
                      text: "Account",
                      fontWeight: FontWeight.w400,
                      style: 14.sp,
                    ),
                    16.verticalSpace,
                    Column(
                      children: List.generate(account.length, (index) {
                        final item = account[index];
                        return ListCard(
                          text: item["text"],
                          fontWeight: FontWeight.w500,
                          style: 16.sp,
                          icon: item["icon"],
                        );
                      }),
                    ),
                    SizedBox(height: 32.h),
                    TextCard(
                      text: "More Info",
                      fontWeight: FontWeight.w400,
                      style: 14.sp,
                    ),
                    16.verticalSpace,
                    Column(
                      children: List.generate(more.length, (index) {
                        final item = more[index];
                        return ListCard(
                          text: item["text"],
                          fontWeight: FontWeight.w500,
                          style: 16.sp,
                          icon: item["icon"],
                        );
                      }),
                    ),
                    32.verticalSpace,
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Get.offAll(() => Onboarding());
                        },
                        child: Text(
                          "Logout",
                          style: TextStyle(
                            color: Color(0xFFC34D33),
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            fontFamily: AppFonts.inter,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextCard extends StatelessWidget {
  const TextCard({
    super.key,
    required this.text,
    required this.fontWeight,
    required this.style,
  });

  final String text;
  final FontWeight fontWeight;
  final double style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: style,
        fontFamily: AppFonts.inter,
      ),
    );
  }
}

class ListCard extends StatelessWidget {
  const ListCard({
    super.key,
    required this.text,
    required this.fontWeight,
    required this.style,
    required this.icon,
    //required this.asset,
  });

  final String text;
  final FontWeight fontWeight;
  final double style;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            icon,
            SizedBox(width: 19.w),
            TextCard(text: text, fontWeight: fontWeight, style: style),
            const Spacer(),
            Icon(Icons.arrow_forward_ios, size: 7.sp),
          ],
        ),
        8.verticalSpace,
        Divider(indent: 39.w, thickness: 0.1, color: Colors.grey),
        SizedBox(height: 8.h,)
      ],
    );
  }
}
