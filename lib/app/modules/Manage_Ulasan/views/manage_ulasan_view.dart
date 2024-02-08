import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/manage_ulasan_controller.dart';

class ManageUlasanView extends GetView<ManageUlasanController> {
  const ManageUlasanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ManageUlasanView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ManageUlasanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
