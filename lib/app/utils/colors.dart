import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:get/get.dart';
import 'package:ta_mobile/app/routes/app_pages.dart';
import 'package:ta_mobile/app/modules/auth/controllers/auth_controller.dart';

const colorPrimary = Color(0xffC1DBFE);
const colorSecondary = greenColor;
const colorThird = Color(0xffD2E5F9);
var defaultBackgroundColor = Colors.grey[300];
// var appBarColor = Colors.grey[900];
var drawerTextColor = TextStyle(
  color: Colors.grey[700],
);
var tilePadding = const EdgeInsets.only(left: 8.0, right: 8, top: 8);
final AuthController authController = Get.put(AuthController());
var myDrawer = Drawer(
  backgroundColor: Colors.grey[300],
  elevation: 5,
  child: Column(
    children: [
      DrawerHeader(
          child: Column(
        children: [
          Image.asset('assets/icons/logo_login.png',
          height: 75,
          width: 150,
          fit: BoxFit.cover,
          ),
          Text(
            "Halo... ${authController.user.username} 👋",
            style: GoogleFonts.ubuntu(
              color: Colors.grey[700],
              fontSize: 25
            ),
          ),
          Text(
            authController.user.level!,
            style: GoogleFonts.ubuntu(
              color: Colors.grey[600],
              fontSize: 15
            ),
          )
        ],
      )),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: const Icon(Icons.dashboard_rounded),
          title: Text(
            'DASHBOARD',
            style: drawerTextColor,
          ),
          hoverColor: Colors.black,
          onTap: () {
            Get.offNamed(Routes.DASHBOARD);
          },
        ),
      ),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: const Icon(Icons.book_rounded),
          title: Text(
            'MANAGE BUKU',
            style: drawerTextColor,
          ),
          hoverColor: Colors.black,
          onTap: () {
            Get.offNamed(Routes.MANAGE_BUKU);
          },
        ),
      ),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: const Icon(Icons.info),
          title: Text(
            'MANAGE KATEGORI',
            style: drawerTextColor,
          ),
          hoverColor: Colors.black,
          onTap: () {
            Get.offNamed(Routes.MANAGE_KATEGORI);
          },
        ),
      ),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: const Icon(Icons.view_timeline),
          title: Text(
            'MANAGE PEMINJAMAN',
            style: drawerTextColor,
          ),
          hoverColor: Colors.black,
          onTap: () {
            Get.offNamed(Routes.MANAGE_PEMINJAMAN);
          },
        ),
      ),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: const Icon(Icons.textsms_rounded),
          title: Text(
            'MANAGE ULASAN',
            style: drawerTextColor,
          ),
          hoverColor: Colors.black,
          onTap: () {
            Get.offNamed(Routes.MANAGE_ULASAN);
          },
        ),
      ),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: const Icon(Icons.supervised_user_circle_rounded),
          title: Text(
            'MANAGE USER',
            style: drawerTextColor,
          ),
          hoverColor: Colors.black,
          onTap: () {
            Get.offNamed(Routes.MANAGE_USER);
          },
        ),
      ),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: const Icon(Icons.person_add_alt_rounded),
          title: Text(
            'TAMBAH PETUGAS',
            style: drawerTextColor,
          ),
          hoverColor: Colors.black,
          onTap: () {
            Get.offNamed(Routes.TAMBAH_PETUGAS);
          },
        ),
      ),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: const Icon(Icons.logout_rounded),
          title: Text(
            'LOG-OUT',
            style: drawerTextColor,
          ),
          hoverColor: Colors.red[800],
          onTap: () {
            authController.logout();
          },
        ),
      ),
    ],
  ),
);
