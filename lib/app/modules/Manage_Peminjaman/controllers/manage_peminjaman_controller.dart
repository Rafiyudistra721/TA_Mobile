// ignore_for_file: unnecessary_overrides, invalid_use_of_protected_member, prefer_final_fields, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/data/Models/pinjam_model.dart';

class ManagePeminjamanController extends GetxController {
  
  var _isSaving = false.obs;
  bool get isSaving => _isSaving.value;
  set isSaving(bool value) => _isSaving.value = value;

  final verticalScrollController = ScrollController();
  final horizontalScrollController = ScrollController();

  Future upLevel(PinjamModel pinjamModel) async {
    isSaving = true;

    try {
      await pinjamModel.save();
      toast('Level pengguna telah diubah menjadi Petugas');
      print('Success');
      Get.back();
    } catch (e) {
      print(e);
    } finally {
      isSaving = false;
    }
  }

  RxList<PinjamModel> rxPinjam = RxList<PinjamModel>();
  List<PinjamModel> get listPinjam => rxPinjam.value;
  set listPinjam(List<PinjamModel> value) => rxPinjam.value = value;


  @override
  void onInit() {
    rxPinjam.bindStream(PinjamModel().streamList());
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
