import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/modules/auth/controllers/auth_controller.dart';
import 'package:ta_mobile/app/modules/home/controllers/home_controller.dart';
import 'package:ta_mobile/app/routes/app_pages.dart';

class MyDrawer extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final HomeController homeController = Get.put(HomeController());
  MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(

      elevation: 5,
      child: Obx(() => Column(
            children: [
              DrawerHeader(
                child: Column(
                  children: [
                    Image.asset( homeController.darkModeValue.value
                      ?'assets/icons/logofinalfinalfinal.png'
                      :'assets/icons/logofinalfinal.png',
                      height: 75,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      "Halo... ${authController.user.username} 👋",
                      overflow: TextOverflow.fade,
                      style: GoogleFonts.ubuntu(
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      authController.user.level!,
                      style: GoogleFonts.ubuntu(
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
              ),
              buildListTile(
                  Icons.dashboard_rounded, 'Dashboard', Routes.DASHBOARD),
              buildListTile(
                  Icons.book_rounded, 'Manage Buku', Routes.MANAGE_BUKU),
              buildListTile(
                  Icons.info, 'Manage Kategori', Routes.MANAGE_KATEGORI),
              buildListTile(Icons.view_timeline, 'Manage Peminjaman',
                  Routes.MANAGE_PEMINJAMAN),
              if (authController.user.level == 'Admin')
                buildListTile(Icons.supervised_user_circle_rounded,
                    'Manage User', Routes.MANAGE_USER),
              buildListTile(Icons.logout_rounded, 'Keluar', null),
              150.height,
              FloatingActionButton(
                mini: true,
                heroTag: 'btn-add',
                onPressed: () {
                  homeController.toggleTheme();
                },
                child: Icon(
                  (homeController.darkModeValue.value)
                      ? Icons.nightlight_round
                      : Icons.wb_sunny_rounded,
                  size: 23,
                ),
              )
            ],
          )),
    );
  }

  buildListTile(IconData icon, String title, String? route) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
      ),
      hoverColor: route == null
          ? Colors.red
          : homeController.darkModeValue.value
              ? Colors.black
              : Colors.white,
      selected: route != null && Get.currentRoute == route,
      onTap: () {
        if (route != null) {
          Get.offNamed(route);
        } else {
          authController.logout();
        }
      },
    );
  }
}
