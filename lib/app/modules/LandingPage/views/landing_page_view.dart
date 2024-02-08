import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/routes/app_pages.dart';
import 'package:ta_mobile/app/utils/colors.dart';

import '../controllers/landing_page_controller.dart';

class LandingPage extends GetView<LandingPageController> {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      appBar: AppBar(
        title: const Text('Landing Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 20),
              child: Image.asset(
                'assets/icons/logo_landing.png',
                width: 200,
                height: 200,
              ),
            ),
            20.height,
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.LANDING_PAGE2);
              },
              child: const Text('Go to Next Page'),
            )
          ],
        ),
      ),
    );
  }
}
