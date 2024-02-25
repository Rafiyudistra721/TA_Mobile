// ignore_for_file: unnecessary_overrides, prefer_final_fields, avoid_print, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/data/Models/buku_model.dart';
import 'package:ta_mobile/app/data/Models/pinjam_model.dart';
import 'package:ta_mobile/app/data/Models/user_model.dart';

class ManagePeminjamanController extends GetxController {
    var users = <UserModel>[].obs;
    var books = <BukuModel>[].obs;


  ScrollController  verticalScrollController = ScrollController();

  var _isSaving = false.obs;
  bool get isSaving => _isSaving.value;
  set isSaving(bool value) => _isSaving.value = value;

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

      void fetchUsers() async {
    try {
      final userModel = UserModel();
      userModel.allStreamList().listen((usersList) {
        users.assignAll(usersList);
      });
    } catch (e) {
      print('Error fetching categories:  $e');
    }
  }

      void fetchBuku() async {
    try {
      final bukuModel = BukuModel();
      bukuModel.streamList().listen((categoriesList) {
        books.assignAll(categoriesList);
      });
    } catch (e) {
      print('Error fetching categories:  $e');
    }
  }

  RxList<PinjamModel> rxPeminjaman = RxList<PinjamModel>();
  List<PinjamModel> get listPeminjaman => rxPeminjaman.value;
  set listPeminjaman(List<PinjamModel> value) => rxPeminjaman.value = value;

  @override
  void onInit() {
    rxPeminjaman.bindStream(PinjamModel().streamList());
    fetchUsers();
    fetchBuku();
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