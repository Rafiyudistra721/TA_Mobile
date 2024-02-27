import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ta_mobile/app/widgets/navbottombar.dart';
import 'package:ta_mobile/app/widgets/navbar.dart';

import '../controllers/profil_controller.dart';

class ProfilView extends GetView<ProfilController> {
  const ProfilView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(initialindex: 2,),
      appBar: AppBar(
        title: const Text('ProfilView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProfilView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
