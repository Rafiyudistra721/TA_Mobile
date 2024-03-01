import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/modules/auth/controllers/auth_controller.dart';
import 'package:ta_mobile/app/routes/app_pages.dart';
import 'package:ta_mobile/app/widgets/navbottombar.dart';

import '../controllers/home_controller.dart';

class MobileScreen extends GetView<HomeController> {
  final authC = Get.put(AuthController());
  MobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(
        initialindex: 0,
      ),
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
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              width: 33.0, // Use double value for width
              child: Obx(
                () => Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: controller.darkModeValue.value
                        ? Colors.grey.shade600
                        : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(
                        100.0), // Use double value for radius
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
                ),
              ),
            ),
          ),
        ],
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Obx(() => Text(
                  'SmartLib',
                  style: GoogleFonts.urbanist(
                    color: (controller.darkModeValue.value)
                        ? Color(0xFF52958B)
                        : Color(0xFF004D47),
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
            flex: 20,
            child: Column(
              children: [
                Expanded(
                  flex: 6,
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
                      Image.asset('assets/stocks/1.png'),
                      Image.asset('assets/stocks/2.png'),
                      Image.asset('assets/stocks/3.png'),
                    ].map((item) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Padding(
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
                                color: Color(0xFF52958B)
                              ),
                              child: item,
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Kategori',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 22,
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
                                    child: SizedBox(
                                      width: 200, // Adjust the width as needed
                                      height: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          controller.changeCategory(
                                              temp: category.id!);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          elevation:
                                              isActiveValue.value ? 6 : 0,
                                          backgroundColor: Color(0xFF52958B),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            category.namaKategori!,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,

                                            ),
                                          ),
                                        ),
                                      ),
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
                Expanded(
                  flex: 8,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 35.0, right: 30),
                        child: Row(
                          children: [
                            Obx(() => Text(
                                  'Daftar Buku ',
                                  style: TextStyle(
                                    fontSize: 20,
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
                                'Lihat Semua ',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
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
                            height: 370, // Adjust the height of each container
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 20,
                              ),
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
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
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
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    book.coverBuku!),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            book.judul!,
                                            textAlign: TextAlign.center,
                                            maxLines: 2, // Limit to 2 lines
                                            overflow: TextOverflow
                                                .ellipsis, // Add ellipsis for overflow
                                            style: const TextStyle(
                                              fontSize:
                                                  16, // Decreased font size
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            "${controller.categories.firstWhere((cat) => cat.id == book.kategoriId).namaKategori}",
                                            textAlign: TextAlign.center,
                                            maxLines: 1, // Limit to 1 line
                                            overflow: TextOverflow
                                                .ellipsis, // Add ellipsis for overflow
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors
                                                    .grey), // Decreased font size
                                          ),
                                        ),
                                        SizedBox(
                                            height:
                                                10), // Increased space below the text widgets
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
