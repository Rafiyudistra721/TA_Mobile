import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/modules/auth/controllers/auth_controller.dart';
import 'package:ta_mobile/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final authC = Get.put(AuthController());
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              width: 33,
              child: Obx(() => Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: (controller.darkModeValue.value)
                          ? Colors.grey.shade600
                          : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () {
                        authC.logout();
                      },
                      icon: const Icon(
                        Icons.logout,
                        size: 18,
                      ),
                    ),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              width: 33,
              child: Obx(() => Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: (controller.darkModeValue.value)
                          ? Colors.grey.shade600
                          : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () {
                        controller.toggleTheme();
                      },
                      icon: Icon(
                        (controller.darkModeValue.value)
                            ? Icons.wb_sunny_rounded
                            : Icons.nightlight_round,
                        size: 18,
                        color: Colors.grey,
                      ),
                    ),
                  )),
            ),
          ),
          8.width,
        ],
        centerTitle: false,
        title: Row(
          children: [
            Obx(() => Text(
                  'SmartLib',
                  style: GoogleFonts.urbanist(
                    color: (controller.darkModeValue.value)
                        ? Colors.red.shade200
                        : Colors.red.shade800,
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                  ),
                )),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Selamat Datang',
                  style: GoogleFonts.alata(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 20,
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: CarouselSlider(
                    options: CarouselOptions(
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
                          horizontal: 5.0,
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
                                        'The Fastest in Delivery Books.',
                                        style: TextStyle(
                                          fontSize: 17,
                                          wordSpacing: 2.5,
                                          height: 1.4,
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
                                              fontSize: 12,
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
                                        'The Safest way to deliver Books.',
                                        style: TextStyle(
                                          fontSize: 15,
                                          wordSpacing: 2.5,
                                          height: 1.4,
                                          letterSpacing: -0.7,
                                          color: Colors.grey.shade900,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    10.height,
                                    Align(
                                      alignment: Alignment.centerLeft,
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
                                              fontSize: 12,
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
                                        'The Trusted way to order books.',
                                        style: TextStyle(
                                          fontSize: 17,
                                          wordSpacing: 2.5,
                                          height: 1.4,
                                          letterSpacing: -0.7,
                                          color: Colors.grey.shade900,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    10.height,
                                    Align(
                                      alignment: Alignment.centerLeft,
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
                                              fontSize: 12,
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
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Kategori',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
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
                                          vertical: 8.0, horizontal: 5.0),
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
                                                  ? Colors.grey.shade700
                                                  : Colors.green,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            category.namaKategori!,
                                            style: TextStyle(
                                              color: isActiveValue.value
                                                  ? Colors.white
                                                  : controller
                                                          .darkModeValue.value
                                                      ? Colors.white
                                                      : Colors.grey.shade800,
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
                Expanded(
                  flex: 8,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 35.0, right: 30),
                        child: Row(
                          children: [
                            Obx(() => Text(
                                  'Lagi Populer',
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w800,
                                    color: (controller.darkModeValue.value)
                                        ? Colors.white
                                        : Colors.grey.shade900,
                                  ),
                                )),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed('viewScreen');
                              },
                              child: Text(
                                'Lihat Semua ▶',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.amber.shade500,
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
                            height: 300,
                            width: double.infinity,
                            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
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
                                    padding: const EdgeInsets.all(20),
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
                                          book.kategoriId!,
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

