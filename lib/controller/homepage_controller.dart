import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomepageController extends GetxController{
  var smoothIndicator = 0.obs;
  void swipeView (int index) {
    smoothIndicator.value = index;
  }
}