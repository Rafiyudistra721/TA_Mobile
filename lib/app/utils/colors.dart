import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:get/get.dart';
import 'package:ta_mobile/app/routes/app_pages.dart';
import 'package:ta_mobile/app/modules/auth/controllers/auth_controller.dart';

import '../modules/home/controllers/home_controller.dart';

const colorPrimary = blueColor;
const colorSecondary = greenColor;
const colorThird = Color(0xffD2E5F9);
var defaultBackgroundColor = Colors.grey[300];
var appBarColor = Colors.grey[900];
var myAppBar = AppBar(
  backgroundColor: appBarColor,
  title: Text(' '),
  centerTitle: false,
);
var drawerTextColor = TextStyle(
  color: Colors.grey[600],
);
var tilePadding = const EdgeInsets.only(left: 8.0, right: 8, top: 8);
var myDrawer = Drawer(
  backgroundColor: Colors.grey[300],
  elevation: 0,
  child: Column(
    children: [
        DrawerHeader(
                child: Icon(
                  Icons.favorite,
                  size: 64,
                ),
              ),
              Padding(
                padding: tilePadding,
                child: GestureDetector(
                  onTap: () {
                    // Add your onTap functionality for Settings navigation here
                    Get.toNamed(Routes.MANAGE_BUKU);
                  },
                  child: ListTile(
                    leading: Icon(Icons.settings),
                    title: Text(
                      'MANAGE BUKU',
                      style: drawerTextColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: tilePadding,
                child: GestureDetector(
                  onTap: () {
                    // Add your onTap functionality for About navigation here
                    Get.toNamed(Routes.MANAGE_KATEGORI);
                  },
                  child: ListTile(
                    leading: Icon(Icons.info),
                    title: Text(
                      'MANAGE KATEGORI',
                      style: drawerTextColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: tilePadding,
                child: GestureDetector(
                  onTap: () {
                    // Add your onTap functionality for Logout navigation here
                    Get.toNamed(Routes.MANAGE_PEMINJAMAN);
                  },
                  child: ListTile(
                    leading: Icon(Icons.logout),
                    title: Text(
                      'MANAGE PEMINJAMAN',
                      style: drawerTextColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: tilePadding,
                child: GestureDetector(
                  onTap: () {
                    // Add your onTap functionality for Logout navigation here
                    Get.toNamed(Routes.MANAGE_ULASAN);
                  },
                  child: ListTile(
                    leading: Icon(Icons.logout),
                    title: Text(
                      'MANAGE ULASAN',
                      style: drawerTextColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: tilePadding,
                child: GestureDetector(
                  onTap: () {
                    // Add your onTap functionality for Logout navigation here
                    Get.toNamed(Routes.MANAGE_USER);
                  },
                  child: ListTile(
                    leading: Icon(Icons.logout),
                    title: Text(
                      'MANAGE USER',
                      style: drawerTextColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );