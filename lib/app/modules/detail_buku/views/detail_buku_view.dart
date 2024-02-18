import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_buku_controller.dart';

class DetailBukuView extends GetView<DetailBukuController> {
  const DetailBukuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailBukuView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailBukuView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
