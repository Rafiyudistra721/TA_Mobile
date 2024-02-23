// ignore_for_file: unnecessary_overrides, prefer_final_fields, avoid_print, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/data/Models/pinjam_model.dart';

class ManagePeminjamanController extends GetxController {

  TextEditingController userIdC = TextEditingController();
  TextEditingController bukuIdC = TextEditingController();
  TextEditingController tanggalPinjamC = TextEditingController();
  Rx<DateTime?> tanggalKembaliC = Rx<DateTime?>(null);
  TextEditingController statusPinjamC = TextEditingController();
  final verticalScrollController = ScrollController();

  modelToController(PinjamModel pinjamModel) {
    userIdC.text = pinjamModel.userId ?? '';
    bukuIdC.text = pinjamModel.bukuId ?? '';
    // tanggalPinjamC.text = pinjamModel.tanggalPinjam is DateTime;
    // tanggalPinjamC.value = DateTime.parse(pinjamModel.tanggalPinjam);
    statusPinjamC.text = pinjamModel.statusPinjam ?? '';
  }

  var _isSaving = false.obs;
  bool get isSaving => _isSaving.value;
  set isSaving(bool value) => _isSaving.value = value;

  Future store(PinjamModel pinjamModel) async {
    isSaving = true;
    pinjamModel.userId = userIdC.text;
    pinjamModel.bukuId = bukuIdC.text;
    // pinjamModel.tanggalPinjam = tanggalPinjamC.value?.toIso8601String();
    // pinjamModel.tanggalKembali = tanggalKembaliC.value?.toIso8601String();
    pinjamModel.statusPinjam = statusPinjamC.text;

try {
      await pinjamModel.save();
      toast('Pesanan diterima');
      print('Success');
      Get.back();
    } catch (e) {
      print(e);
    } finally {
      isSaving = false;
    }
  }

  Future terima(PinjamModel pinjamModel) async {
    isSaving = true;
    pinjamModel.statusPinjam = 'Diterima';

    try {
      await pinjamModel.save();
      toast('Permintaan peminjaman diterima');
      print('Success');
      Get.back();
    } catch (e) {
      print(e);
    } finally {
      isSaving = false;
    }
  }

    Future tolak(PinjamModel pinjamModel) async {
    isSaving = true;
    pinjamModel.statusPinjam = 'Ditolak';

    try {
      await pinjamModel.save();
      toast('Permintaan peminjaman ditolak');
      print('Success');
      Get.back();
    } catch (e) {
      print(e);
    } finally {
      isSaving = false;
    }
  }
   RxList<PinjamModel> rxPeminjam = RxList<PinjamModel>();
  List<PinjamModel> get listPeminjam => rxPeminjam.value;
  set listPeminjam(List<PinjamModel> value) => rxPeminjam.value = value;

  @override
  void onInit() { rxPeminjam.bindStream(PinjamModel().streamList());
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

