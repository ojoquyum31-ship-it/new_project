import 'package:new_project/constants/App_fonts.dart';
import 'package:new_project/constants/app_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_project/controller/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_project/screens/cart.dart';
import 'package:new_project/screens/food.dart';
import 'package:new_project/data/categories.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.put(HomepageController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, Michael",
              style: TextStyle(
                fontFamily: "inter",
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Get your favorite food here!",
              style: TextStyle(
                fontFamily: "inter",
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),

        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => Cart());
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          //left: 20.w,
          top: 24.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 160.h,
              child: PageView(
                controller: PageController(
                  // initialPage: 1,
                  viewportFraction: 0.9,
                ),
                onPageChanged: (index) {
                  controller.swipeView(index);
                },
                scrollDirection: Axis.horizontal,
                children: [
                  Stack(
                    children: [
                      DealCard(image: "assets/images/homepage_image_1.jpg"),
                      Container(
                        height: 160.h,
                        width: 320.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          color: Colors.black.withOpacity(0.2),
                        ),
                      ),
                      Positioned(
                        left: 20.w,
                        top: 15.h,
                        //bottom: 2.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextEditCard(
                              size: 24.sp,
                              weight: FontWeight.w700,
                              text: "SUPER",
                            ),
                            TextEditCard(
                              size: 24.sp,
                              weight: FontWeight.w700,
                              text: "DEAL",
                            ),
                            TextEditCard(
                              size: 24.sp,
                              weight: FontWeight.w700,
                              text: "DATE",
                            ),
                            SizedBox(height: 8.h),
                            TextEditCard(
                              size: 20.sp,
                              weight: FontWeight.w600,
                              text: "40% OFF",
                            ),
                            TextEditCard(
                              size: 10.sp,
                              weight: FontWeight.w400,
                              text: "*Until 23 Sept",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(width: 20.w,),
                  Stack(
                    children: [
                      DealCard(image: "assets/images/homepage_image_2.jpg"),
                      Container(
                        height: 160.h,
                        width: 320.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          color: Colors.black.withOpacity(0.2),
                        ),
                      ),
                      Positioned(
                        left: 74.w,
                        top: 12.h,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextEditCard(
                                size: 24.sp,
                                weight: FontWeight.w700,
                                text: "SUPER FAMILY",
                              ),
                              SizedBox(height: 4.h),
                              TextEditCard(
                                size: 20.sp,
                                weight: FontWeight.w600,
                                text: "35% OFF",
                              ),
                              SizedBox(height: 79.h),
                              TextEditCard(
                                size: 10.sp,
                                weight: FontWeight.w400,
                                text: "*Minimum 6 people",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      DealCard(image: "assets/images/homepage_image_1.jpg"),
                      Container(
                        height: 160.h,
                        width: 320.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          color: Colors.black.withOpacity(0.2),
                        ),
                      ),
                      Positioned(
                        left: 20.w,
                        top: 15.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextEditCard(
                              size: 24.sp,
                              weight: FontWeight.w700,
                              text: "SUPER",
                            ),
                            TextEditCard(
                              size: 24.sp,
                              weight: FontWeight.w700,
                              text: "DEAL",
                            ),
                            TextEditCard(
                              size: 24.sp,
                              weight: FontWeight.w700,
                              text: "DATE",
                            ),
                            SizedBox(height: 8.h),
                            TextEditCard(
                              size: 20.sp,
                              weight: FontWeight.w600,
                              text: "40% OFF",
                            ),
                            TextEditCard(
                              size: 10.sp,
                              weight: FontWeight.w400,
                              text: "*Until 23 Sept",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.w),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: controller.smoothIndicator.value == index
                          ? Color(0XFF008C8C)
                          : Colors.grey,
                    ),
                    margin: EdgeInsetsGeometry.symmetric(horizontal: 8.w),
                    width: 8.w,
                    height: 8.h,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        MiddleTabCard(
                          screen: () {
                            Get.to(() => Food());
                          },
                          icon: SvgPicture.asset(AppIcons.foodIcon),
                          text: "Food",
                        ),
                        SizedBox(width: 48.w),
                        MiddleTabCard(
                          screen: () {
                            Get.to(() => Scaffold());
                          },
                          icon: SvgPicture.asset(AppIcons.tableIcon),
                          text: "Table",
                        ),
                        SizedBox(width: 48.w),
                        MiddleTabCard(
                          screen: () {
                            Get.to(() => Scaffold());
                          },
                          icon: SvgPicture.asset(AppIcons.paymentIcon),
                          text: "Payment",
                        ),
                        SizedBox(width: 48.w),
                        MiddleTabCard(
                          screen: () {
                            Get.to(() => Scaffold());
                          },
                          icon: SvgPicture.asset(AppIcons.moreIcon),
                          text: "More",
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    Text(
                      "Recommendation",
                      style: TextStyle(
                        fontFamily: AppFonts.inter,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp,
                      ),
                    ),
                    const Spacer(),
                   // SizedBox(height: 16.h),
                    SizedBox(
                     height: 262.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          final category = categories[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: GridCard(
                              image: category["image"],
                              title: category["title"],
                              description: category["description"],
                              amount: category["amount"],
                              rate: category["rate"],
                            ),
                          );
                        },
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

class DealCard extends StatelessWidget {
  final String image;

  const DealCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6.r),
      child: Image.asset(image, fit: BoxFit.cover, height: 160.h, width: 320.w),
    );
  }
}

class TextEditCard extends StatelessWidget {
  final double size;
  final FontWeight weight;

  //  final Color color ;
  final String text;

  const TextEditCard({
    super.key,
    required this.size,
    required this.weight,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "inter",
        color: Colors.white,
        fontWeight: weight,
        fontSize: size,
      ),
    );
  }
}

class MiddleTabCard extends StatelessWidget {
  const MiddleTabCard({
    super.key,
    required this.icon,
    required this.text,
    this.screen,
  });

  final Function()? screen;

  final Widget icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: screen,
          child: Container(
            height: 48.h,
            width: 48.w,
            decoration: BoxDecoration(
              color: Color(0xFFF4F0F0),
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Center(child: icon),
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontFamily: AppFonts.inter,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class GridCard extends StatelessWidget {
  const GridCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.amount,
    required this.rate,
  });

  final String rate, title, description, amount, image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(6),
          bottomRight: Radius.circular(6),
        ),
        color: Color(0XFFFFFFFF),
        boxShadow: [BoxShadow(color: Color(0X0000001F))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 180.h,
                width: 160.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6),
                    topRight: Radius.circular(6),
                  ),
                  child: Image.asset(
                    image,
                    height: 180.h,
                    width: 160.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                // top: 5.h,
                right: 1.w,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(6.r),
                      topRight: Radius.circular(6.r),
                    ),
                    color: Colors.black.withOpacity(0.8),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 12),
                      Text(
                        rate,
                        style: TextStyle(
                          fontFamily: AppFonts.inter,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: AppFonts.inter,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontFamily: AppFonts.inter,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  amount,
                  style: TextStyle(
                    fontFamily: AppFonts.inter,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
