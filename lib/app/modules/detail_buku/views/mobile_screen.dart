// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/data/Models/buku_model.dart';
import 'package:get/get.dart';
import 'package:ta_mobile/app/data/Models/koleksi_model.dart';
import 'package:ta_mobile/app/data/Models/ulasan_model.dart';
import 'package:ta_mobile/app/modules/Manage_Ulasan/controllers/manage_ulasan_controller.dart';
import 'package:ta_mobile/app/modules/auth/controllers/auth_controller.dart';
import 'package:ta_mobile/app/routes/app_pages.dart';

import '../controllers/detail_buku_controller.dart';

class Mobile_Screen extends GetView<DetailBukuController> {
  final AuthController authController = Get.put(AuthController());
  final streamUser = Get.put(ManageUlasanController());
  Mobile_Screen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _ulasanKey = GlobalKey();
  UlasanModel ulasanModel = UlasanModel();
  KoleksiModel  koleksiModel = KoleksiModel();

  BukuModel bukuModel = Get.arguments ?? BukuModel();

  @override
  Widget build(BuildContext context) {
    controller.modelToController(bukuModel);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Buku'),
        actions: [
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(Routes.KOLEKSI);
            },
            child: const Icon(
              Icons.shopping_basket_outlined,
              color: Colors.grey,
            ),
          ),
          const SizedBox(width: 6),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          controller.storeToBookmark(koleksiModel, bukuModel, authController);
          
        },
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      bukuModel.judul!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: const TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 25),
                    ),
                  ),
                  Text(
                    "Stok: ${bukuModel.jumlah}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Obx(
                () {
                  final category = controller.categories.firstWhereOrNull(
                      (cat) => cat.id == bukuModel.kategoriId);
                  return Text(
                    category != null
                        ? category.namaKategori!
                        : 'Unknown Category',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
            20.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ReadMoreText(
                bukuModel.sinopsis!,
                trimLines: 3,
                colorClickableText: Colors.blue,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Selengkapnya',
                trimExpandedText: 'Sembunyikan',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  wordSpacing: 1.4,
                ),
              ),
            ),
            40.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text('Penulis            : ${bukuModel.penulis}',
                  style: const TextStyle(fontSize: 15)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text('Penerbit          : ${bukuModel.penerbit}',
                  style: const TextStyle(fontSize: 15)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text('Tahun Terbit  : ${bukuModel.tahunTerbit}',
                  style: const TextStyle(fontSize: 15)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Jumlah            : ${bukuModel.jumlah}',
                style: const TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Obx(
                () {
                  final category = controller.categories.firstWhereOrNull(
                      (cat) => cat.id == bukuModel.kategoriId);
                  return Text(
                    'Kategori          : ${category != null ? category.namaKategori! : 'Unknown Category'}',
                    style: const TextStyle(fontSize: 15),
                  );
                },
              ),
            ),
            20.height,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Ulasan',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Obx(() => DataTable(
                    columns: const [
                      DataColumn(
                          label: Text(
                        'Pengguna',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      )),
                      DataColumn(
                          label: Text(
                        'Ulasan',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      )),
                      DataColumn(
                          label: Text(
                        'Rating',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      )),
                    ],
                    rows: controller.listUlasan.map((comment) {
                      final user = streamUser.users
                          .firstWhereOrNull((cat) => cat.id == comment.userId);
                      return DataRow(cells: [
                        DataCell(Text(
                            user != null ? user.username! : 'Tidak Ditemukan')),
                        DataCell(Text(comment.ulasan ?? '')),
                        DataCell(RatingBarIndicator(
                          rating: comment.rating!,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 20,
                          direction: Axis.horizontal,
                        )),
                      ]);
                    }).toList(),
                  )),
            ),
            20.height,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Berikan Ulasanmu di sini',
                style: TextStyle(fontSize: 17),
              ),
            ),
            Form(
              key: _ulasanKey,
              child: Column(
                children: [
                  RatingBar.builder(
                    initialRating: 0,
                    allowHalfRating: true,
                    minRating: 1,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemSize: 28,
                    glowColor: Colors.yellow[700]!.withOpacity(.9),
                    onRatingUpdate: (v) {
                      controller.ratingValue = v;
                    },
                    itemBuilder: (context, _) {
                      return const Icon(Icons.star, color: Colors.amber);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: AppTextField(
                      textFieldType: TextFieldType.MULTILINE,
                      decoration: const InputDecoration(
                        labelText: "Ulasan",
                        hintText: "Isilah dengan ulasanmu mengenai buku ini",
                      ),
                      controller: controller.ulasanC,
                      validator: (value) => value.isEmptyOrNull
                          ? "Isilah ulasanmu terlebih dahulu"
                          : null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: SizedBox(
                      width: 116,
                      child: FloatingActionButton.extended(
                          onPressed: controller.isSaving
                              ? null
                              : () {
                                  if (_ulasanKey.currentState!.validate()) {
                                    controller.store(
                                        ulasanModel, bukuModel, authController);
                                  }
                                },
                          label: controller.isSaving
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  "Simpan",
                                  // style: TextStyle(color: Colors.white),
                                )),
                    ),
                  ),
                  150.height
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
