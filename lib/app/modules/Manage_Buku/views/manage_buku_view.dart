// ignore_for_file: must_be_immutable


import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/data/Models/buku_model.dart';
import 'package:ta_mobile/app/utils/colors.dart';
import 'package:ta_mobile/app/utils/my_drawer.dart';
import 'package:ta_mobile/app/widgets/buku__form.dart';

import '../controllers/manage_buku_controller.dart';

class ManageBukuView extends GetView<ManageBukuController> {
  ManageBukuView({Key? key}) : super(key: key);
  var columns = const [
    DataColumn(label: Text('Cover Buku')),
    DataColumn(label: Text('Judul Buku')),
    DataColumn(label: Text('Penulis')),
    DataColumn(label: Text('Penerbit')),
    DataColumn(label: Text('Tahun Terbit')),
    DataColumn(label: Text('Sinopsis')),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(padding: EdgeInsets.all(16), 
                          child: Text('Daftar Buku',
                              style: GoogleFonts.urbanist(fontSize: 30)),),
                          ElevatedButton.icon(
                              onPressed: () {
                                Get.defaultDialog(
                                  contentPadding: EdgeInsets.zero,
                                  barrierDismissible: false,
                                  content: SizedBox(
                                    height: 435,
                                    width: double.infinity,
                                    child: SingleChildScrollView(
                                        child: Column(
                                      children: [
                                        BukuForm(
                                          bukuModel: BukuModel(),
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
                              label: const Text('Tambah Buku'))
                        ],
                      ),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.all(16),
                          child: controller.listBuku.isEmpty
                              ? const Center(child: CircularProgressIndicator())
                              : PaginatedDataTable(
                                  showCheckboxColumn: false,
                                  showFirstLastButtons: true,
                                  columns: columns,
                                  source: MyData(controller.listBuku),
                                  columnSpacing: MediaQuery.of(context).size.width / 20,
                                  horizontalMargin: 30,
                                  rowsPerPage: 5,
                                  dataRowMaxHeight: 200,
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
  ManageBukuController managebukuController =
      ManageBukuController();
  final List<BukuModel> listBuku;

  MyData(this.listBuku);
  @override
  DataRow getRow(int index) => DataRow.byIndex(index: index, cells: [
        DataCell 
          (listBuku[index].coverBuku.isEmptyOrNull
        ? Image.asset(
          "assets/test.jpg", height: 180, width:180,
        )
        : Image.network(
          listBuku[index].coverBuku ?? "", 
          height: 180,
          width: 180,
        )
        ),
        DataCell(Text("${listBuku[index].judul}",
            style: GoogleFonts.urbanist(fontSize: 15))),
        DataCell(Text("${listBuku[index].penulis}",
            style: GoogleFonts.urbanist(fontSize: 15))),
        DataCell(Text("${listBuku[index].penerbit}",
            style: GoogleFonts.urbanist(fontSize: 15))),
        DataCell(Text("${listBuku[index].tahunTerbit}",
            style: GoogleFonts.urbanist(fontSize: 15))),
        DataCell(Text("${listBuku[index].sinopsis}",
            style: GoogleFonts.urbanist(fontSize: 15))),
        DataCell(Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: 'Hapus Buku?',
                    middleText:
                        'Apakah anda yakin ingin menghapus buku ini?',
                    onConfirm: () async {
                      managebukuController.delete(listBuku[index]);
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
  int get rowCount => listBuku.length;
  @override
  int get selectedRowCount => 0;
}
