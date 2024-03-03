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
    DataColumn(
        label: Text('Cover Buku',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w900,
                color: Colors.white))),
    DataColumn(
        label: Text('Judul Buku',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w900,
                color: Colors.white))),
    DataColumn(
        label: Text('Kategori',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w900,
                color: Colors.white))),
    DataColumn(
        label: Text('Penulis',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w900,
                color: Colors.white))),
    DataColumn(
        label: Text('Penerbit',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w900,
                color: Colors.white))),
    DataColumn(
        label: Text('Jumlah',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w900,
                color: Colors.white))),
    DataColumn(
        label: Text('Tahun Terbit',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w900,
                color: Colors.white))),
    DataColumn(
        label: Text('Sinopsis',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w900,
                color: Colors.white))),
    DataColumn(
        label: Text('Aksi',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w900,
                color: Colors.white))),
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
                    // AppBar(),
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.all(16),
                        child: controller.listBuku.isEmpty
                            ? const Center(child: CircularProgressIndicator())
                            : PaginatedDataTable(
                                header: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  child: Text('Daftar Buku',
                                      style: GoogleFonts.urbanist(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w800)),
                                ),
                                actions: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 15),
                                    child: FloatingActionButton.extended(
                                      isExtended: true,
                                      onPressed: () {
                                        Get.defaultDialog(
                                          contentPadding: EdgeInsets.zero,
                                          barrierDismissible: false,
                                          content: SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height -
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
                                      icon:
                                          const Icon(Icons.add_circle_rounded),
                                      label: const Text(
                                        "Tambah Buku",
                                      ),
                                    ),
                                  ),
                                ],
                                showCheckboxColumn: false,
                                showFirstLastButtons: true,
                                columns: columns,
                                source: MyData(controller.listBuku,
                                    controller.categories, context),
                                columnSpacing:
                                    MediaQuery.of(context).size.width * .03,
                                horizontalMargin: 20,
                                rowsPerPage: 10,
                                dataRowMaxHeight: 130,
                                headingRowHeight: 50,
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
  ManageBukuController managebukuController = ManageBukuController();
  final List<BukuModel> listBuku;
  final List<KategoriModel> categories;
  final dynamic context;

  MyData(this.listBuku, this.categories, this.context);
  @override
  DataRow getRow(int index) => DataRow.byIndex(
          index: index,
          onLongPress: () {
            Get.toNamed(Routes.MANAGE_ULASAN, arguments: listBuku[index]);
          },
          cells: [
            DataCell(listBuku[index].coverBuku.isEmptyOrNull
                ? AspectRatio(
                    aspectRatio: 1.6 / 1,
                    child: Image.asset(
                      "assets/test.jpg",
                      height: 180,
                      width: 180,
                    ),
                  )
                : AspectRatio(
                    aspectRatio: 1.6 / 1,
                    child: Image.network(
                      listBuku[index].coverBuku ?? "",
                      width: 180,
                      height: 180,
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet(
                      context: context, 
                      builder: (context) {
                        return Image.network(
                          listBuku[index].coverBuku ?? "",
                        );
                      },);
                  },),
            DataCell(Text("${listBuku[index].judul}",
                style: GoogleFonts.urbanist(
                    fontSize: 15, fontWeight: FontWeight.w500))),
            DataCell(Text(
                "${categories.firstWhere((cat) => cat.id == listBuku[index].kategoriId).namaKategori}",
                style: GoogleFonts.urbanist(
                    fontSize: 15, fontWeight: FontWeight.w500))),
            DataCell(Text("${listBuku[index].penulis}",
                style: GoogleFonts.urbanist(
                    fontSize: 15, fontWeight: FontWeight.w500))),
            DataCell(Text("${listBuku[index].penerbit}",
                style: GoogleFonts.urbanist(
                    fontSize: 15, fontWeight: FontWeight.w500))),
            DataCell(Text("${listBuku[index].jumlah}",
                style: GoogleFonts.urbanist(
                    fontSize: 15, fontWeight: FontWeight.w500))),
            DataCell(Text("${listBuku[index].tahunTerbit}",
                style: GoogleFonts.urbanist(
                    fontSize: 15, fontWeight: FontWeight.w500))),
            DataCell(ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width / 1.5,
                      maxHeight: MediaQuery.of(context).size.height / 2,
                    ),
                    barrierColor: Colors.black54,
                    isScrollControlled: true,
                    useSafeArea: true,
                    context: context,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    builder: (context) {
                      return Column(children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: 1,
                          itemBuilder: (context, index) => Container(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding:
                                      const EdgeInsets.only(top: 16, left: 16),
                                  child: Text(
                                      "Sinopsis buku ${listBuku[index].judul}"),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, right: 10),
                                  child: IconButton(
                                      onPressed: () => Get.back(),
                                      icon: const Icon(Icons.close_rounded)),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 2.35,
                          child: Padding(
                            padding: const EdgeInsets.all(30),
                            child: SingleChildScrollView(
                              child: Text(
                                "${listBuku[index].sinopsis}",
                                style: GoogleFonts.urbanist(fontSize: 17),
                              ),
                            ),
                          ),
                        ),
                      ]);
                    },
                  );
                },
                child: const Text('Tampilkan'))),
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
