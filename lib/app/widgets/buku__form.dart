// ignore_for_file: prefer_final_fields, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/data/Models/buku_model.dart';
import 'package:ta_mobile/app/modules/Manage_Buku/controllers/manage_buku_controller.dart';
import 'package:image_picker/image_picker.dart';

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
                      AppTextField(
                        textFieldType: TextFieldType.NAME,
                        isValidationRequired: true,
                        controller: controller.judulC,
                        decoration: const InputDecoration(
                            labelText: "Nama Buku",
                            hintText: "Isilah dengan nama Buku yang ingin anda tambahkan",
                            labelStyle:
                                TextStyle(fontSize: 15),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide())),
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
                            hintText: "Isilah dengan nama Penulis yang ingin anda tambahkan",
                            labelStyle:
                                TextStyle(fontSize: 15),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide())),
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
                            hintText: "Isilah dengan nama Penerbit yang ingin anda tambahkan",
                            labelStyle:
                                TextStyle(fontSize: 15),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide())),
                        validator: (value) => value.isEmptyOrNull
                            ? "Bagian ini perlu diisi"
                            : null,
                      ),
                      AppTextField(
                        textFieldType: TextFieldType.NAME,
                        isValidationRequired: true,
                        controller: controller.tahunterbitC,
                        decoration: const InputDecoration(
                            labelText: "Tahun Terbit",
                            hintText: "Isilah dengan Tahun Terbit yang ingin anda tambahkan",
                            labelStyle:
                                TextStyle(fontSize: 15),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide())),
                        validator: (value) => value.isEmptyOrNull
                            ? "Bagian ini perlu diisi"
                            : null,
                      ),
                      AppTextField(
                        textFieldType: TextFieldType.NAME,
                        isValidationRequired: true,
                        controller: controller.sinopsisC,
                        decoration: const InputDecoration(
                            labelText: "Sinopsis",
                            hintText: "Isilah dengan Sinopsis yang ingin anda tambahkan",
                            labelStyle:
                                TextStyle(fontSize: 15),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide())),
                        validator: (value) => value.isEmptyOrNull
                            ? "Bagian ini perlu diisi"
                            : null,
                      ),
                      10.height
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
                  TextButton.icon(
                              onPressed: () async {
                                showModalBottomSheet(
                                    context: context,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(16))),
                                    builder: (context) => Container(
                                          height: 200,
                                          child: Column(
                                            children: [
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                padding: const EdgeInsets.only(
                                                    top: 16, left: 16),
                                                child:
                                                    const Text("Image Source"),
                                              ),
                                              ListTile(
                                                  title: const Text("Camera"),
                                                  leading: const Icon(
                                                    Icons.camera,
                                                    
                                                  ),
                                                  onTap: () async {
                                                    await controller.pickImage(
                                                        ImageSource.camera);
                                                    Get.back();
                                                  }),
                                              ListTile(
                                                  title: const Text("Gallery"),
                                                  leading: const Icon(
                                                    Icons.photo,
                                                    
                                                  ),
                                                  onTap: () async {
                                                    await controller.pickImage(
                                                        ImageSource.gallery);
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
                                "Upload Image",
                                                              )),
                  SizedBox(
                    width: 116,
                    child: FloatingActionButton.extended(
                        onPressed: controller.isSaving
                            ? null
                            : () {
                                if (_form.currentState!.validate()) {
                                  controller.store(bukuModel);
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
