// ignore_for_file: prefer_final_fields, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/data/Models/kategori_model.dart';
import 'package:ta_mobile/app/modules/Manage_Kategori/controllers/manage_kategori_controller.dart';

class KategoriForm extends GetView<ManageKategoriController> {
  KategoriForm({super.key, required this.kategoriModel});
  KategoriModel kategoriModel = KategoriModel();
  GlobalKey<FormState> _form = GlobalKey();


  @override
  Widget build(BuildContext context) {
    controller.modelToController(kategoriModel);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: const EdgeInsets.all(15),
      child: Obx(() => Form(
          key: _form,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    AppTextField(
                      textFieldType: TextFieldType.NAME,
                      isValidationRequired: true,
                      controller: controller.namaKategoriC,
                      decoration: const InputDecoration(
                          labelText: "Nama Kategori",
                          hintText: "Isilah dengan nama kategori yang ingin anda tambahkan",
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
                                  controller.store(kategoriModel);
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
