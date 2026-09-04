import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_project/constants/App_fonts.dart';
import 'package:new_project/constants/app_colors.dart';
import 'package:new_project/screens/Onboarding.dart';
import 'package:new_project/controller/signup_controller.dart';
import 'package:new_project/screens/bottom_nav.dart';
import 'package:new_project/screens/sign_up.dart';
import 'package:new_project/controller/login_controller.dart';
class LogIn extends StatelessWidget {
   LogIn({super.key});
   final checker = Get.put(LoginController());
final controller = Get.put ( SignupController ());
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
        leading: IconButton(onPressed: (){
      Get.to(() => Onboarding());
        }, icon: Icon(Icons.arrow_back)),
        title: Text("Log in",
        style: TextStyle(fontFamily: AppFonts.inter,fontSize: 20.sp,
        fontWeight: FontWeight.w600)
        ),
        centerTitle: false
        ,),
        body: Padding(
          padding: const EdgeInsets.only(left:20, top: 40, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                Text("Email",
                  style: TextStyle(
                    fontFamily: "inter",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),),
                8.verticalSpace,
                FieldCard(
                    controller: checker.emailController,
                    onChanged: (value) {
                      checker.fillingButton();
                    },text: "Email"),
                SizedBox(height: 4.h,),
                Obx(
                    ()=>
                    checker.validEmail.value
                  ? SizedBox()
                    :Text("invalid email"),
                ),
                12.verticalSpace,
                Text("Password",
                  style: TextStyle(
                    fontFamily: "inter",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),),
                8.verticalSpace,
                Obx(
                      ()=> FieldCard(
                        controller: checker.passwordController,
                        onChanged: (value) {
                          checker.fillingButton();
                        },
                        text: "Password",
                    obscure: controller.isFormVisible.value,
                    onPressed: () {
                    controller.visiblePrint();
                    },
                    icon: controller.isFormVisible.value
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
                  ),
                ),
                SizedBox(height: 40.w,),
                Obx(
                    () => GestureDetector(
                    onTap: checker.filledSpace.value
                      ?  () {
                      Get.offAll(()=> BottomNav());
                    }
                    : null,
                    child: Container(
                      height:45.h ,
                      width: 371.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: checker.filledSpace.value
                       ? AppColors.primaryColor
                            : Colors.grey
                      ),
                      child: Center(
                        child: Text("Login",
                          style: TextStyle(fontFamily: AppFonts.inter,
                              fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 16.sp),),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h,),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Doesn’t have an account? ",
                        style: TextStyle(fontFamily: AppFonts.inter,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: Colors.black
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.to(()=> SignUp());
                        },
                        child: Text("Sign Up",
                          style: TextStyle(fontFamily: AppFonts.inter,
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                              color: AppColors.primaryColor
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class FieldCard extends StatelessWidget {
  const FieldCard({super.key,
     this.obscure = false,
    this.onPressed,
    this.icon,
     this.onChanged,
    this.controller,
    required this.text});
final Function(String)? onChanged;
  final Function()? onPressed ;
  final bool obscure;
  final TextEditingController? controller;
  final Widget ? icon;
final String text;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        obscureText:obscure ,
        decoration: InputDecoration(
          suffixIcon: IconButton(onPressed: onPressed, icon: icon ?? SizedBox()),
          hintText: text,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.grey,
            fontSize: 16.sp,
            fontFamily: "inter",
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}

