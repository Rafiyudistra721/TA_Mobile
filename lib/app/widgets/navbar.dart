import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_mobile/app/modules/home/views/home_view.dart';
import 'package:ta_mobile/app/modules/koleksi/views/koleksi_view.dart';
import 'package:ta_mobile/app/modules/profil/views/profil_view.dart';

class NavBar extends StatelessWidget {
  final navLinks = ["Beranda", "Koleksi", "Profile"];

  List<Widget> navItem() {
    return navLinks.map((text) {
      return Padding(
        padding: EdgeInsets.only(left: 24, right: 32),
        child: TextButton(
          onPressed: () => Get.offNamed(text.toLowerCase()),
          child: Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Color(0xFF3C19C0))),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 38),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 25, 97, 192),
                    Color(0xFF3C19C0)
                  ], begin: Alignment.bottomRight, end: Alignment.topLeft),
                ),
                child: Center(
                  child: Text(
                    "S",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Text("SmartLib", style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: navItem(),
          ),
        ],
      ),
    );
  }
}

final List<GetPage> routes = [
  GetPage(name: '/beranda', page: () => HomeView()),
  GetPage(name: '/koleksi', page: () => KoleksiView()),
  GetPage(name: '/profile', page: () => ProfilView()),
];

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false, 
      initialRoute: '/',
      getPages: routes,
      home: NavBar(),
    ),
  );
}
