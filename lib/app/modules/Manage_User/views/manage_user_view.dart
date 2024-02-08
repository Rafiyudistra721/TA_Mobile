import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/manage_user_controller.dart';

class ManageUserView extends GetView<ManageUserController> {
  const ManageUserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ManageUserView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ManageUserView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
