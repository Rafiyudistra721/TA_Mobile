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
      body: Container(
	    color: Colors.red.shade200,
        child: Column(
          children: [
               Container(
                color: Colors.red.shade200,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20, left: 20),
            child: 
              Image.asset(
              'assets/icons/buku1.png', 
              width: 200, 
              height: 200, 
            ),)
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(LandingPage2());
              },
              child: Text('Go to Next Page'),
            )
          ],
        ),
      ),
    );
  }
}
