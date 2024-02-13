import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/routes/app_pages.dart';
import 'package:ta_mobile/app/utils/colors.dart';

import '../controllers/landing_page_controller.dart';

class LandingPage extends GetView<LandingPageController> {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          // Desktop layout
          return Scaffold(
            body: Stack(
              children: [
                Image.asset(
                  'assets/images/bigbgbackground.jpg', // Your background image
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/icons/logo_landing.png',
                        width: 200,
                        height: 200,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Get.toNamed(Routes.LANDING_PAGE2);
                        },
                        child: const Text('Go to Next Page'),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          // Android layout
          return Scaffold(
              body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bgbgimage.jpg'),
                fit: BoxFit.cover, // Ensures background fills entire screen
              ),
            ),
            child: Center(
              // Center the content horizontally and vertically
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/logo_landing.png',
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.LANDING_PAGE2);
                    },
                    child: const Text('Go to Next Page'),
                  )
                ],
              ),
            ),
          ));
        }
      },
    );
  }
}
