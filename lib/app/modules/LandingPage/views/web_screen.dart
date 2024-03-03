import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/routes/app_pages.dart';
import 'package:ta_mobile/app/utils/scalesize.dart';

import '../controllers/landing_page_controller.dart';

class WebScreen extends GetView<LandingPageController> {
  const WebScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var widthContainer = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      children: [
        // Add a Container for the heavier vignette effect
        Image.asset(
          'assets/imgs/bigbgbackground.jpg', // Your background image
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Colors.black.withOpacity(.7),
                Colors.white.withOpacity(1),
              ],
              radius: 5,
            ),
          ),
        ),
        Positioned(
          top: 80, // Adjust padding from top
          left: 50, // Adjust padding from left
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hai, Selamat Datang di SmartLib.',
                textScaler:
                    TextScaler.linear(ScaleSize.textScaleFactor(context)),
                style: GoogleFonts.urbanist(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              5.height,
              Text(
                'Jelajahi Berbagai Koleksi Buku Kami.',
                textScaler:
                    TextScaler.linear(ScaleSize.textScaleFactor(context)),
                style: GoogleFonts.urbanist(fontSize: 15, color: Colors.white),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          bottom: 0,
          child: Container(
            width: widthContainer * .35, // Adjust width as needed
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  70.height,
                  Image.asset(
                    'assets/icons/logofinalfinal.png', // Replace with your image path
                    width: 400,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                  45.height,
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.AUTH);
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20)),
                    child: Text(
                      'Masuk',
                      style: GoogleFonts.urbanist(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  30.height,
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
