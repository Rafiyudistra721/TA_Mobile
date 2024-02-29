import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/routes/app_pages.dart';


AppBar appBar = AppBar(
  toolbarHeight: 80,
  leadingWidth: 1000,
  leading: Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: LinearGradient(
                colors: [Color.fromARGB(255, 25, 97, 192), Color(0xFF3C19C0)],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft),
          ),
          child: Center(
            child: Text(
              "S",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
        ),
      ),
      SizedBox(width: 20),
      Text("SmartLib",
          style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold)),
    ],
  ),
  actions: [
    TextButton(
      onPressed:() {
        Get.toNamed(Routes.HOME);
      },  
     child: Text('Home',
      style: TextStyle(
        fontSize: 24.0, 
        fontWeight: FontWeight.bold,
        color: Colors.red,
      ),
    ),
    ),
    45.width,
    TextButton(
      onPressed:() {
        Get.toNamed(Routes.KOLEKSI);
      },  
      child: Text('Koleksi',
      style: TextStyle(
        fontSize: 24.0, 
        fontWeight: FontWeight.bold,
        color: Colors.black, 
      ),
    ),
    ),
    45.width,
    TextButton(
      onPressed:() {
        Get.toNamed(Routes.PROFIL);
      },    
      child: Text('Profil',
      style: TextStyle(
        fontSize: 24.0, 
        fontWeight: FontWeight.bold,
        color: Colors.black, 
      ),
    ),
    ),
    30.width,
  ],
);
