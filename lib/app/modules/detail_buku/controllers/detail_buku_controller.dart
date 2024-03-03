// ignore_for_file: unnecessary_overrides, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_mobile/app/data/Models/buku_model.dart';
import 'package:ta_mobile/app/data/Models/kategori_model.dart';
import 'package:ta_mobile/app/data/Models/ulasan_model.dart';

class DetailBukuController extends GetxController {
  var categories = <KategoriModel>[].obs;
  var selectedCategory = ''.obs;
  var allBooks = <BukuModel>[].obs;
  var allUlasan = <UlasanModel>[].obs;
  final darkModeValue = Get.isDarkMode.obs;

    void toggleTheme() {
    darkModeValue.value = !darkModeValue.value;
    Get.changeThemeMode(
        darkModeValue.value ? ThemeMode.dark : ThemeMode.light);
  }

  void fetchCategories() async {
    try {
      final kategoriModel = KategoriModel();
      kategoriModel.streamList().listen((categoriesList) {
        categories.assignAll(categoriesList);
      });
    } catch (e) {
      print('Error fetching categories:  $e');
    }
  }

  void fetchBooks() {
    try {
      final bukuModel = BukuModel();
      bukuModel.streamList().listen((books) {
        allBooks.assignAll(books);
      });
    } catch (e) {
      print('Error fetching books: $e');
    }
  }

  void fetchUlasan() {
    try {
      final ulasanModel = UlasanModel();
      ulasanModel.streamList().listen((books) {
        allUlasan.assignAll(books);
      });
    } catch (e) {
      print('Error fetching books: $e');
    }
  }

  void changeCategory({required String temp}) {
    selectedCategory.value = temp;
  }
  
  @override
  void onInit() {
    super.onInit();
    fetchCategories();
    fetchBooks();
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
