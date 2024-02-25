// ignore_for_file: prefer_final_fields, avoid_print, invalid_use_of_protected_member, unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_mobile/app/data/Models/user_model.dart';
import 'package:ta_mobile/app/data/Models/buku_model.dart';

class DashboardController extends GetxController {

  var _isSaving = false.obs;
  bool get isSaving => _isSaving.value;
  set isSaving(bool value) => _isSaving.value = value;

  final verticalScrollController = ScrollController();
  final horizontalScrollController = ScrollController();

  RxList<UserModel> rxPeminjam = RxList<UserModel>();
  List<UserModel> get listPeminjam => rxPeminjam.value;
  set listPeminjam(List<UserModel> value) => rxPeminjam.value = value;

  RxList<UserModel> rxPetugas = RxList<UserModel>();
  List<UserModel> get listPetugas => rxPetugas.value;
  set listPetugas(List<UserModel> value) => rxPetugas.value = value;

  RxList<UserModel> rxUser = RxList<UserModel>();
  List<UserModel> get listUser => rxUser.value;
  set listUser(List<UserModel> value) => rxUser.value = value;

  RxList<BukuModel> rxBuku = RxList<BukuModel>();
  List<BukuModel> get listBuku => rxBuku.value;
  set listBuku(List<BukuModel> value) => rxBuku.value = value;

  @override
  void onInit() {
    rxPetugas.bindStream(UserModel().petugasStreamList());
    rxPeminjam.bindStream(UserModel().peminjamStreamList());
    rxUser.bindStream(UserModel().allStreamList());
    rxBuku.bindStream(BukuModel().streamList());
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
