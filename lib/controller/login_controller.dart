import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool filledSpace = false.obs;
  RxBool validEmail = true.obs;
  void fillingButton () {
    validEmail.value =
        emailController.text.isEmail;
    filledSpace.value =
        emailController.text.isNotEmpty &&
    passwordController.text.isNotEmpty &&
   validEmail.value;
  }
}