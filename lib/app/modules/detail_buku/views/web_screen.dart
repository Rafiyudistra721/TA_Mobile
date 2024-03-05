import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/data/Models/buku_model.dart';
import 'package:get/get.dart';
import 'package:ta_mobile/app/data/Models/ulasan_model.dart';
import 'package:ta_mobile/app/modules/Manage_Ulasan/controllers/manage_ulasan_controller.dart';
import 'package:ta_mobile/app/modules/auth/controllers/auth_controller.dart';

import 'package:ta_mobile/app/widgets/AppBar.dart';
import 'package:ta_mobile/app/widgets/footerweb.dart';
import '../controllers/detail_buku_controller.dart';

class Web_Screen extends GetView<DetailBukuController> {
  final AuthController authController = Get.put(AuthController());
  final streamUser = Get.put(ManageUlasanController());
  Web_Screen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _ulasanKey = GlobalKey();
  UlasanModel ulasanModel = UlasanModel();

  BukuModel bukuModel = Get.arguments ?? BukuModel();

  @override
  Widget build(BuildContext context) {
    controller.modelToController(bukuModel);
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 255, 255, 255), // Updated to blue color
      appBar: appBar,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 30),
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  40.height,
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Image.network(
                        bukuModel.coverBuku!,
                        height: defaultInkWellRadius,
                        width: 500,
                        fit: BoxFit.scaleDown,
                      ),

                      const SizedBox(width: 40), // Add spacing
                      // Text on the right
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              bukuModel.judul!,
                              style: const TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'urbanist'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Obx(
                                () {
                                  final category = controller.categories
                                      .firstWhereOrNull((cat) =>
                                          cat.id == bukuModel.kategoriId);
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
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ReadMoreText(
                                bukuModel.sinopsis!,
                                trimLines: 6,
                                colorClickableText: Colors.blue,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: 'Selengkapnya',
                                trimExpandedText: 'Sembunyikan',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 22,
                                  wordSpacing: 1.4,
                                ),
                              ),
                            ),
                            const SizedBox(
                                height: 30), // Add spacing between texts
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Penulis: ',
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'urbanist',
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        '${bukuModel.penulis}', // Access and display penulis property
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight
                                          .normal, // Adjust weight if needed
                                      fontFamily: 'urbanist',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                                height: 10), // Add spacing between texts
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Penerbit: ',
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'urbanist',
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        '${bukuModel.penerbit}', // Access and display penulis property
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight
                                          .normal, // Adjust weight if needed
                                      fontFamily: 'urbanist',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                                height: 10), // Add spacing between texts
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Tahun Terbit: ',
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'urbanist',
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        '${bukuModel.tahunTerbit}', // Access and display penulis property
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight
                                          .normal, // Adjust weight if needed
                                      fontFamily: 'urbanist',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Stok: ',
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'urbanist',
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        '${bukuModel.jumlah}', // Access and display penulis property
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight
                                          .normal, // Adjust weight if needed
                                      fontFamily: 'urbanist',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  50.height,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 50),
                              child: Text(
                                'Ulasan',
                                style: const TextStyle(
                                    fontSize: 42,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'urbanist'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Obx(() => DataTable(
                          columnSpacing:
                              MediaQuery.of(context).size.width * .35,
                          columns: const [
                            DataColumn(
                                label: Text(
                              'Pengguna',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFB9C4C9)),
                            )),
                            DataColumn(
                                label: Text(
                              'Ulasan',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFB9C4C9)),
                            )),
                            DataColumn(
                                label: Text(
                              'Rating',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFB9C4C9)),
                            )),
                          ],
                          rows: controller.listUlasan.map((comment) {
                            final user = streamUser.users.firstWhereOrNull(
                                (cat) => cat.id == comment.userId);
                            return DataRow(cells: [
                              DataCell(Text(user != null
                                  ? user.username!
                                  : 'Tidak Ditemukan')),
                              DataCell(Text(comment.ulasan ?? '')),
                              DataCell(RatingBarIndicator(
                                rating: comment.rating!.toDouble(),
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
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            border: Border.all(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                width: 1.0),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        )),
                  ),
                  50.height,
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
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
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
                          padding: const EdgeInsets.symmetric(horizontal: 170),
                          child: AppTextField(
                            textFieldType: TextFieldType.MULTILINE,
                            decoration: InputDecoration(
                              labelText: "Ulasan",
                              hintText:
                                  "Isilah dengan ulasanmu mengenai buku ini",
                            ),
                            controller: controller.ulasanC,
                            validator: (value) => value.isEmptyOrNull
                                ? "Isilah ulasanmu terlebih dahulu"
                                : null,
                          ),
                        ),
                        30.height,
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 20),
                          child: SizedBox(
                            width: 170,
                            child: FloatingActionButton.extended(
                                onPressed: controller.isSaving
                                    ? null
                                    : () {
                                        if (_ulasanKey.currentState!
                                            .validate()) {
                                          controller.store(ulasanModel,
                                              bukuModel, authController);
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
                      ],
                    ),
                  ),FooterWeb()
                ],
              ),
            ),
          ))
        ], 
      ), 
    );
  }
}
