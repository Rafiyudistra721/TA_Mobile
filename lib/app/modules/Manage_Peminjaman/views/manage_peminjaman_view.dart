// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ta_mobile/app/data/Models/pinjam_model.dart';
import 'package:ta_mobile/app/modules/Manage_Peminjaman/controllers/manage_peminjaman_controller.dart';
import 'package:ta_mobile/app/modules/home/controllers/home_controller.dart';
import 'package:ta_mobile/app/utils/colors.dart';
import 'package:ta_mobile/app/utils/my_drawer.dart';
import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';


class ManagePeminjamanView extends GetView<ManagePeminjamanController> {
  ManagePeminjamanView({Key? key}) : super(key: key);
  var columns = const [
    DataColumn(label: Text('Username')),
    DataColumn(label: Text('Buku')),
    DataColumn(label: Text('Tanggal Pinjam')),
    DataColumn(label: Text('Tanggal Kembali')),
    DataColumn(label: Text('Status Pinjam')),
    DataColumn(label: Text('Actions')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // open drawer
            MyDrawer(),

            // first half of page
            Expanded(
              flex: 1,
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
                      Padding(padding: EdgeInsets.all(16),
                          child: Text('Daftar Peminjam',
                              style: GoogleFonts.urbanist(fontSize: 30)),),
                              ElevatedButton(onPressed: () {
                                print(controller.listPeminjam);
                              }, child: Text("data")),
                      Obx(() => Padding(
                            padding: const EdgeInsets.all(16),
                            child: controller.listPeminjam.isEmpty
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : PaginatedDataTable(
                                      showCheckboxColumn: false,
                                      showFirstLastButtons: true,
                                      columns: columns,
                                      source: MyData(controller.listPeminjam),
                                      columnSpacing: MediaQuery.of(context).size.width / 6 ,
                                      horizontalMargin: 30,
                                      rowsPerPage: 5,
                                    ),
                                  ),
                          ),
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
  ManagePeminjamanController managePeminjamanController = ManagePeminjamanController();
    final HomeController  homeController = Get.put(HomeController());

  final List<PinjamModel> listPeminjam;

  MyData(this.listPeminjam);
  @override
  DataRow getRow(int index) => DataRow.byIndex(
          index: index,
          cells: [
            DataCell(Text("${listPeminjam[index].userId}",
                style:
                    GoogleFonts.urbanist(fontSize: 15))),
            DataCell(Text("${listPeminjam[index].bukuId}",
                style:
                    GoogleFonts.urbanist(fontSize: 15))),
            DataCell(Text("${listPeminjam[index].tanggalPinjam}",
                style:
                    GoogleFonts.urbanist(fontSize: 15))),
            DataCell(Text("${listPeminjam[index].tanggalKembali}",
                style:
                    GoogleFonts.urbanist(fontSize: 15))),
             DataCell(Text("${listPeminjam[index].statusPinjam}",
                style:
                    GoogleFonts.urbanist(fontSize: 15))),        
            DataCell(Row(
              children: [
                listPeminjam[index].statusPinjam == 'Diterima'
                    ? ElevatedButton(
                        onPressed: () {
                          Get.defaultDialog(
                            title:
                                'Terima permintaan peminjaman?',
                            middleText:
                                'Apakah anda yakin ingin menerima permintaan peminjaman ini?',
                            onConfirm: () async {
                              managePeminjamanController.terima(listPeminjam[index]);
                            },
                            textConfirm: 'Iya',
                            textCancel: 'Tidak',
                            titleStyle: GoogleFonts.urbanist(
                                fontSize: 15),
                            middleTextStyle: GoogleFonts.urbanist(
                                fontSize: 15),
                          );
                        },
                        child: const Text('DITERIMA'))
                    : listPeminjam[index].statusPinjam == 'Ditolak'
                        ? ElevatedButton(
                            onPressed: () {
                              Get.defaultDialog(
                                title:
                                    'Tolak permintaan peminjaman?',
                                middleText:
                                    'Apakah anda yakin ingin menolak permintaan peminjaman ini?',
                                onConfirm: () async {
                                  managePeminjamanController
                                      .tolak(listPeminjam[index]);
                                },
                                textConfirm: 'Iya',
                                textCancel: 'Tidak',
                                titleStyle: GoogleFonts.urbanist(
                                    fontSize: 15),
                                middleTextStyle: GoogleFonts.urbanist(
                                    fontSize: 15),
                              );
                            },
                            child: const Text('DITOLAK'))
                        : const SizedBox(width: 0),
              ],
            )),
          ]);

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => listPeminjam.length;
  @override
  int get selectedRowCount => 0;
}
