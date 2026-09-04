import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/constants/App_fonts.dart';

class NewestList extends StatelessWidget {
  const NewestList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.asset("assets/images/noodle-x.jpg",
          height: 80.h,
          width: 80.h,
          fit: BoxFit.cover,),
        ),
        10.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 4.h,),
              Text(
                "Noodle Ex",
                style: TextStyle(
                  fontFamily: AppFonts.inter,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
                ),
              ),
              //4.verticalSpace,
              Row(
                children: [
                  Text(
                    "23 August 2021, 15:32",
                    style: TextStyle(
                      fontFamily: AppFonts.inter,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: Colors.grey
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Process",
                    style: TextStyle(
                        fontFamily: AppFonts.inter,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color:Color(0xFF008C8C)
                    ),
                  ),
                ],
              ), 12.verticalSpace,
              Text(
                "Work Table . 1 Flower",
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
    );
  }
}
