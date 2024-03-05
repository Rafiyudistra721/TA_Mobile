import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_mobile/app/data/Models/pinjam_model.dart';
import 'package:ta_mobile/app/modules/auth/controllers/auth_controller.dart';
import 'package:ta_mobile/app/widgets/footerweb.dart';
import '../controllers/koleksi_controller.dart';
import 'package:ta_mobile/app/widgets/AppBar.dart';

class WebScreen extends GetView<KoleksiController> {
  final userStream = Get.put(AuthController());
  PinjamModel pinjamModel = PinjamModel();

  WebScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 4),
                          child: Obx(() => Text(
                                'Jumlah Buku : ${controller.listKoleksi.length}',
                                style: const TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Obx(() => GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4, // 2 columns
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: controller.listKoleksi.length,
                        padding: const EdgeInsets.all(20),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 4 -
                                  60, // Make each container take half of the screen width
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(30),
                                      child: Text(
                                        "${controller.allBook.firstWhere((vari) => vari.id == controller.listKoleksi[index].bukuId).judul}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 0,
                                          fontSize: 25,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.all(8.0),
                                        child: AspectRatio(
                                          aspectRatio: 2.9 / 1,
                                          child: Image.network(
                                            controller.allBook
                                                .firstWhere((element) =>
                                                    element.id ==
                                                    controller
                                                        .listKoleksi[index]
                                                        .bukuId)
                                                .coverBuku!,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20),
                                        child: SizedBox(
                                          height: 40,
                                          width: 150,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                Colors.green.shade500,
                                              ),
                                            ),
                                            onPressed: () {
                                              Get.defaultDialog(
                                                title: "Pinjam Buku Ini?",
                                                middleText:
                                                    "Apakah anda yakin ingin meminjam buku ini?",
                                                onConfirm: () async {
                                                  await controller.store(
                                                      pinjamModel,
                                                      controller
                                                          .listKoleksi[index],
                                                      userStream.user);
                                                },
                                                onCancel: () => Get.back(),
                                              );
                                            },
                                            child: const Text(
                                              'PINJAM',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )),
                ],
              ),
            ),
          ),FooterWeb()
        ],
      ),
    );
  }
}
