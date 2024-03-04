// ignore_for_file: unnecessary_overrides, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_mobile/app/data/Models/user_model.dart';

class ProfilController extends GetxController {

  final darkModeValue = Get.isDarkMode.obs;

    void toggleTheme() {
    darkModeValue.value = !darkModeValue.value;
    Get.changeThemeMode(
        darkModeValue.value ? ThemeMode.dark : ThemeMode.light);
  }


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
