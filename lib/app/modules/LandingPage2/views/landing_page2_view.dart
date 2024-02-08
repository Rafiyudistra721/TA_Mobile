import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/routes/app_pages.dart';
import 'package:ta_mobile/app/utils/colors.dart';

import '../controllers/landing_page2_controller.dart';


class LandingPage2 extends GetView<LandingPage2Controller> {
  const LandingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      appBar: AppBar(
        title: const Text('Landing Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/logo_landing.png', // Path to your image asset
              width: 200, // Adjust the width as needed
              height: 200, // Adjust the height as needed
            ),
            20.height,
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.AUTH);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Change button color to blue
              ),
              child: const Text(
                'Register',
                style: TextStyle(color: Colors.black), // Text color white
              ),
            ),
          ],
        ),
      ),
    );
  }
}
