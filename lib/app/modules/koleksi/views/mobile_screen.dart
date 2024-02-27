import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import '../controllers/koleksi_controller.dart';
import 'package:ta_mobile/app/widgets/navbottombar.dart';

class MobileScreen extends GetView<KoleksiController> {
  const MobileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(
        initialindex: 1,
      ),
      appBar: AppBar(
        title: Text(
          'KOLEKSI',
          style: GoogleFonts.urbanist(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 5 * (140 + 20) +
                        20, // Adjust the height based on the number of items
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3, // Example itemCount
                      padding: const EdgeInsets.all(20),
                      itemBuilder: (context, i) {
                        return GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: (Get.isDarkMode)
                                      ? Colors.grey.shade900
                                      : Colors.grey.shade300,
                                  offset: const Offset(1, 2),
                                  blurRadius: 8,
                                )
                              ],
                              borderRadius: BorderRadius.circular(30),
                              color: (Get.isDarkMode)
                                  ? Colors.grey.shade800
                                  : Colors.white,
                            ),
                            child: Stack(
                              children: [
                                ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: Transform.scale(
                                    scale: 1.6,
                                    child: Hero(
                                      tag: 'product_image_$i',
                                      child: Transform.translate(
                                        offset: const Offset(5, 10),
                                        child: Image.asset(
                                          'assets/test.jpg', // Example image path
                                        ),
                                      ),
                                    ),
                                  ),
                                  isThreeLine: true,
                                  title: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 8.0),
                                    child: Text(
                                      'BUKU 1', // Example product name
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 0,
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4.0, horizontal: 10),
                                            child: Text(
                                              'Fiksi', // Example category
                                              style: const TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w700,
                                                letterSpacing: 2,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          const Spacer(),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          IconButton(
                                            color: Colors.grey,
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.remove,
                                              size: 25,
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.grey.shade400,
                                            ),
                                            child: Text(
                                              '1', // Example quantity
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            color: Colors.grey,
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.add,
                                              size: 25,
                                            ),
                                          ),
                                          const SizedBox(width: 160 - 76),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: SizedBox(
                                    height: 20,
                                    width: 100,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          Colors.red.shade500,
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        'PINJAM',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  right: 10,
                                  child: SizedBox(
                                    height: 20,
                                    width: 50,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          Colors.red.shade500,
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: const Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 3),
                          child: Text(
                            'Jumlah Buku : 3', // Example total amount
                            style: GoogleFonts.alata(
                              letterSpacing: 1,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 8),
                          child: Text(
                            'Jumlah Buku Di Pinjam : 2', // Example total quantity
                            style: GoogleFonts.alata(
                              letterSpacing: 1,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 2, // Example itemCount
                    padding: const EdgeInsets.all(20),
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: (Get.isDarkMode)
                                    ? Colors.grey.shade900
                                    : Colors.grey.shade300,
                                offset: const Offset(1, 2),
                                blurRadius: 8,
                              )
                            ],
                            borderRadius: BorderRadius.circular(30),
                            color: (Get.isDarkMode)
                                ? Colors.grey.shade800
                                : Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, top: 8.0, right: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'BUKU 1', // Example product name
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 0,
                                        fontSize: 22,
                                      ),
                                    ),
                                    Text(
                                      'Start Date: 01/01/2024', // Example start date
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, top: 8.0, right: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Fiksi', // Example category
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 2,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      'End Date: 01/02/2024', // Example end date
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 8.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey.shade400,
                                  ),
                                  child: Text(
                                    '1', // Example quantity
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 80,
                                    width: 80,
                                    child: Hero(
                                      tag: 'product_image_$i',
                                      child: Image.asset(
                                        'assets/test.jpg', // Example image path
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: SizedBox(
                                    height: 40,
                                    width: 150,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          Colors.red.shade500,
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        'KEMBALIKAN',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
