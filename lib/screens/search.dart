import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/constants/App_fonts.dart';
import 'package:get/get.dart';
import 'package:new_project/controller/search_page_controller.dart';
import 'package:new_project/widgets/search_default.dart';
import 'package:new_project/widgets/search_result.dart';
import 'package:new_project/widgets/no_result.dart';

class Search extends StatelessWidget {
  Search({super.key});

  final controller = Get.put(SearchPageController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Search",
            style: TextStyle(
              fontFamily: AppFonts.inter,
              fontWeight: FontWeight.w600,
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: controller.searchBarController,
                onChanged: controller.fetchResult,
                style: TextStyle(
                  fontFamily: AppFonts.inter,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  hintText: "Search food, table, or something",
                  hintStyle: TextStyle(
                    fontFamily: AppFonts.inter,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 24.sp),
              Expanded(
                child: Obx(() {
                  if (!controller.isSearching.value) {
                    return SearchDefault();
                  } else if (controller.searchResults.isEmpty) {
                    return NoResult();
                  } else {
                    return SearchResult(results: controller.searchResults);
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
