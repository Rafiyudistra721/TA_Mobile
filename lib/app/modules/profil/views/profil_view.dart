import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ta_mobile/app/modules/auth/controllers/auth_controller.dart';
// import 'package:ta_mobile/app/routes/app_pages.dart';
// import 'package:ta_mobile/app/widgets/navbottombar.dart';
// import 'package:ta_mobile/app/widgets/navbar.dart';

import '../controllers/profil_controller.dart';

class ProfilView extends GetView<ProfilController> {
  final authC = Get.put(AuthController());
  ProfilView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
        backgroundColor: Color(0xFF52958B),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFF52958B),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 500,
                height: 300,
                padding: const EdgeInsets.all(20.0),
                margin: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Username:',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      authC.user.username!,
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Email:',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      authC.user.email!, // Add email here
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Alamat:',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      authC.user.alamat!, // Add address here
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 500,
                padding: const EdgeInsets.all(20.0),
                margin: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20,
                    width: 100,),
                    ElevatedButton(
                      onPressed: () {
                        authC.logout();
                      },
                      
                      child: Text('Logout',
                      style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 30, color: Colors.black),),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
