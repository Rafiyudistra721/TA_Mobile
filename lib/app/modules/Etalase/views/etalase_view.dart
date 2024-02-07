import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/etalase_controller.dart';

class EtalaseView extends GetView<EtalaseController> {
  const EtalaseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EtalaseView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EtalaseView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
