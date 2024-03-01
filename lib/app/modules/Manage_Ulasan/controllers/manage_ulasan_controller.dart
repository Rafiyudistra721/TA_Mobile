// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/data/Models/buku_model.dart';
import 'package:ta_mobile/app/data/Models/ulasan_model.dart';
import 'package:ta_mobile/app/data/Models/user_model.dart';

class ManageUlasanController extends GetxController {
  var users = <UserModel>[].obs;
  var buku = <BukuModel>[].obs;
  String? bukuId;


  final verticalScrollController = ScrollController();
  final horizontalScrollController = ScrollController();

  bool checkIsDouble(String? text) {
    try {
      double.parse(text ?? '');
      return true;
    } catch (e) {
      return false;
    }
  }

  modelToController(BukuModel buku) {
    bukuId = buku.id;
    rxUlasan.bindStream(UlasanModel(bukuId: bukuId).streamList());

  }

  var _isSaving = false.obs;
  bool get isSaving => _isSaving.value;
  set isSaving(bool value) => _isSaving.value = value;


  Future delete(UlasanModel ulasanModel) async {
    if (ulasanModel.id.isEmptyOrNull) {
      Get.snackbar("Error", "Ulasan tidak ditemukan");
      return Future.value(null);
    }
    try {
      Get.defaultDialog(
          onConfirm: () async {
            try {
              await ulasanModel.delete();
              Get.back();
              toast("Ulasan Telah Dihapus");
            } catch (e) {
              print(e);
            }
          },
          textConfirm: "OK",
          radius: 15,
          textCancel: "Batalkan",
          content: const Column(
            children: [
              Text('Apakah anda yakin ingin menghapus ulasan ini?'),
            ],
          ),
          title: "Konfirmasi hapus");
    } on Exception catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

    void fetchUsers() async {
    try {
      final userModel = UserModel();
      userModel.allStreamList().listen((userList) {
        users.assignAll(userList);
      });
    } catch (e) {
      print('Error fetching users:  $e');
    }
  }
    void fetchBooks() async {
    try {
      final bukuModel = BukuModel();
      bukuModel.streamList().listen((userList) {
        buku.assignAll(userList);
      });
    } catch (e) {
      print('Error fetching books:  $e');
    }
  }

  RxList<UlasanModel> rxUlasan = RxList<UlasanModel>();
  List<UlasanModel> get listUlasan => rxUlasan.value;
  set listUlasan(List<UlasanModel> value) => rxUlasan.value = value;

  // RxList<KategoriModel> rxKategori = RxList<KategoriModel>();
  // List<KategoriModel> get listKategori => rxKategori.value;
  // set listKategori(List<KategoriModel> value) => rxKategori.value = value;

  @override
  void onInit() {
    // rxKategori.bindStream(KategoriModel().streamList());
    super.onInit();
    fetchUsers();
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
