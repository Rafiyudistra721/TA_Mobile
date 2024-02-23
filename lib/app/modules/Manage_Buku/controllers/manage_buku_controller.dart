// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/data/Models/buku_model.dart';
import 'package:image_picker/image_picker.dart';
class ManageBukuController extends GetxController {

  var imagePath = ''.obs;
  ImagePicker picker = ImagePicker();
  TextEditingController judulC = TextEditingController();
  TextEditingController penulisC = TextEditingController();
  TextEditingController penerbitC = TextEditingController();
  TextEditingController tahunterbitC = TextEditingController();
  TextEditingController sinopsisC = TextEditingController();
  final verticalScrollController = ScrollController();

  modelToController(BukuModel bukuModel) {
    judulC.text = bukuModel.judul ?? '';
    penulisC.text = bukuModel.penulis ?? '';
    penerbitC.text = bukuModel.penerbit ?? '';
    tahunterbitC.text = bukuModel.tahunTerbit.toString();
    sinopsisC.text = bukuModel.sinopsis ?? '';
  }

  Future pickImage(ImageSource source) async{
    XFile? xFile = await picker.pickImage(source: source);
    if (xFile is XFile) {
      imagePath.value = xFile.path;
    }
  }
  var _isSaving = false.obs;
  bool get isSaving => _isSaving.value;
  set isSaving(bool value) => _isSaving.value = value;

  Future store(BukuModel bukuModel) async {
    isSaving = true;
    bukuModel.judul = judulC.text;
    bukuModel.penulis = penulisC.text;
    bukuModel.penerbit = penerbitC.text;
    bukuModel.tahunTerbit = int.tryParse(tahunterbitC.text);
    bukuModel.sinopsis = judulC.text;

    try {
      await bukuModel.save();
      toast("Daftar Buku Telah Diperbarui");
      print("Success");
      Get.back();
    } catch (e) {
      print(e);
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
        title: "Konfirmasi hapus"
      );
    } on Exception catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  RxList<BukuModel> rxBuku = RxList<BukuModel>();
  List<BukuModel> get listBuku => rxBuku.value;
  set listBuku(List<BukuModel> value) => rxBuku.value = value;

  @override
  void onInit() {
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

