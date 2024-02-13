// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ta_mobile/app/data/Models/user_model.dart';
import 'package:ta_mobile/app/utils/colors.dart';
import 'package:ta_mobile/app/utils/my_drawer.dart';
import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';

import '../controllers/tambah_petugas_controller.dart';

class TambahPetugasView extends GetView<TambahPetugasController> {
  TambahPetugasView({Key? key}) : super(key: key);
  var columns = const [
    DataColumn(label: Text('Username')),
    DataColumn(label: Text('Level')),
    DataColumn(label: Text('Email')),
    DataColumn(label: Text('Actions')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // open drawer
            MyDrawer(),

            // first half of page
            Expanded(
              flex: 2,
              child: AdaptiveScrollbar(
                controller: controller.verticalScrollController,
                underColor: Colors.blueGrey.withOpacity(0.3),
                sliderDefaultColor: active.withOpacity(0.7),
                sliderActiveColor: active,
                child: SingleChildScrollView(
                  controller: controller.verticalScrollController,
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 4,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.grey[700]),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Jumlah Peminjam',
                                        style: GoogleFonts.ubuntu(fontSize: 17),
                                      ),
                                      Obx(() => Text(
                                            controller.listPeminjam.length
                                                .toString(),
                                            style: GoogleFonts.ubuntu(
                                                fontSize: 17),
                                          )),
                                    ],
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.grey[700]),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Jumlah Petugas',
                                        style: GoogleFonts.ubuntu(fontSize: 17),
                                      ),
                                      Obx(() => Text(
                                          controller.listPetugas.length
                                              .toString(),
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 17))),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Text('Pengguna',
                          style: GoogleFonts.ubuntu(
                              fontSize: 30, color: Colors.black)),
                      Obx(() => Padding(
                            padding: const EdgeInsets.all(16),
                            child: controller.listUser.isEmpty
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : PaginatedDataTable(
                                    columns: columns,
                                    source: MyData(controller.listUser),
                                    columnSpacing: 50,
                                    horizontalMargin: 30,
                                    rowsPerPage: 10,
                                  ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyData extends DataTableSource {
  TambahPetugasController tambahPetugasController = TambahPetugasController();
  final List<UserModel> listUser;

  MyData(this.listUser);
  @override
  DataRow getRow(int index) => DataRow.byIndex(index: index, cells: [
        DataCell(Text("${listUser[index].username}",
            style: GoogleFonts.ubuntu(fontSize: 15, color: Colors.white))),
        DataCell(Text("${listUser[index].level}",
            style: GoogleFonts.ubuntu(fontSize: 15, color: Colors.white))),
        DataCell(Text("${listUser[index].email}",
            style: GoogleFonts.ubuntu(fontSize: 15, color: Colors.white))),
        DataCell(listUser[index].level == 'Peminjam'
            ? ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: 'Naikkan level pengguna ini menjadi Petugas?',
                    middleText:
                        'Apakah anda yakin ingin menaikkan level pengguna ini menjadi petugas?',
                    onConfirm: () async {
                      tambahPetugasController.upLevel(listUser[index]);
                      Get.back();
                    },
                    textConfirm: 'Iya',
                    textCancel: 'Tidak',
                    buttonColor: colorPrimary,
                    confirmTextColor: Colors.black,
                    cancelTextColor: colorPrimary,
                    titleStyle:
                        GoogleFonts.ubuntu(fontSize: 15, color: Colors.black),
                    middleTextStyle:
                        GoogleFonts.ubuntu(fontSize: 15, color: Colors.black),
                  );
                },
                child: const Text('UP LEVEL'))
            : listUser[index].level == 'Petugas' 
                ? ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: 'Turunkan level pengguna ini menjadi Peminjam?',
                    middleText:
                        'Apakah anda yakin ingin menurunkan level pengguna ini menjadi peminjam?',
                    onConfirm: () async {
                      tambahPetugasController.downLevel(listUser[index]);
                      Get.back();
                    },
                    textConfirm: 'Iya',
                    textCancel: 'Tidak',
                    buttonColor: colorPrimary,
                    confirmTextColor: Colors.black,
                    cancelTextColor: colorPrimary,
                    titleStyle:
                        GoogleFonts.ubuntu(fontSize: 15, color: Colors.black),
                    middleTextStyle:
                        GoogleFonts.ubuntu(fontSize: 15, color: Colors.black),
                  );
                },
                child: const Text('DOWN LEVEL'))
                : const SizedBox(width: 0)
                )
      ]);

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => listUser.length;
  @override
  int get selectedRowCount => 0;
}
