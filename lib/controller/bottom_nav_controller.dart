import 'package:get/get.dart';

class BottomNavController extends GetxController{
  RxInt tabIndex = 0.obs;
  void navigation (int index) {
    tabIndex.value = index;
  }
}