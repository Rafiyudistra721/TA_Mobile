import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/modules/koleksi/controllers/koleksi_controller.dart';
import 'package:ta_mobile/app/routes/app_pages.dart';
import 'package:ta_mobile/app/widgets/AppBar.dart';

class WebScreen extends GetView<KoleksiController> {
  const WebScreen({Key? key}) : super(key: key);
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
         body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                30.height,
                Expanded(
                  flex: 12,
                  child: Column(
                    children: [
                      Obx(() {
                        if (controller.allBook.isEmpty) {
                          return const CircularProgressIndicator();
                        } else {
                          final filteredBooks =
                              controller.selectedCategory.isEmpty
                                  ? controller.allBook
                                  : controller.allBook
                                      .where((book) =>
                                          book.kategoriId ==
                                          controller.selectedCategory.value)
                                      .toList();

                          return SizedBox(
                            height: 720,
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 6),
                              itemCount: filteredBooks.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                final book = filteredBooks[index];
                                return GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.DETAIL_BUKU,
                                        arguments: book);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Hero(
                                            tag: book.id!,
                                            child: Image.network(
                                              book.coverBuku!,
                                              height: 210,
                                              width: 150,
                                              fit: BoxFit.cover,
                                            )),
                                        10.height,
                                        Text(
                                          book.judul!,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        5.height,
                                        Text(
                                          "${controller.categories.firstWhere((cat) => cat.id == book.kategoriId).namaKategori}",
                                          style: const TextStyle(
                                              color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      })
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      );
}
}