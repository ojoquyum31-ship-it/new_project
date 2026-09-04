import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/data/categories.dart';
class SearchPageController extends GetxController {
  final searchBarController = TextEditingController();
  RxBool isSearching = false.obs;
  RxList<Map<String, dynamic>> searchResults =
      <Map<String, dynamic>>[].obs;

  void fetchResult(String value) {
    if (value
        .trim()
        .isEmpty) {
      isSearching.value = false;
      searchResults.clear();
      return;
    }
    isSearching.value = true;
    searchResults.value = categories.where((category) {
      return category["title"]
          .toString()
          .toLowerCase()
          .contains(value.toLowerCase());
    }).toList();
  }
}