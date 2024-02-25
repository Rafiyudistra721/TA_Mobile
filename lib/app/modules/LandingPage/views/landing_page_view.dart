import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ta_mobile/app/routes/app_pages.dart';
import 'package:ta_mobile/app/utils/scalesize.dart';

import '../controllers/landing_page_controller.dart';

class LandingPage extends GetView<LandingPageController> {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var widthContainer = MediaQuery.of(context).size.width;
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          // Desktop layout
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
                          textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
                          style: GoogleFonts.urbanist(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        5.height,
                        Text(
                          'Jelajahi Berbagai Koleksi Buku Kami.',
                          textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
                          style: GoogleFonts.urbanist(
                              fontSize: 15, 
                              color: Colors.white),
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
                              'assets/imgs/guyreadbook1.jpg', // Replace with your image path
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
                                  backgroundColor: Colors.black,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 20)),
                              child: Text(
                                'Masuk',
                                style: GoogleFonts.urbanist(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue, // Your desired color
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
        } else {
          return Scaffold(
            body: Stack(
              children: [
                // Background image covering the entire screen
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/imgs/bgbgimage.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Positioned.fill(
                  child: Container(),
                ),
                // Centered content
                Positioned(
                  top: MediaQuery.of(context).size.height /
                      3, // Adjust position as needed
                  left: MediaQuery.of(context).size.width / 2 -
                      100, // Adjust position as needed
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/imgs/guyreadbookpng.png',
                        width: 200,
                        height: 200,
                      ),
                      const SizedBox(height: 20),
                      // ... other content
                    ],
                  ),
                ),

                Positioned(
                  top: 30,
                  left: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Selamat datang", // Replace with your desired big letter
                        style: GoogleFonts.urbanist(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "di SmartLib", // Replace with your desired small letter
                        style: GoogleFonts.urbanist(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: (1)),
                      ),
                      Text(
                        "Jelajahi Berbagai Koleksi Buku Kami", // Replace with your desired small letter
                        style: GoogleFonts.urbanist(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: (3)),
                      ),
                    ],
                  ),
                ),

                Positioned(
                  bottom: 150,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ambatakum", // Replace with your desired big letter
                        style: GoogleFonts.urbanist(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),

                // White square at the bottom
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: MediaQuery.of(context).size.height /
                      8, // 1/4 of the screen height
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Get.toNamed(Routes.AUTH);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20),
                            ),
                            child: Text(
                              'Masuk',
                              style: GoogleFonts.urbanist(
                                color: Colors.white,
                                fontSize: (25),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
