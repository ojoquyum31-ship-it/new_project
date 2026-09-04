import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/constants/App_fonts.dart';
import 'package:new_project/controller/search_page_controller.dart';
class SearchResult extends StatelessWidget {
   const SearchResult({super.key, required this.results});
   final List<Map<String, dynamic>> results;
  @override
  Widget build(BuildContext context) {
    return     SizedBox(
      height: 262.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: results.length,
        itemBuilder: (context, index) {
          final category = results[index];
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

