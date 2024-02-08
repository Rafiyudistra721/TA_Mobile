import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/manage_peminjaman_controller.dart';

class ManagePeminjamanView extends GetView<ManagePeminjamanController> {
  const ManagePeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ManagePeminjamanView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ManagePeminjamanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
