import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ta_mobile/app/integrations/firestore.dart';
import 'package:get/get.dart';
import 'package:ta_mobile/app/routes/app_pages.dart';

import '../controllers/detail_buku_controller.dart';

class DetailBukuView extends GetView<DetailBukuController> {
  const DetailBukuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          (Get.isDarkMode) ? Colors.red.shade200 : Colors.red.shade100,
      appBar: AppBar(
        leadingWidth: 100,
        leading: Padding(
          padding:
              const EdgeInsets.only(left: 22, top: 10, bottom: 10, right: 20),
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
        foregroundColor:
            (Get.isDarkMode) ? Colors.red.shade200 : Colors.red.shade100,
        backgroundColor:
            (Get.isDarkMode) ? Colors.red.shade200 : Colors.red.shade100,
        elevation: 0,
        bottomOpacity: 0.0,
        scrolledUnderElevation: 0,
        actions: [
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 26, top: 10, bottom: 10, right: 22),
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
          const SizedBox(
            width: 6,
          )
        ],
      ),
      body: Column(
        children: [
          const Expanded(
            flex: 2,
            child: SizedBox(),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: (Get.isDarkMode) ? Colors.grey.shade900 : Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(-2, -3),
                      blurRadius: 12)
                ],
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        height: 80,
                      ),
                      const Spacer(
                        flex: 8,
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'BUKU 1',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 33),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                '',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              'STOK : 1 ',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 33,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          'Fiksi',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Divider(
                          thickness: 1.7,
                          color: Colors.grey.shade200,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '⭐️ 5.4',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 40),
                        child: Text(
                          'Deskripsi',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 22,
                            wordSpacing: 1.4,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: StreamBuilder(
                          stream: firebaseFirestore
                              .collection("cartProduct")
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    Colors.red.shade500,
                                  ),
                                ),
                                onPressed: () {
                                  ;
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 70,
                                  width: double.infinity,
                                  child: const Text(
                                    'Tambah Ke Koleksi',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              );
                            } else if (snapshot.hasData) {
                              QuerySnapshot<Map<String, dynamic>>? favourite =
                                  snapshot.data;
                              List<QueryDocumentSnapshot<Map<String, dynamic>>>
                                  allFav = favourite!.docs;
                              if (allFav.isNotEmpty) {
                                int check = 0;
                                for (var f in allFav) {
                                  if (f['name'] == 'e.name') {
                                    check = 1;
                                  }
                                }
                                if (check == 0) {
                                  return ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Colors.red.shade500,
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 70,
                                      width: double.infinity,
                                      child: const Text(
                                        'Tambah Ke Koleksi',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Colors.grey.shade500,
                                      ),
                                    ),
                                    onPressed: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          backgroundColor: Colors.red,
                                          duration: Duration(seconds: 1),
                                          behavior: SnackBarBehavior.floating,
                                          content: Text(
                                            'Product Already addaed to cart',
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 70,
                                      width: double.infinity,
                                      child: const Text(
                                        'Tambah Ke Koleksi',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              } else {
                                return ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      Colors.red.shade500,
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 70,
                                    width: double.infinity,
                                    child: const Text(
                                      'Tambah Ke Koleksi',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                );
                              }
                            }
                            return ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.red.shade500,
                                ),
                              ),
                              onPressed: () {
                                Get.toNamed(Routes.KOLEKSI);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 70,
                                width: double.infinity,
                                child: const Text(
                                  'Tambah Ke Koleksi',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  Transform.translate(
                    offset: const Offset(0, -150),
                    child: Transform.scale(
                      scale: 0.6,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Hero(
                          tag: '',
                          child: Transform.translate(
                            offset: const Offset(0, -250),
                            child: Image.asset('assets/test.jpg'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
