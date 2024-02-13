
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
                  'assets/imgs/bigbgbackground.jpg', // Your background image
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
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
                // Add the white space with curved corners
                Positioned(
                  top: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 700, // Adjust width as needed
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      ),
                    ),
                  ),
                ),
                // Position and style the button with curved border
                Positioned(
                  bottom: 200, // Adjust as needed (3/4 of the height)
                  right: 275, // Adjust as needed to center
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50), // Circular border
                      border: Border.all(
                        color: Color(0xffc1dbfe), // Replace with your desired color
                        width: 2,
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.AUTH);
                      },
                      child: Text(
                        'Go to Next Page',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Replace with your desired color
                        ),
                      ),
                    ),
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
                image: AssetImage('assets/imgs/bgbgimage.jpg'),
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
                      Get.toNamed(Routes.AUTH);
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
