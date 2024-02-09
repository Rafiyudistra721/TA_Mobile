import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/manage_buku_controller.dart';

class ManageBukuView extends GetView<ManageBukuController> {
  const ManageBukuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ManageBukuView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ManageBukuView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
