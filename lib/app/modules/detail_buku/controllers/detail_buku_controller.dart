// ignore_for_file: unnecessary_overrides, avoid_print, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/data/Models/buku_model.dart';
import 'package:ta_mobile/app/data/Models/kategori_model.dart';
import 'package:ta_mobile/app/data/Models/ulasan_model.dart';
import 'package:ta_mobile/app/data/Models/user_model.dart';
import 'package:ta_mobile/app/modules/auth/controllers/auth_controller.dart';

class DetailBukuController extends GetxController {
  var categories = <KategoriModel>[].obs;
  var allBooks = <BukuModel>[].obs;
  var user = <UserModel>[].obs;

  String? bukuId;
  double? ratingValue;

  TextEditingController ulasanC = TextEditingController();

  modelToController(BukuModel bukuModel) {
    bukuId = bukuModel.id;
    rxUlasan.bindStream(UlasanModel(bukuId: bukuId).streamList());

  }


  var _isSaving = false.obs;
  bool get isSaving => _isSaving.value;
  set isSaving(bool value) => _isSaving.value = value;

  Future store(UlasanModel ulasanModel, BukuModel bukuModel, AuthController authController) async {
    isSaving = true;
    ulasanModel.bukuId = bukuModel.id;
    ulasanModel.userId = authController.user.id;
    ulasanModel.ulasan = ulasanC.text;
    ulasanModel.rating = ratingValue;

    try {
      await ulasanModel.save();
      toast("Daftar Buku Telah Diperbarui");
      print("Success");
    } catch (e) {
      print('Error: $e');
      // print('1. $fileName');
    } finally {
      isSaving = false;
    }
  }

  Future delete(UlasanModel ulasanModel) async {
    if (ulasanModel.id.isEmptyOrNull) {
      Get.snackbar("Error", "Buku tidak ditemukan");
      return Future.value(null);
    }
    try {
      Get.defaultDialog(
          onConfirm: () async {
            try {
              await ulasanModel.delete();
              Get.back();
              toast("Buku Telah Dihapus");
            } catch (e) {
              print(e);
            }
          },
          textConfirm: "OK",
          radius: 15,
          textCancel: "Batalkan",
          content: const Column(
            children: [
              Text('Apakah anda yakin ingin menghapus buku ini?'),
            ],
          ),
          title: "Konfirmasi hapus");
    } on Exception catch (e) {
      Get.snackbar("Error", e.toString());
    }
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

  void fetchUsers() {
    try {
      final userModel = UserModel();
      userModel.allStreamList().listen((books) {
        user.assignAll(books);
      });
    } catch (e) {
      print('Error fetching books: $e');
    }
  }

  RxList<UlasanModel> rxUlasan = RxList<UlasanModel>();
  List<UlasanModel> get listUlasan => rxUlasan.value;
  set listUlasan(List<UlasanModel> value) => rxUlasan.value = value;
  
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
