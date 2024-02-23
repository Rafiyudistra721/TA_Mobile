// ignore_for_file: prefer_final_fields, must_be_immutable

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/data/Models/buku_model.dart';
import 'package:ta_mobile/app/modules/Manage_Buku/controllers/manage_buku_controller.dart';

class BukuForm extends GetView<ManageBukuController> {
  BukuForm({super.key, required this.bukuModel});
  BukuModel bukuModel = BukuModel();
  GlobalKey<FormState> _form = GlobalKey();

  @override
  Widget build(BuildContext context) {
    controller.modelToController(bukuModel);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: const EdgeInsets.all(15),
      child: Obx(() => Form(
          key: _form,
          child: Column(
            children: [
              Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Obx(() => Container(
                            margin: const EdgeInsets.all(10),
                            height: 200,
                            width: double.infinity,
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(12),
                              color: Colors.blueGrey,
                              strokeWidth: 1,
                              dashPattern: const [5, 5],
                              child: SizedBox.expand(
                                child: FittedBox(
                                  child:
                                      !controller.imagePath.value.isEmptyOrNull
                                          ? Image.memory(
                                              controller.pickedFile!,
                                              height: 150,
                                            )
                                          : !bukuModel.coverBuku.isEmptyOrNull
                                              ? Image.network(
                                                  bukuModel.coverBuku!,
                                                  height: 150,
                                                )
                                              : const Icon(Icons
                                                  .add_photo_alternate_rounded),
                                ),
                              ),
                            ),
                          )),
                      20.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton.icon(
                              onPressed: () async {
                                showModalBottomSheet(
                                    context: context,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(16))),
                                    builder: (context) => SizedBox(
                                          height: 200,
                                          child: Column(
                                            children: [
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                padding: const EdgeInsets.only(
                                                    top: 16, left: 16),
                                                child: const Text(
                                                    "Ambil Gambar Cover Buku dari..."),
                                              ),
                                              ListTile(
                                                  title: const Text("Galeri"),
                                                  leading: const Icon(
                                                    Icons.photo,
                                                  ),
                                                  onTap: () async {
                                                    await controller.pickFile();
                                                    Get.back();
                                                  }),
                                            ],
                                          ),
                                        ));
                              },
                              icon: const Icon(
                                Icons.upload,
                              ),
                              label: const Text(
                                "Unggah",
                              )),
                        ],
                      ),
                      AppTextField(
                        textFieldType: TextFieldType.NAME,
                        isValidationRequired: true,
                        controller: controller.judulC,
                        decoration: const InputDecoration(
                            labelText: "Nama Buku",
                            hintText: "Nama Buku yang ingin di tambahkan",
                            labelStyle: TextStyle(fontSize: 15),
                            focusedBorder:
                                UnderlineInputBorder(borderSide: BorderSide())),
                        validator: (value) => value.isEmptyOrNull
                            ? "Bagian ini perlu diisi"
                            : null,
                      ),
                      10.height,
                      AppTextField(
                        textFieldType: TextFieldType.NAME,
                        isValidationRequired: true,
                        controller: controller.penulisC,
                        decoration: const InputDecoration(
                            labelText: "Penulis",
                            hintText: "Nama Penulis dari buku ini",
                            labelStyle: TextStyle(fontSize: 15),
                            focusedBorder:
                                UnderlineInputBorder(borderSide: BorderSide())),
                        validator: (value) => value.isEmptyOrNull
                            ? "Bagian ini perlu diisi"
                            : null,
                      ),
                      AppTextField(
                        textFieldType: TextFieldType.NAME,
                        isValidationRequired: true,
                        controller: controller.penerbitC,
                        decoration: const InputDecoration(
                            labelText: "Penerbit",
                            hintText: "Nama Penerbit dari buku ini",
                            labelStyle: TextStyle(fontSize: 15),
                            focusedBorder:
                                UnderlineInputBorder(borderSide: BorderSide())),
                        validator: (value) => value.isEmptyOrNull
                            ? "Bagian ini perlu diisi"
                            : null,
                      ),
                      AppTextField(
                        textFieldType: TextFieldType.NUMBER,
                        isValidationRequired: true,
                        controller: controller.tahunterbitC,
                        decoration: const InputDecoration(
                            labelText: "Tahun Terbit",
                            hintText:
                                "Tahun Terbit yang sesuai dengan Buku ini",
                            labelStyle: TextStyle(fontSize: 15),
                            focusedBorder:
                                UnderlineInputBorder(borderSide: BorderSide())),
                        validator: (value) => value.isEmptyOrNull
                            ? "Bagian ini perlu diisi"
                            : controller.checkIsDouble(value) == false
                                ? "Masukkan angka saja"
                                : null,
                      ),
                      AppTextField(
                        textFieldType: TextFieldType.MULTILINE,
                        isValidationRequired: true,
                        controller: controller.sinopsisC,
                        decoration: const InputDecoration(
                            labelText: "Sinopsis",
                            hintText:
                                "Isilah dengan Sinopsis yang sesuai dengan Buku ini",
                            labelStyle: TextStyle(fontSize: 15),
                            focusedBorder:
                                UnderlineInputBorder(borderSide: BorderSide())),
                        validator: (value) => value.isEmptyOrNull
                            ? "Bagian ini perlu diisi"
                            : null,
                      ),
                      10.height,
                    ],
                  ),
                ),
              ),
              20.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 116,
                    child: FloatingActionButton.extended(
                        backgroundColor: Colors.white,
                        onPressed: () => Get.back(),
                        label: const Text(
                          "Kembali",
                        )),
                  ),
                  5.width,
                  SizedBox(
                    width: 116,
                    child: FloatingActionButton.extended(
                        onPressed: controller.isSaving
                            ? null
                            : () {
                                if (_form.currentState!.validate()) {
                                  controller.store(bukuModel);
                                  Get.back();
                                }
                              },
                        label: controller.isSaving
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                "Simpan",
                                style: TextStyle(color: Colors.white),
                              )),
                  ),
                ],
              )
            ],
          ))),
    );
  }
}
