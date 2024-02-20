// ignore_for_file: must_be_immutable

import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ta_mobile/app/data/Models/kategori_model.dart';
import 'package:ta_mobile/app/utils/colors.dart';
import 'package:ta_mobile/app/utils/my_drawer.dart';
import 'package:ta_mobile/app/widgets/kategori_form.dart';

import '../controllers/manage_kategori_controller.dart';

class ManageKategoriView extends GetView<ManageKategoriController> {
  ManageKategoriView({Key? key}) : super(key: key);
  var columns = const [
    DataColumn(label: Text('Nama Kategori')),
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
                      // AspectRatio(
                      //   aspectRatio: 6,
                      //   child: ListView(
                      //     scrollDirection: Axis.horizontal,
                      //     children: [
                      //       Padding(
                      //         padding: const EdgeInsets.all(8.0),
                      //         child: Container(
                      //             decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.circular(8)),
                      //             child: Column(
                      //               mainAxisAlignment: MainAxisAlignment.center,
                      //               children: [
                      //                 Text(
                      //                   'Jumlah Peminjam',
                      //                   style:
                      //                       GoogleFonts.urbanist(fontSize: 17),
                      //                 ),
                      //                 Obx(() => Text(
                      //                       controller.listPeminjam.length
                      //                           .toString(),
                      //                       style: GoogleFonts.urbanist(
                      //                           fontSize: 17),
                      //                     )),
                      //               ],
                      //             )),
                      //       ),
                      //       Padding(
                      //         padding: const EdgeInsets.all(8.0),
                      //         child: Container(
                      //             decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.circular(8),),
                      //             child: Column(
                      //               mainAxisAlignment: MainAxisAlignment.center,
                      //               children: [
                      //                 Text(
                      //                   'Jumlah Petugas',
                      //                   style:
                      //                       GoogleFonts.urbanist(fontSize: 17),
                      //                 ),
                      //                 Obx(() => Text(
                      //                     controller.listPetugas.length
                      //                         .toString(),
                      //                     style: GoogleFonts.urbanist(
                      //                         fontSize: 17))),
                      //               ],
                      //             )),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Daftar Kategori',
                              style: GoogleFonts.urbanist(fontSize: 30)),
                          ElevatedButton.icon(
                              onPressed: () {
                                Get.defaultDialog(
                                  contentPadding: EdgeInsets.zero,
                                  barrierDismissible: false,
                                  content: SizedBox(
                                    height: 200,
                                    width: double.infinity,
                                    child: SingleChildScrollView(
                                        child: Column(
                                      children: [
                                        KategoriForm(
                                          kategoriModel: KategoriModel(),
                                        ),
                                      ],
                                    )),
                                  ),
                                  title: "Tambah Aset",
                                  titleStyle: const TextStyle(
                                    fontSize: 20,
                                  ),
                                );
                              },
                              icon: const Icon(Icons.add),
                              label: const Text('Tambah Kategori'))
                        ],
                      ),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.all(16),
                          child: controller.listKategori.isEmpty
                              ? const Center(child: CircularProgressIndicator())
                              : PaginatedDataTable(
                                  showCheckboxColumn: false,
                                  showFirstLastButtons: true,
                                  columns: columns,
                                  source: MyData(controller.listKategori),
                                  columnSpacing: MediaQuery.of(context).size.width / 8,
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
  ManageKategoriController manageKategoriController =
      ManageKategoriController();
  final List<KategoriModel> listKategori;

  MyData(this.listKategori);
  @override
  DataRow getRow(int index) => DataRow.byIndex(index: index, cells: [
        DataCell(Text("${listKategori[index].namaKategori}",
            style: GoogleFonts.urbanist(fontSize: 15))),
        DataCell(Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: 'Hapus kategori?',
                    middleText:
                        'Apakah anda yakin ingin menghapus kategori ini?',
                    onConfirm: () async {
                      manageKategoriController.delete(listKategori[index]);
                    },
                    textConfirm: 'Iya',
                    textCancel: 'Tidak',
                    titleStyle: GoogleFonts.urbanist(fontSize: 15),
                    middleTextStyle: GoogleFonts.urbanist(fontSize: 15),
                  );
                },
                child: const Text('HAPUS'))
          ],
        )),
      ]);

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => listKategori.length;
  @override
  int get selectedRowCount => 0;
}
