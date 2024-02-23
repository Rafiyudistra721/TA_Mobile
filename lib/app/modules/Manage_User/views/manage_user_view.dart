// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ta_mobile/app/data/Models/user_model.dart';
import 'package:ta_mobile/app/modules/Manage_User/controllers/manage_user_controller.dart';
import 'package:ta_mobile/app/utils/colors.dart';
import 'package:ta_mobile/app/utils/my_drawer.dart';
import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';


class ManageUserView extends GetView<ManageUserController> {
  ManageUserView({Key? key}) : super(key: key);
  var columns = const [
    DataColumn(label: Text('Username')),
    DataColumn(label: Text('Level')),
    DataColumn(label: Text('Email')),
    DataColumn(label: Text('Actions')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // open drawer
            MyDrawer(),

            // first half of page
            Expanded(
              flex: 1,
              child: AdaptiveScrollbar(
                controller: controller.verticalScrollController,
                underColor: Colors.blueGrey.withOpacity(0.3),
                sliderDefaultColor: active.withOpacity(0.7),
                sliderActiveColor: active,
                child: SingleChildScrollView(
                  controller: controller.verticalScrollController,
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.all(16),
                          child: Text('Daftar Pengguna',
                              style: GoogleFonts.urbanist(fontSize: 30)),),
                      Obx(() => Padding(
                            padding: const EdgeInsets.all(16),
                            child: controller.listUser.isEmpty
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : PaginatedDataTable(
                                      showCheckboxColumn: false,
                                      showFirstLastButtons: true,
                                      columns: columns,
                                      source: MyData(controller.listUser),
                                      columnSpacing: MediaQuery.of(context).size.width / 11,
                                      horizontalMargin: 30,
                                      rowsPerPage: 5,
                                    ),
                                  ),
                          ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyData extends DataTableSource {
  ManageUserController manageUserController = ManageUserController();
    // final HomeController  homeController = Get.put(HomeController());

  final List<UserModel> listUser;

  MyData(this.listUser);
  @override
  DataRow getRow(int index) => DataRow.byIndex(
          index: index,
          cells: [
            DataCell(Text("${listUser[index].username}",
                style:
                    GoogleFonts.urbanist(fontSize: 15))),
            DataCell(Text("${listUser[index].level}",
                style:
                    GoogleFonts.urbanist(fontSize: 15))),
            DataCell(Text("${listUser[index].email}",
                style:
                    GoogleFonts.urbanist(fontSize: 15))),
            DataCell(Row(
              children: [
                listUser[index].level == 'Peminjam'
                    ? ElevatedButton(
                        onPressed: () {
                          Get.defaultDialog(
                            title:
                                'Naikkan level pengguna ini menjadi Petugas?',
                            middleText:
                                'Apakah anda yakin ingin menaikkan level pengguna ini menjadi petugas?',
                            onConfirm: () async {
                              manageUserController.upLevel(listUser[index]);
                            },
                            textConfirm: 'Iya',
                            textCancel: 'Tidak',
                            titleStyle: GoogleFonts.urbanist(
                                fontSize: 15),
                            middleTextStyle: GoogleFonts.urbanist(
                                fontSize: 15),
                          );
                        },
                        child: const Text('UP LEVEL'))
                    : listUser[index].level == 'Petugas'
                        ? ElevatedButton(
                            onPressed: () {
                              Get.defaultDialog(
                                title:
                                    'Turunkan level pengguna ini menjadi Peminjam?',
                                middleText:
                                    'Apakah anda yakin ingin menurunkan level pengguna ini menjadi peminjam?',
                                onConfirm: () async {
                                  manageUserController
                                      .downLevel(listUser[index]);
                                },
                                textConfirm: 'Iya',
                                textCancel: 'Tidak',
                                titleStyle: GoogleFonts.urbanist(
                                    fontSize: 15),
                                middleTextStyle: GoogleFonts.urbanist(
                                    fontSize: 15),
                              );
                            },
                            child: const Text('DOWN LEVEL'))
                        : const SizedBox(width: 0),
                listUser[index].level == 'Peminjam' ||
                        listUser[index].level == 'Petugas'
                    ? ElevatedButton(
                        onPressed: () {
                          Get.defaultDialog(
                            title: 'Blokir Pengguna?',
                            middleText:
                                'Apakah anda yakin ingin memblokir pengguna?',
                            onConfirm: () async {
                              manageUserController
                                  .block(listUser[index]);
                            },
                            textConfirm: 'Iya',
                            textCancel: 'Tidak',
                            titleStyle: GoogleFonts.urbanist(
                                fontSize: 15),
                            middleTextStyle: GoogleFonts.urbanist(
                                fontSize: 15),
                          );
                        },
                        child: const Text('BLOCK'))
                    : listUser[index].level == 'Terblokir'
                          ? ElevatedButton(
                        onPressed: () {
                          Get.defaultDialog(
                            title: 'Buka blokir Pengguna?',
                            middleText:
                                'Apakah anda yakin ingin membuka blokir pengguna?',
                            onConfirm: () async {
                              manageUserController
                                  .unblock(listUser[index]);
                            },
                            textConfirm: 'Iya',
                            textCancel: 'Tidak',
                            titleStyle: GoogleFonts.urbanist(
                                fontSize: 15),
                            middleTextStyle: GoogleFonts.urbanist(
                                fontSize: 15),
                          );
                        },
                        child: const Text('UNBLOCK'))
                        :  const SizedBox(),
              ],
            )),
          ]);

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => listUser.length;
  @override
  int get selectedRowCount => 0;
}
