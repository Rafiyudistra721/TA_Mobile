import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ta_mobile/app/modules/auth/controllers/auth_controller.dart';
import 'package:ta_mobile/app/routes/app_pages.dart';
import 'package:ta_mobile/app/utils/colors.dart';

class MyDrawer extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[300],
      elevation: 5,
      child: Obx(() => Column(
            children: [
              DrawerHeader(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/icons/logo_login.png',
                      height: 75,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      "Halo... ${authController.user.username} 👋",
                      style: GoogleFonts.ubuntu(
                        color: Colors.grey[700],
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      authController.user.level!,
                      style: GoogleFonts.ubuntu(
                        color: Colors.grey[600],
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
              ),
              buildListTile(
                  Icons.dashboard_rounded, 'DASHBOARD', Routes.DASHBOARD),
              buildListTile(
                  Icons.book_rounded, 'MANAGE BUKU', Routes.MANAGE_BUKU),
              buildListTile(
                  Icons.info, 'MANAGE KATEGORI', Routes.MANAGE_KATEGORI),
              buildListTile(Icons.view_timeline, 'MANAGE PEMINJAMAN',
                  Routes.MANAGE_PEMINJAMAN),
              buildListTile(
                  Icons.textsms_rounded, 'MANAGE ULASAN', Routes.MANAGE_ULASAN),
              buildListTile(Icons.supervised_user_circle_rounded, 'MANAGE USER',
                  Routes.MANAGE_USER),
              buildListTile(Icons.person_add_alt_rounded, 'TAMBAH PETUGAS',
                  Routes.TAMBAH_PETUGAS),
              buildListTile(Icons.logout_rounded, 'LOG-OUT', null),
            ],
          )),
    );
  }

  buildListTile(IconData icon, String title, String? route) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: drawerTextColor,
      ),
      hoverColor: route == null ? Colors.red : Colors.black,
      selected: route != null && Get.currentRoute == route,
      selectedTileColor: Colors.blue[200],
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
