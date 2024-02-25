// ignore_for_file: prefer_final_fields, avoid_print, invalid_use_of_protected_member, unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/data/Models/user_model.dart';

class ManageUserController extends GetxController {

  var _isSaving = false.obs;
  bool get isSaving => _isSaving.value;
  set isSaving(bool value) => _isSaving.value = value;

  final verticalScrollController = ScrollController();
  final horizontalScrollController = ScrollController();

  Future upLevel(UserModel userModel) async {
    isSaving = true;
    userModel.level = 'Petugas';

    try {
      await userModel.save();
      toast('Level pengguna telah diubah menjadi Petugas');
      print('Success');
      Get.back();
    } catch (e) {
      print(e);
    } finally {
      isSaving = false;
    }
  }
  Future downLevel(UserModel userModel) async {
    isSaving = true;
    userModel.level = 'Peminjam';

    try {
      await userModel.save();
      toast('Level pengguna telah diubah menjadi Peminjam');
      print('Success');
      Get.back();
    } catch (e) {
      print(e);
    } finally {
      isSaving = false;
    }
  }

  Future block(UserModel userModel) async {
    isSaving = true;
    userModel.level = 'Terblokir';

    try {
      await userModel.save();
      toast('Pengguna telah terblokir');
      print('Success');
      Get.back();
    } catch (e) {
      print(e);
    } finally {
      isSaving = false;
    }
  }

  Future unblock(UserModel userModel) async {
    isSaving = true;
    userModel.level = 'Peminjam';

    try {
      await userModel.save();
      toast('Pengguna telah terblokir');
      print('Success');
      Get.back();
    } catch (e) {
      print(e);
    } finally {
      isSaving = false;
    }
  }

  RxList<UserModel> rxPeminjam = RxList<UserModel>();
  List<UserModel> get listPeminjam => rxPeminjam.value;
  set listPeminjam(List<UserModel> value) => rxPeminjam.value = value;

  RxList<UserModel> rxPetugas = RxList<UserModel>();
  List<UserModel> get listPetugas => rxPetugas.value;
  set listPetugas(List<UserModel> value) => rxPetugas.value = value;

  RxList<UserModel> rxUser = RxList<UserModel>();
  List<UserModel> get listUser => rxUser.value;
  set listUser(List<UserModel> value) => rxUser.value = value;

  @override
  void onInit() {
    rxPetugas.bindStream(UserModel().petugasStreamList());
    rxPeminjam.bindStream(UserModel().peminjamStreamList());
    rxUser.bindStream(UserModel().allStreamList());
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
