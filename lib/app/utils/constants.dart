import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_mobile/app/routes/app_pages.dart';

var defaultBackgroundColor = Colors.grey[300];
var appBarColor = Colors.grey[900];
var drawerTextColor = TextStyle(
  color: Colors.grey[600],
);
var tilePadding = const EdgeInsets.only(left: 8.0, right: 8, top: 8);

Drawer buildDrawer(BuildContext context) {
  return Drawer(
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
              // Add your onTap functionality for Dashboard navigation here
              Get.toNamed(Routes.DASHBOARD);
            },
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text(
                'D A S H B O A R D',
                style: drawerTextColor,
              ),
            ),
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
                'M A N A G E B U K U',
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
                'M A N A G E K A T E G O R I',
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
                'M A N A G E P E M I N J A M A N',
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
                'M A N A G E U L A S A N',
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
                'M A N A G E U S E R',
                style: drawerTextColor,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}



// Define other screens here
