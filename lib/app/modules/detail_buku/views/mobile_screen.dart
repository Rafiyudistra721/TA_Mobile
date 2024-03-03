import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/data/Models/buku_model.dart';
import 'package:ta_mobile/app/integrations/firestore.dart';
import 'package:get/get.dart';
import 'package:ta_mobile/app/routes/app_pages.dart';

import '../controllers/detail_buku_controller.dart';

class Mobile_Screen extends GetView<DetailBukuController> {
  Mobile_Screen({Key? key}) : super(key: key);

  BukuModel bukuModel = Get.arguments ?? BukuModel();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: const Color(0xFF52958B),
      appBar: AppBar(
        leadingWidth: 100,
        title: const Text('Detail Buku'),
        leading: Padding(
          padding: const EdgeInsets.only(left: 22, top: 10, bottom: 10, right: 20),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.grey,
            ),
          ),
        ),
        elevation: 0,
        bottomOpacity: 0.0,
        actions: [
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.only(left: 26, top: 10, bottom: 10, right: 22),
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.KOLEKSI);
              },
              child: const Icon(
                Icons.shopping_basket_outlined,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(width: 6),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Container(
          alignment: Alignment.center,
          height: 70,
          child: const Text(
            'Tambah Ke Koleksi',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: AspectRatio(
                  aspectRatio: 1.0 / 1,
                  child: Image.network(
                    bukuModel.coverBuku!,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                    child: Text(
                      bukuModel.judul!,
                      overflow: TextOverflow.clip,
                      maxLines: 3,
                      style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                    ),
                  ),
                  Spacer(),
                  Text(
                    '${bukuModel.jumlah}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 33,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Obx(
                () {
                  final category = controller.categories.firstWhereOrNull((cat) => cat.id == bukuModel.kategoriId);
                  return Text(
                    category != null ? category.namaKategori! : 'Unknown Category',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                bukuModel.sinopsis!,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  wordSpacing: 1.4,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: controller.allUlasan.isNotEmpty
                  ? Container(
                      color: Colors.white,
                      child: Obx(
                        () => DataTable(
                          columns: const [
                            DataColumn(
                              label: Text(
                                'Username',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Comments',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Rating',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                          rows: controller.allUlasan.map((comment) {
                            return DataRow(cells: [
                              DataCell(Text(comment.userId ?? 'No Username')),
                              DataCell(Text(comment.ulasan ?? 'No Comment')),
                              DataCell(Text(comment.rating?.toString() ?? 'No Rating')),
                            ]);
                          }).toList(),
                        ),
                      ),
                    )
                  : const SizedBox(), // Placeholder
            ),
            if (controller.allUlasan.isEmpty)
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  color: Colors.white,
                  child: DataTable(
                    columns: const [
                      DataColumn(
                        label: Text(
                          'Username',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Comments',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Rating',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(const Text('No data')),
                        DataCell(const Text('No data')),
                        DataCell(const Text('No data')),
                      ])
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}