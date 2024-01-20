import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ta_mobile/app/modules/auth/controllers/auth_controller.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final authC = Get.put(AuthController());
  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'HomeView is working',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(onPressed: () {
              authC.logout();
            }, child: Text("Logout"))
          ],
        ),
      ),
    );
  }
}
