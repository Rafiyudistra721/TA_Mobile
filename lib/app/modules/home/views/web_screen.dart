import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';
import 'package:ta_mobile/app/widgets/AppBar.dart';

class WebScreen extends GetView<HomeController> {
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
                  flex: 8,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 42 / 8,
                      enlargeCenterPage: true,
                      pauseAutoPlayOnManualNavigate: true,
                      autoPlay: true,
                      viewportFraction: 0.8,
                      autoPlayInterval: const Duration(seconds: 4),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 1000),
                      autoPlayCurve: Curves.fastOutSlowIn,
                    ),
                    items: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 20,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: (controller.darkModeValue.value)
                                    ? Colors.grey.shade900
                                    : Colors.grey.shade900,
                                blurRadius: 14,
                                offset: const Offset(2, 3),
                              )
                            ],
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.amber.shade200,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18.0),
                                      child: Text(
                                        'Website Paling Aman Untuk Meminjam Buku',
                                        style: TextStyle(
                                          fontSize: 28,
                                          wordSpacing: 3,
                                          height: 3,
                                          letterSpacing: -0.7,
                                          color: Colors.grey.shade900,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    10.height,
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.red),
                                          ),
                                          child: const Text(
                                            'Pinjam Sekarang',
                                            style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Transform.scale(
                                  scale: 1,
                                  child: Image.asset(
                                    'assets/stocks/1.png',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5.0,
                          vertical: 20,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade900,
                                blurRadius: 14,
                                offset: const Offset(2, 3),
                              )
                            ],
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.green.shade100,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18.0),
                                      child: Text(
                                        'Website Dengan Akselerasi Cepat.',
                                        style: TextStyle(
                                          fontSize: 28,
                                          wordSpacing: 3,
                                          height: 3,
                                          letterSpacing: -0.7,
                                          color: Colors.grey.shade900,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    10.height,
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.red),
                                          ),
                                          child: const Text(
                                            'Pinjam Sekarang',
                                            style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Transform.scale(
                                  scale: 1,
                                  child: Image.asset('assets/stocks/2.png'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5.0,
                          vertical: 20,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade900,
                                blurRadius: 14,
                                offset: const Offset(2, 3),
                              )
                            ],
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.red.shade200,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18.0),
                                      child: Text(
                                        'Paling Terpercaya Untuk Meminjam Buku.',
                                        style: TextStyle(
                                          fontSize: 28,
                                          wordSpacing: 3,
                                          height: 3,
                                          letterSpacing: -0.7,
                                          color: Colors.grey.shade900,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    10.height,
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.red),
                                          ),
                                          child: const Text(
                                            'Pinjam Sekarang',
                                            style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Transform.scale(
                                  scale: 1,
                                  child: Image.asset(
                                    'assets/stocks/3.png',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          textAlign: TextAlign.start,
                          'Genre Buku',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Obx(() {
                        if (controller.categories.isEmpty) {
                          return const CircularProgressIndicator();
                        } else {
                          return SizedBox(
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 400),
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
                                            vertical: 8.0, horizontal: 8.0),
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
                                                  : Color.fromARGB(255, 255, 255, 255),
                                        ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4),
                                            child: Text(
                                              category.namaKategori!,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
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
                            ),
                          );
                        }
                      })
                    ],
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
                                Get.offNamed(Routes.SEMUA_BUKU);
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
                            height: 320,
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
                                              
                                              // height: 200,
                                              // width: 160,
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
