// ignore_for_file: must_be_immutable

import 'package:ta_mobile/app/routes/app_pages.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNav extends StatelessWidget {
  BottomNav ({super.key, this.initialindex});
  int? initialindex;
  @override
  Widget build(BuildContext context){
      return ConvexAppBar(
        backgroundColor: const Color(0xFF004D47),
        color: Colors.black,
        activeColor:const Color(0xFF52958B),
        style: TabStyle.reactCircle,
        items: const [
          TabItem(icon: Icons.home),
          TabItem(icon: Icons.book),
          TabItem(icon: Icons.person),
        ],
        onTap: (index){
          if (index == 0) {
            Get.toNamed(Routes.HOME);
          } else if (index == 1) {
            Get.toNamed(Routes.KOLEKSI);
          } else if (index == 2) {
            Get.toNamed(Routes.PROFIL);
          }
        },
        initialActiveIndex: initialindex,
        // onTap: (int i) => print('click index=$i')
      );
  }
}