// ignore_for_file: unnecessary_overrides, avoid_print, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/data/Models/buku_model.dart';
import 'package:ta_mobile/app/data/Models/kategori_model.dart';
import 'package:ta_mobile/app/data/Models/koleksi_model.dart';
import 'package:ta_mobile/app/data/Models/pinjam_model.dart';
import 'package:ta_mobile/app/data/Models/user_model.dart';

class KoleksiController extends GetxController {
  var categories = <KategoriModel>[].obs;
  var selectedCategory = ''.obs;
  var allBook = <BukuModel>[].obs;

  String? userId;

  modelToController(UserModel userModel) {
    userId = userModel.id;
    rxKoleksi.bindStream(KoleksiModel(userId: userId).streamlist());
    rxPinjam.bindStream(PinjamModel(userId: userId).streamList());
  }

    var _isSaving = false.obs;
  bool get isSaving => _isSaving.value;
  set isSaving(bool value) => _isSaving.value = value;

  Future store(PinjamModel pinjamModel, KoleksiModel koleksiModel, UserModel userModel) async {
    isSaving = true;
    pinjamModel.bukuId = koleksiModel.bukuId;
    pinjamModel.userId = userModel.id;
    pinjamModel.statusPinjam = "Menunggu Konfirmasi";
    pinjamModel.tanggalPinjam = DateTime.now();
    pinjamModel.tanggalKembali = DateTime.now();

    try {
      await pinjamModel.save();
      toastLong("Permintaan Peminjaman buku telah diterima");
      print("Success");
    } catch (e) {
      print('Error: $e');
      // print('1. $fileName');
    } finally {
      isSaving = false;
    }
  }

  Future delete(BukuModel bukuModel) async {
    if (bukuModel.id.isEmptyOrNull) {
      Get.snackbar("Error", "Buku tidak ditemukan");
      return Future.value(null);
    }
    try {
      Get.defaultDialog(
          onConfirm: () async {
            try {
              await bukuModel.delete();
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
      bukuModel.streamList().listen((bookList) {
        allBook.assignAll(bookList);
      });
    } catch (e) {
      print('Error fetching books: $e');
    }
  }

  RxList<BukuModel> rxBuku = RxList<BukuModel>();
  List<BukuModel> get listBuku => rxBuku.value;
  set listBuku(List<BukuModel> value) => rxBuku.value = value;

  RxList<KoleksiModel> rxKoleksi = RxList<KoleksiModel>();
  List<KoleksiModel> get listKoleksi => rxKoleksi.value;
  set listKoleksi(List<KoleksiModel> value) => rxKoleksi.value = value;

  RxList<PinjamModel> rxPinjam = RxList<PinjamModel>();
  List<PinjamModel> get listPinjam => rxPinjam.value;
  set listPinjam(List<PinjamModel> value) => rxPinjam.value = value;
  
  @override
  void onInit() {
    super.onInit();
    rxBuku.bindStream(BukuModel().streamList());
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
