import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_mobile/app/modules/auth/controllers/auth_controller.dart';
import '../controllers/koleksi_controller.dart';
import 'package:ta_mobile/app/widgets/navbottombar.dart';

class MobileScreen extends GetView<KoleksiController> {
  final userStream = Get.put(AuthController());
  MobileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.modelToController(userStream.user);
    return Scaffold(
      bottomNavigationBar: BottomNav(
        initialindex: 1,
      ),
      appBar: AppBar(
        title: const Text(
          'KOLEKSI',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 4),
                          child: Text(
                            'Jumlah Buku : 3',
                            style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              print(controller.listKoleksi.length);
                            },
                            child: Text('data')),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 4),
                          child: Text(
                            'Jumlah Buku Di Pinjam : 2',
                            style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.listKoleksi.length,
                    padding: const EdgeInsets.all(20),
                    itemBuilder: (context, index) {
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
                                      "${controller.allBook.firstWhere((vari) => vari.id == controller.listKoleksi[index].bukuId).judul}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 0,
                                        fontSize: 17,
                                      ),
                                    ),
                                    const Text(
                                      'Start Date: 01/01/2024',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10, top: 8.0, right: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("e",
                                      // "${controller.categories.firstWhere((element) => )}",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 2,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      'End Date: 01/02/2024',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Center(
                              //   child: Padding(
                              //     padding: const EdgeInsets.all(8.0),
                              //     child: SizedBox(
                              //       height: 80,
                              //       width: 80,
                              //       child: Hero(
                              //         tag: 'product_image_$index',
                              //         child: Image.network(
                              //           controller.,
                              //           fit: BoxFit.cover,
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),
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
          ),
        ],
      ),
    );
  }
}
