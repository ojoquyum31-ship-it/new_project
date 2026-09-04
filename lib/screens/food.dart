import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/constants/App_fonts.dart';

class Food extends StatelessWidget {
  Food({super.key});

  final List<String> suggestion = [
    "Dinner Food",
    "Economic Food",
    "Hot Food",
    "Family Food",
  ];
  final List<Map<String, dynamic>> selection = [
    {
      "image": "assets/images/meatball.jpg",
      "description": "Meatball Sweatie",
      "rating": "4.9",
      "amount": "Rp63.500",
    },
    {
      "image": "assets/images/noodle-x.jpg",
      "description": "Noodle Ex",
      "rating": "4.8",
      "amount": "Rp42.000",
    },
    {
      "image": "assets/images/burger.jpg",
      "description": "Burger Ala Ala",
      "rating": "4.7",
      "amount": "Rp55.500",
    },
    {
      "image": "assets/images/burger.jpg",
      "description": "Chicken Collage",
      "rating": "4.5",
      "amount": "Rp78.200",
    },
    {
      "image": "assets/images/ala ala.jpg",
      "description": "Noodle Ex",
      "rating": "4.8",
      "amount": "Rp42.000",
    },
    {
      "image": "assets/images/ala ala.jpg",
      "description": "Noodle Ex",
      "rating": "4.8",
      "amount": "Rp42.000",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 2,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text(
            "Food",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              fontFamily: AppFonts.inter,
            ),
          ),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {
                Get.to(() => Scaffold());
              },
              icon: Icon(Icons.shopping_cart),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 24, right: 20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  hintText: "Search Food",
                  hintStyle: TextStyle(
                    fontFamily: AppFonts.inter,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.h),

            Padding(
              padding: EdgeInsetsGeometry.only(left: 20),
              child: SizedBox(
                height: 30.h,
                //width: 100.w,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: suggestion.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: ListCard(text: suggestion[index]),
                    );
                  },
                ),
              ),
            ),
            32.verticalSpace,
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    left: 20.h,
                    right: 20.h
                ),
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.64,
                    crossAxisSpacing: 23,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    final application = selection[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15,
                         // left: 20
                      ),
                      child: GridContentCard(
                        image: application["image"],
                        description: application["description"],
                        rating: application["rating"],
                        amount: application["amount"],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListCard extends StatelessWidget {
  const ListCard({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: 97.w,
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(20),
        color: Color(0XFFF3F1F1),
      ),
      child: Center(child: Text(text)),
    );
  }
}

class GridContentCard extends StatelessWidget {
  const GridContentCard({
    super.key,
    required this.image,
    required this.description,
    required this.rating,
    required this.amount,
  });

  final String image, description, rating, amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(
              color: Colors.black,
             // spreadRadius: 0.5,
              blurStyle: BlurStyle.outer,
              blurRadius: 3
          )],
          borderRadius: BorderRadius.circular(6)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              image,
              height: 140.h,
              width: 174.w,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w, top: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: TextStyle(
                    fontFamily: AppFonts.inter,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    Text(rating),
                  ],
                ),
                Text(amount),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
