import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/constants/App_fonts.dart';
import 'package:new_project/controller/search_page_controller.dart';
import 'package:get/get.dart';
class SearchDefault extends StatelessWidget {
   SearchDefault({super.key});
   final controller = Get.put(SearchPageController());
   final List<String> content = [
     "Duo Table",
     "Noodle",
     "Chicken",
     "Fried Rice",
     "Meat",
     "Family",
   ];
   final List<Map<String, dynamic>> category = [
     {
       "image": "assets/images/Family_package_image.jpg",
       "title": "Family Package",
       "description": "1 large table 6 chair",
       "amount": "Rp320.000",
     },
     {
       "image": "assets/images/date_package_image.jpg",
       "title": "Date Package",
       "description": "1 table 2 chair",
       "amount": "Rp135.000",
     },
   ];
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(
          "Popular Search",
          style: TextStyle(
            fontFamily: AppFonts.inter,
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
            color: Colors.black,
          ),
        ),
        16.verticalSpace,
        Wrap(
          spacing: 4.w,
          runSpacing: 16.h,
          children: List.generate(
            content.length,
                (index) => ListCard(content: content[index]),
          ),
        ),
        SizedBox(height: 24.h),
        Text(
          "Recently Search",
          style: TextStyle(
            fontFamily: AppFonts.inter,
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
            color: Colors.black,
          ),
        ),
        16.verticalSpace,
        SizedBox(
          height: 264.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final context = category[index];
              return RecentsCard(
                image: context["image"],
                title: context["title"],
                description: context["description"],
                amount: context["amount"],
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 16.w),
            itemCount: category.length,
          ),
        ),
      ],
      ),
    );
  }
}
class ListCard extends StatelessWidget {
  const ListCard({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: 80.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Color(0XFFF3F1F1),
      ),
      child: Center(child: Text(content)),
    );
  }
}

class RecentsCard extends StatelessWidget {
  const RecentsCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.amount,
  });

  final String image, title, description, amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black)],
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
                    topRight: Radius.circular(6.r),
                    topLeft: Radius.circular(6.r),
                  ),
                  child: Image.asset(image, fit: BoxFit.cover),
                ),
              ),
            ],
          ),
          8.verticalSpace,
          Padding(
            padding: EdgeInsets.only(left: 8.w),
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
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: AppFonts.inter,
                  ),
                ),
                4.verticalSpace,
                Text(
                  "Rp$amount",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: AppFonts.inter,
                    fontWeight: FontWeight.w400,
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

