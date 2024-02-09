import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/manage_kategori_controller.dart';

class ManageKategoriView extends GetView<ManageKategoriController> {
  const ManageKategoriView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ManageKategoriView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ManageKategoriView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
