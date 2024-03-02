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
      body: Row(
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
                        Padding(padding: const EdgeInsets.all(16),
                        child: Text('Daftar Kategori',
                            style: GoogleFonts.urbanist(fontSize: 30)),),
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
                                columnSpacing: MediaQuery.of(context).size.width *.55,
                                horizontalMargin: 30,
                                rowsPerPage: 9,
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
                  manageKategoriController.delete(listKategori[index]);
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
