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
                colors: [Color.fromARGB(225, 4, 68, 85), Color.fromARGB(150, 82, 149,139)],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft),
          ),
          child: Center(
            child: Text(
              "S",
              style: TextStyle(fontSize: 40, color: Colors.white, fontFamily: "Montserrat"),
            ),
          ),
        ),
      ),
      SizedBox(width: 10),
      Text("SmartLib",
          style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold, fontFamily: "Montserrat", color: Colors.white)),
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
        fontFamily: 'urbanist',
        color: Colors.white,
        letterSpacing: 2,
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
        fontFamily: 'urbanist',
        color: Colors.white, 
        letterSpacing: 2,
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
        fontFamily: 'urbanist',
        color: Colors.white, 
        letterSpacing: 2,
      ),
    ),
    ),
    30.width,
  ],
);
