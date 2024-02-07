import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ta_mobile/app/modules/LandingPage2/views/landing_page2_view.dart';

import '../controllers/landing_page_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LandingPage extends StatelessWidget {
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
              'assets/icons/buku1.png', // Path to your image asset
              width: 200, // Adjust the width as needed
              height: 200, // Adjust the height as needed
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(LandingPage2());
              },
              child: Text('Go to Next Page'),
            ),
          ],
        ),
      ),
    );
  }
}
