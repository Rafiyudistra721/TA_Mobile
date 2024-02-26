import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ta_mobile/app/integrations/firestore.dart';
import '../controllers/koleksi_controller.dart';

class KoleksiView extends GetView<KoleksiController> {
  const KoleksiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.red,
        onPressed: () {},
        label: const Text(
          'Simpan Buku Kesukaan Anda!',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      appBar: AppBar(
        title: Text(
          'KOLEKSI',
          style: GoogleFonts.alata(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5, // Example itemCount
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
                      color: (Get.isDarkMode) ? Colors.grey.shade800 : Colors.white,
                    ),
                    height: 140,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: ListTile(
                      leading: Transform.scale(
                        scale: 1.6,
                        child: Hero(
                          tag: 'product_image_$i',
                          child: Transform.translate(
                            offset: const Offset(3, 10),
                            child: Image.asset(
                              'assets/test.jpg', // Example image path
                            ),
                          ),
                        ),
                      ),
                      isThreeLine: true,
                      title: Padding(
                        padding: const EdgeInsets.only(left: 10, top: 8.0),
                        child: Text(
                          'BUKU 1', // Example product name
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 20,
                            width: 50,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
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
                          Text(
                            'Price', // Example price
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 3),
                    child: Text(
                      'Total Amount : \$100', // Example total amount
                      style: GoogleFonts.alata(
                        letterSpacing: 1,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                    child: Text(
                      'Total Quantity : 3', // Example total quantity
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
          ],
        ),
      ),
    );
  }
}
    