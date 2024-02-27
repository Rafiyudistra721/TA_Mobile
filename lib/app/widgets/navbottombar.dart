import 'package:ta_mobile/app/routes/app_pages.dart';
import 'package:ta_mobile/app/utils/colors.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNav extends StatelessWidget {
  BottomNav ({this.initialindex});
  int? initialindex;
  @override
  Widget build(BuildContext context){
      return ConvexAppBar(
        backgroundColor: defaultBackgroundColor,
        color: Colors.black,
        activeColor: Colors.purple,
        style: TabStyle.fixedCircle,
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
        initialActiveIndex: 0,
        // onTap: (int i) => print('click index=$i')
      );
  }
}