import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/denda_controller.dart';

class DendaView extends GetView<DendaController> {
  const DendaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DendaView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DendaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
