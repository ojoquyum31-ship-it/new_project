import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/controller/signup_controller.dart';
import 'package:get/get.dart';
import 'package:new_project/screens/bottom_nav.dart';
import 'package:new_project/screens/log_in.dart';

class SignUp extends StatelessWidget {
  final controller = Get.put(SignupController());

  SignUp({super.key});

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
            "Sign up",
            style: TextStyle(
              fontFamily: "inter",
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
            ),
          ),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name",
                  style: TextStyle(
                    fontFamily: "inter",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 8.h),
                TextFieldCard(
                  onChanged: (value) {
                    controller.checkFields();
                  },
                  controller: controller.nameController,
                  hintText: "Name",
                ),
                16.verticalSpace, //SizedBox(height: 16.h,),
                Text(
                  "Email",
                  style: TextStyle(
                    fontFamily: "inter",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 8.h),
                TextFieldCard(
                  onChanged: (value) {
                    controller.checkFields();
                  },
                  controller: controller.emailController,
                  hintText: "Email",
                ),
                SizedBox(height: 4.h),
                Obx(
                  () =>
                  controller.validEmail.value
                      ? SizedBox()
                      : Text(
                          "invalid email",
                          style: TextStyle(
                            color: Colors.red,
                            fontFamily: "inter",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                ),
                SizedBox(height: 12.h),
                Text(
                  "Password",
                  style: TextStyle(
                    fontFamily: "inter",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 8.h),
                Obx(
                  () => TextFieldCard(
                    onChanged: (value) {
                      controller.checkFields();
                    },
                    controller: controller.passwordController,
                    hintText: "Password",
                    obscure: controller.isFormVisible.value,
                    onTap: () {
                      controller.visiblePrint();
                    },
                    icon: controller.isFormVisible.value
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  "Confirmation Password",
                  style: TextStyle(
                    fontFamily: "inter",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 8.h),
                Obx(
                  () => TextFieldCard(
                    onChanged: (value) {
                      controller.checkFields();
                    },
                    controller: controller.checkPasswordController,
                    obscure: controller.isFormVisible.value,
                    onTap: () {
                      controller.visiblePrint();
                    },
                    icon: controller.isFormVisible.value
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                    hintText: "Confirmation Password",
                  ),
                ),
                SizedBox(height: 4.h),
                Obx(
                  () => controller.passwordsMatch.value
                      ? SizedBox()
                      // ?
                      : Text(
                          "Unverified",
                          style: TextStyle(
                            color: Colors.red,
                            fontFamily: "inter",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                ),
                SizedBox(height: 40.h),
                Obx(
                  () => GestureDetector(
                    onTap: controller.isFormField.value
                        ? () {
                            Get.offAll(() => BottomNav());
                          }
                        : null,
                    child: Container(
                      height: 45.h,
                      decoration: BoxDecoration(
                        color: controller.isFormField.value
                            ? Color(0XFF008C8C)
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          "Sign Up Now",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "inter",
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "inter",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(LogIn());
                      },
                      child: Text(
                        " Login",
                        style: TextStyle(
                          color: Color(0XFF008C8C),
                          fontFamily: "inter",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldCard extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;

  final VoidCallback? onTap;
  final bool obscure;

  final Widget? icon;

  final TextEditingController controller;

  const TextFieldCard({
    super.key,
    required this.hintText,
    this.icon,
    required this.controller,
    required this.onChanged,
    this.obscure = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscure,
      decoration: InputDecoration(
        suffixIcon: IconButton(onPressed: onTap, icon: icon ?? SizedBox()),
        hintText: hintText,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.grey,
          fontSize: 16.sp,
          fontFamily: "inter",
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
