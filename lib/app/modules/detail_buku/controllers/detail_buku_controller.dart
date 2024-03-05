// ignore_for_file: unnecessary_overrides, avoid_print, invalid_use_of_protected_member, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/data/Models/buku_model.dart';
import 'package:ta_mobile/app/data/Models/kategori_model.dart';
import 'package:ta_mobile/app/data/Models/koleksi_model.dart';
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

  Future modelToController(BukuModel bukuModel) async {
    bukuId = bukuModel.id;
    rxUlasan.bindStream(UlasanModel(bukuId: bukuId).streamList());
  }

  Future storeToBookmark(KoleksiModel koleksiModel, BukuModel bukuModel,
      AuthController authController) async {
    isSaving = true;
    koleksiModel.bukuId = bukuModel.id;
    koleksiModel.userId = authController.user.id;

    try {
      await koleksiModel.save();
      toastLong("Buku telah ditambahkan ke koleksi anda");
      print("Success");
    } catch (e) {
      print('Error: $e');
    } finally {
      isSaving = false;
    }
  }

  var _isSaving = false.obs;
  bool get isSaving => _isSaving.value;
  set isSaving(bool value) => _isSaving.value = value;

  Future store(UlasanModel ulasanModel, BukuModel bukuModel,
      AuthController authController) async {
    isSaving = true;
    ulasanModel.bukuId = bukuModel.id;
    ulasanModel.userId = authController.user.id;
    ulasanModel.ulasan = ulasanC.text;
    ulasanModel.rating = ratingValue;

    try {
      await ulasanModel.save();
      toastLong("Terima kasih atas ulasan anda");
      print("Success");
    } catch (e) {
      print('Error: $e');
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

  Future fetchCategories() async {
    try {
      final kategoriModel = KategoriModel();
      kategoriModel.streamList().listen((categoriesList) {
        categories.assignAll(categoriesList);
      });
    } catch (e) {
      print('Error fetching categories:  $e');
    }
  }

  Future fetchBooks() async {
    try {
      final bukuModel = BukuModel();
      bukuModel.streamList().listen((books) {
        allBooks.assignAll(books);
      });
    } catch (e) {
      print('Error fetching books: $e');
    }
  }

  Future fetchUsers() async {
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
