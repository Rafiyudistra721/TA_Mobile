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

  Future dipinjam(PinjamModel pinjamModel, BukuModel bukuModel) async {
    isSaving = true;
    final hariIni = DateTime.now();
    pinjamModel.statusPinjam = 'Dipinjam';
    pinjamModel.tanggalPinjam = hariIni;
    pinjamModel.tanggalKembali = hariIni.add(const Duration(days: 7));
    bukuModel.jumlah = bukuModel.jumlah! -1;

    try {
      await pinjamModel.save();
      await bukuModel.save();
      toast('Buku telah dipinjamkan');
      print('Success');
      Get.back();
    } catch (e) {
      print(e);
    } finally {
      isSaving = false;
    }
  }

  Future pengembalian(PinjamModel pinjamModel, BukuModel bukuModel) async {
    isSaving = true;
    pinjamModel.statusPinjam = 'Dikembalikan';
    bukuModel.jumlah = bukuModel.jumlah! + 1;

    try {
      await pinjamModel.save();
      await bukuModel.save();
      toast('Buku telah dipinjamkan');
      print('Success');
      Get.back();
    } catch (e) {
      print(e);
    } finally {
      isSaving = false;
    }
  }

  void checkIsLate(PinjamModel pinjamModel) async {
  if (pinjamModel.statusPinjam != 'Dikembalikan' && DateTime.parse(pinjamModel.tanggalKembali!.toIso8601String())
        .difference(DateTime.now()).inDays < 0) {
    isSaving = true;
    pinjamModel.statusPinjam = 'Terlambat';
    try {
      await pinjamModel.save();
    } catch (e) {
      print(e);
    } finally {
      isSaving = false;
    }
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
      print('Gagal mendapatkan data pengguna:  $e');
    }
  }

      void fetchBuku() async {
    try {
      final bukuModel = BukuModel();
      bukuModel.streamList().listen((categoriesList) {
        books.assignAll(categoriesList);
      });
    } catch (e) {
      print('Gagal mendapatkan data buku:  $e');
    }
  }

  RxList<PinjamModel> rxPeminjaman = RxList<PinjamModel>();
  // List<PinjamModel> get listPeminjaman => rxPeminjaman.value;
  // set listPeminjaman(List<PinjamModel> value) => rxPeminjaman.value = value;

  @override
  void onInit() {
    super.onInit();
    rxPeminjaman.bindStream(PinjamModel().streamList());
    rxPeminjaman.listen((listPeminjaman) {
      updatePeminjamanStatus(listPeminjaman);
    });
    fetchUsers();
    fetchBuku();
  }

    void updatePeminjamanStatus(List<PinjamModel> peminjamanList) {
    peminjamanList.forEach((pinjamModel) {
      checkIsLate(pinjamModel);
    });
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