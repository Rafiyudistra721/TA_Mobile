// ignore_for_file: must_be_immutable

import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/data/Models/buku_model.dart';
import 'package:ta_mobile/app/data/Models/kategori_model.dart';
import 'package:ta_mobile/app/routes/app_pages.dart';
import 'package:ta_mobile/app/utils/colors.dart';
import 'package:ta_mobile/app/utils/my_drawer.dart';
import 'package:ta_mobile/app/widgets/buku_form.dart';

import '../controllers/manage_buku_controller.dart';

class ManageBukuView extends GetView<ManageBukuController> {
  ManageBukuView({Key? key}) : super(key: key);
  var columns = const [
    DataColumn(label: Text('Cover Buku', style: TextStyle(fontSize: 20))),
    DataColumn(label: Text('Judul Buku', style: TextStyle(fontSize: 20))),
    DataColumn(label: Text('Kategori', style: TextStyle(fontSize: 20))),
    DataColumn(label: Text('Penulis', style: TextStyle(fontSize: 20))),
    DataColumn(label: Text('Penerbit', style: TextStyle(fontSize: 20))),
    DataColumn(label: Text('Tahun Terbit', style: TextStyle(fontSize: 20))),
    DataColumn(label: Text('Sinopsis', style: TextStyle(fontSize: 20))),
    DataColumn(label: Text('Actions', style: TextStyle(fontSize: 20))),
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
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text('Daftar Buku',
                                style: GoogleFonts.urbanist(fontSize: 30)),
                          ),
                          ElevatedButton.icon(
                              onPressed: () {
                                Get.defaultDialog(
                                  contentPadding: EdgeInsets.zero,
                                  barrierDismissible: false,
                                  content: SizedBox(
                                    height: MediaQuery.of(context).size.height -
                                        107,
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
                                  title: "Tambah Buku",
                                  titleStyle: const TextStyle(
                                    fontSize: 20,
                                  ),
                                );
                              },
                              icon: const Icon(Icons.add),
                              label: const Text('Tambah Buku')),
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
                                  source: MyData(controller.listBuku, controller.categories),
                                  columnSpacing:
                                      MediaQuery.of(context).size.width * .03,
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
  ManageBukuController managebukuController = ManageBukuController();
  final List<BukuModel> listBuku;
  final List<KategoriModel> categories;

  MyData(this.listBuku, this.categories);
  @override
  DataRow getRow(int index) => DataRow.byIndex(
    index: index, 
    onLongPress: () {
      Get.toNamed(Routes.MANAGE_ULASAN, arguments: listBuku[index]);
    },
    cells: [
        DataCell(listBuku[index].coverBuku.isEmptyOrNull
            ? Image.asset(
                "assets/test.jpg",
                height: 180,
                width: 180,
              )
            : Image.network(
                listBuku[index].coverBuku ?? "",
                width: 180,
                height: 180,
              )),
        DataCell(Text("${listBuku[index].judul}",
            style: GoogleFonts.urbanist(fontSize: 17))),
        DataCell(Text("${categories.firstWhere((cat) => cat.id == listBuku[index].kategoriId).namaKategori}",
            style: GoogleFonts.urbanist(fontSize: 17))),
        DataCell(Text("${listBuku[index].penulis}",
            style: GoogleFonts.urbanist(fontSize: 17))),
        DataCell(Text("${listBuku[index].penerbit}",
            style: GoogleFonts.urbanist(fontSize: 17))),
        DataCell(Text("${listBuku[index].tahunTerbit}",
            style: GoogleFonts.urbanist(fontSize: 17))),
        DataCell(Text("${listBuku[index].sinopsis}",
            style: GoogleFonts.urbanist(fontSize: 17))),
        DataCell(Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(
                    contentPadding: EdgeInsets.zero,
                    barrierDismissible: false,
                    content: SizedBox(
                      height: Get.height * .84,
                      width: double.infinity,
                      child: SingleChildScrollView(
                          child: Column(
                        children: [
                          BukuForm(
                            bukuModel: listBuku[index],
                          ),
                        ],
                      )),
                    ),
                    title: "Tambah Buku",
                    titleStyle: const TextStyle(
                      fontSize: 20,
                    ),
                  );
                },
                child: const Icon(Icons.edit_rounded)),
            ElevatedButton(
                onPressed: () async {
                  managebukuController.delete(listBuku[index]);
                },
                child: const Icon(Icons.delete_rounded))
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
