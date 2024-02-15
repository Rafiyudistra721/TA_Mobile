// ignore_for_file: unnecessary_overrides, prefer_final_fields, avoid_print, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/data/Models/kategori_model.dart';

class ManageKategoriController extends GetxController {

  TextEditingController namaKategoriC = TextEditingController();
  final verticalScrollController = ScrollController();

  modelToController(KategoriModel kategoriModel) {
    namaKategoriC.text = kategoriModel.namaKategori ?? '';
  }

  var _isSaving = false.obs;
  bool get isSaving => _isSaving.value;
  set isSaving(bool value) => _isSaving.value = value;

  Future store(KategoriModel kategoriModel) async {
    isSaving = true;
    kategoriModel.namaKategori = namaKategoriC.text;

    try {
      await kategoriModel.save();
      toast("Daftar Kategori Telah Diperbarui");
      print("Success");
      Get.back();
    } catch (e) {
      print(e);
    } finally {
      isSaving = false;
    }
  }

  Future delete(KategoriModel kategoriModel) async {
    if (kategoriModel.id.isEmptyOrNull) {
      Get.snackbar("Error", "Kategori tidak ditemukan");
      return Future.value(null);
    }
    try {
      Get.defaultDialog(
        onConfirm: () async {
          try {
            await kategoriModel.delete();
            Get.back();
            toast("Kategori Telah Dihapus");
          } catch (e) {
            print(e);
          }
        },
        textConfirm: "OK",
        radius: 15,
        textCancel: "Batalkan",
        content: const Column(
          children: [
            Text('Apakah anda yakin ingin menghapus kategori ini?'),

          ],
        ),
        title: "Konfirmasi hapus"
      );
    } on Exception catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  RxList<KategoriModel> rxKategori = RxList<KategoriModel>();
  List<KategoriModel> get listKategori => rxKategori.value;
  set listKategori(List<KategoriModel> value) => rxKategori.value = value;

  @override
  void onInit() {
    rxKategori.bindStream(KategoriModel().streamList());
    super.onInit();
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
