import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ta_mobile/app/utils/colors.dart';
import 'package:ta_mobile/app/utils/my_drawer.dart';

import '../controllers/tambah_petugas_controller.dart';

class TambahPetugasView extends GetView<TambahPetugasController> {
  const TambahPetugasView({Key? key}) : super(key: key);
  final columns = const [
    DataColumn(label: Text('Username')),
    DataColumn(label: Text('Level')),
    DataColumn(label: Text('Email')),
    DataColumn(label: Text('Actions')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // open drawer
            MyDrawer(),

            // first half of page
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 4,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey[700]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Jumlah Peminjam',
                                    style: GoogleFonts.ubuntu(fontSize: 17),
                                  ),
                                  Obx(() => Text(
                                        controller.listPeminjam.length
                                            .toString(),
                                        style: GoogleFonts.ubuntu(fontSize: 17),
                                      )),
                                ],
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey[700]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Jumlah Petugas',
                                    style: GoogleFonts.ubuntu(fontSize: 17),
                                  ),
                                  Obx(() => Text(
                                      controller.listPetugas.length.toString(),
                                      style: GoogleFonts.ubuntu(fontSize: 17))),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                  Text('Pengguna',
                      style: GoogleFonts.ubuntu(
                          fontSize: 30, color: Colors.black)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Username',
                          style: GoogleFonts.ubuntu(
                              fontSize: 15, color: Colors.black)),
                      Text('|',
                          style: GoogleFonts.ubuntu(
                              fontSize: 15, color: Colors.black)),
                      Text('Level',
                          style: GoogleFonts.ubuntu(
                              fontSize: 15, color: Colors.black)),
                      Text('|',
                          style: GoogleFonts.ubuntu(
                              fontSize: 15, color: Colors.black)),
                      Text('Email',
                          style: GoogleFonts.ubuntu(
                              fontSize: 15, color: Colors.black)),
                    ],
                  ),
                  Obx(() => Expanded(
                        child: ListView.builder(
                          itemCount: controller.listUser.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 78,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.grey[200]),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                          controller.listUser[index].username!
                                                      .length >
                                                  10
                                              ? '${controller.listUser[index].username!.substring(0, 10)}\n${controller.listUser[index].username!.substring(10)}'
                                              : controller
                                                  .listUser[index].username!,
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 15,
                                              color: Colors.black)),
                                      Text('|',
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 13,
                                              color: Colors.black)),
                                      Text(
                                          controller.listUser[index].level ??
                                              '',
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 15,
                                              color: Colors.black)),
                                      Text('|',
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 13,
                                              color: Colors.black)),
                                      Text(
                                          controller.listUser[index].email!
                                                      .length >
                                                  10
                                              ? '${controller.listUser[index].email!.substring(0, 10)}\n${controller.listUser[index].email!.substring(10, 20)}\n${controller.listUser[index].email!.substring(20)}'
                                              : controller
                                                  .listUser[index].email!,
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 15,
                                              color: Colors.black)),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
