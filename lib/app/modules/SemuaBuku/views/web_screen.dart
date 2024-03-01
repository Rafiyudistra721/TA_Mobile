import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/routes/app_pages.dart';
import '../controllers/semua_buku_controller.dart';
import 'package:ta_mobile/app/widgets/AppBar.dart';

class WebScreen extends GetView<SemuaBukuController> {
  const WebScreen({Key? key}) : super(key: key);
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
         body: Column(
        children: [
          Expanded(
            flex: 20,
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() {
                          if (controller.categories.isEmpty) {
                            return const CircularProgressIndicator();
                          } else {
                            return SizedBox(
                              height: 70,
                              width: double.infinity,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.categories.length,
                                itemBuilder: (context, index) {
                                  var category = controller.categories[index];
                                  var isActive = category.id! ==
                                      controller.selectedCategory.value;
                                  var isActiveValue = isActive.obs;
                                  return Hero(
                                      tag: 'category_${category.id}',
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal:8.0),
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            controller.changeCategory(
                                                temp: category.id!);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            elevation:
                                                isActiveValue.value ? 6 : 0,
                                            backgroundColor: isActiveValue.value
                                                ? Colors.red
                                                : controller.darkModeValue.value
                                                    ? Colors.white
                                                    : Color.fromARGB(255, 25, 97, 192),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Text(
                                              category.namaKategori!,
                                              style: TextStyle(
                                                color: isActiveValue.value
                                                    ? Colors.white
                                                    : controller
                                                            .darkModeValue.value
                                                        ? Colors.white
                                                        : Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ));
                                },
                              ),
                            );
                          }
                        })
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 35.0, right: 30),
                        child: Row(
                          children: [
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed('viewScreen');
                              },
                              child: Text(
                                'Lihat Semua ▶',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF3C19C0),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Obx(() {
                        if (controller.allBooks.isEmpty) {
                          return const CircularProgressIndicator();
                        } else {
                          final filteredBooks =
                              controller.selectedCategory.isEmpty
                                  ? controller.allBooks
                                  : controller.allBooks
                                      .where((book) =>
                                          book.kategoriId ==
                                          controller.selectedCategory.value)
                                      .toList();

                          return SizedBox(
                            height: 360,
                            width: double.infinity,
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
                                              height: 170,
                                              width: 120,
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