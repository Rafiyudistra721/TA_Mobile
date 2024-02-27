import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/routes/app_pages.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNav extends StatelessWidget {
  BottomNav ({this.initialindex});
  int? initialindex;
  @override
  Widget build(BuildContext context){
      return ConvexAppBar(
        backgroundColor: lightBlue,
        color: Colors.black,
        activeColor:Color(0xFF3C19C0),
        style: TabStyle.reactCircle,
        items: const [
          TabItem(icon: Icons.home),
          TabItem(icon: Icons.book),
          TabItem(icon: Icons.person),
        ],
        onTap: (index){
          if (index == 0) {
            Get.offNamed(Routes.HOME);
          } else if (index == 1) {
            Get.offNamed(Routes.KOLEKSI);
          } else if (index == 2) {
            Get.offNamed(Routes.PROFIL);
          }
        },
        initialActiveIndex: initialindex,
        // onTap: (int i) => print('click index=$i')
      );
  }
}