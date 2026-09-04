import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController= TextEditingController();
  final   checkPasswordController= TextEditingController();
  RxBool passwordsMatch = true.obs;
  RxBool isFormField = false.obs;
  RxBool validEmail = true.obs;
  RxBool isFormVisible = true.obs;
  void checkFields () {
    validEmail.value =
        emailController.text.isNotEmpty &&
        emailController.text.isEmail;
    passwordsMatch.value =
    passwordController.text == checkPasswordController.text;
    isFormField.value =
    nameController.text.isNotEmpty &&
    emailController.text.isNotEmpty &&
      validEmail.value&&
    passwordController.text.isNotEmpty &&
    checkPasswordController.text.isNotEmpty  &&
    passwordsMatch.value ;
  }
 void visiblePrint () {
    isFormVisible.value = ! isFormVisible.value;
 }
}