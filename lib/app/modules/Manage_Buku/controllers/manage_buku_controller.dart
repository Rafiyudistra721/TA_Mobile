// ignore_for_file: unnecessary_overrides, invalid_use_of_protected_member, avoid_print, prefer_final_fields

import 'dart:typed_data';

import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/data/Models/buku_model.dart';
import 'package:ta_mobile/app/integrations/firestore.dart';

class ManageBukuController extends GetxController {
  BukuModel bukuModel = BukuModel();
  FilePickerResult? results;
  Uint8List? pickedFile;
  var imagePath = ''.obs;
  TextEditingController judulC = TextEditingController();
  TextEditingController penulisC = TextEditingController();
  TextEditingController penerbitC = TextEditingController();
  TextEditingController tahunterbitC = TextEditingController();
  TextEditingController sinopsisC = TextEditingController();
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

  modelToController(BukuModel bukuModel) {
    judulC.text = bukuModel.judul ?? '';
    penulisC.text = bukuModel.penulis ?? '';
    penerbitC.text = bukuModel.penerbit ?? '';
    tahunterbitC.text = bukuModel.tahunTerbit?.toString() ?? '';
    sinopsisC.text = bukuModel.sinopsis ?? '';
  }

  Future pickFile() async {
    final FilePickerResult? result = await FilePickerWeb.platform.pickFiles(type: FileType.image);
    if (result != null && result.files.isNotEmpty) {
      pickedFile = result.files.first.bytes;
      imagePath.value = pickedFile.toString();
      results = result;
      // String fileName = result.files.first.name;
      // return fileName;
    } else {
      toast('Kamu tidak memilih file apapun', length: Toast.LENGTH_SHORT);
    }
  }

  Future<String> uploadFile(Uint8List? file, FilePickerResult? results) async {
        String fileName = results!.files.first.name;
    try {
      final storageRef = firebaseStorage.ref(fileName);

      final uploadTask = storageRef.putData(file!);

      // final progress = StreamBuilder<TaskSnapshot>(
      //   stream: uploadTask.snapshotEvents,
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       final progress =
      //           snapshot.data!.bytesTransferred / snapshot.data!.totalBytes;
      //       return LinearProgressIndicator(value: progress);
      //     } else {
      //       return CircularProgressIndicator();
      //     }
      //   },
      // );

      final downloadUrl = await (await uploadTask).ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      toast('Error: $e');
      rethrow;
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
    bukuModel.sinopsis = sinopsisC.text;

    try {
      String downloadUrl = await uploadFile(pickedFile, results);
      bukuModel.coverBuku = downloadUrl;
      await bukuModel.save();
      toast("Daftar Buku Telah Diperbarui");
      print("Success");
    } catch (e) {
      print('Error: $e');
      // print('1. $fileName');
      print('2. $pickedFile');
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
