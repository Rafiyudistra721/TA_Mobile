import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ta_mobile/app/modules/dashboard/views/dashboard_view.dart';

import '../controllers/landing_page2_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Landing Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/landing_image.png', // Path to your image asset
              width: 200, // Adjust the width as needed
              height: 200, // Adjust the height as needed
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(DashboardView());
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Change button color to blue
              ),
              child: Text(
                'Next',
                style: TextStyle(color: Colors.black), // Text color white
              ),
            ),
          ],
        ),
      ),
    );
  }
}
