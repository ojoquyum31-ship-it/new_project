import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RecentPageController extends GetxController {
  final pageController = PageController();
  var currentIndex = 0.obs;

  void swipView(index) {
    currentIndex.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
