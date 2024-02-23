import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:ta_mobile/app/utils/colors.dart';
import 'package:ta_mobile/app/utils/my_Box.dart';
import 'package:ta_mobile/app/utils/my_drawer.dart';
import 'package:ta_mobile/app/utils/my_tile.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600;

  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  @override
  Widget build(BuildContext context) {
    if (isDesktop(context)) {
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
                flex: 2,
                child: Column(
                  children: [
                    // first 4 boxes in grid
                    AspectRatio(
                      aspectRatio: 4,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 8,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: lightGray,
                                      border: const Border(
                                        top: BorderSide(
                                          color: greenColor,
                                          width: 10,
                                        ),
                                      ),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Jumlah Peminjam',
                                        style:
                                            GoogleFonts.urbanist(fontSize: 18),
                                      ),
                                      Obx(() => Text(
                                            controller.listPeminjam.length
                                                .toString(),
                                            style: GoogleFonts.urbanist(
                                                fontSize: 17),
                                          )),
                                    ],
                                  )),
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: lightGray,
                                    border: const Border(
                                      top: BorderSide(
                                        color: greenColor,
                                        width: 10,
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Jumlah Petugas',
                                        style:
                                            GoogleFonts.urbanist(fontSize: 18),
                                      ),
                                      Obx(() => Text(
                                          controller.listPetugas.length
                                              .toString(),
                                          style: GoogleFonts.urbanist(
                                              fontSize: 17))),
                                    ],
                                  )),
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: lightGray,
                                      border: const Border(
                                        top: BorderSide(
                                          color: greenColor,
                                          width: 10,
                                        ),
                                      ),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Jumlah Peminjam',
                                        style:
                                            GoogleFonts.urbanist(fontSize: 18),
                                      ),
                                      Obx(() => Text(
                                            controller.listPeminjam.length
                                                .toString(),
                                            style: GoogleFonts.urbanist(
                                                fontSize: 17),
                                          )),
                                    ],
                                  )),
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: lightGray,
                                    border: const Border(
                                      top: BorderSide(
                                        color: greenColor,
                                        width: 10,
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Jumlah Petugas',
                                        style:
                                            GoogleFonts.urbanist(fontSize: 18),
                                      ),
                                      Obx(() => Text(
                                          controller.listPetugas.length
                                              .toString(),
                                          style: GoogleFonts.urbanist(
                                              fontSize: 17))),
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: defaultBackgroundColor,
        drawer: MyDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // first 4 boxes in grid
              AspectRatio(
                aspectRatio: 1,
                child: SizedBox(
                  width: double.infinity,
                  child: GridView.builder(
                    itemCount: 4,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return const MyBox();
                    },
                  ),
                ),
              ),

              // list of previous days
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return const MyTile();
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
