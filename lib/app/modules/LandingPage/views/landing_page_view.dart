import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ta_mobile/app/routes/app_pages.dart';

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
              body: Container(
            child: Stack(
              children: [
                // Add a Container for the heavier vignette effect
                Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        Colors.black.withOpacity(
                            1), // Adjust opacity for heavier effect
                        Colors.white,
                      ],
                      radius: 10.0, // Adjust radius for more defined vignette
                    ),
                  ),
                ),
                Image.asset(
                  'assets/imgs/bigbgbackground.jpg', // Your background image
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 100, // Adjust padding from top
                  left: 75, // Adjust padding from left
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hai, Selamat Datang di SmartLib.',
                        style: GoogleFonts.urbanist(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 5), // Adjust spacing between lines
                      Text(
                        'Jelajahi Berbagai Koleksi Buku Kami.',
                        style: GoogleFonts.urbanist(
                            fontSize: 40, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: widthContainer * .4, // Adjust width as needed
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(1),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      // Add your remaining desktop layout widgets here
                      children: [
                        Positioned(
                          // Calculate approximate center Y position slightly below middle
                          top: 200, // Adjust vertical position
                          right: 125, // Adjust horizontal position

                          child: Image.asset(
                            'assets/imgs/guyreadbook1.jpg', // Replace with your image path
                            width: 400,
                            height: 400,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          // Calculate Y position based on desired layout
                          top: Get.height * .75, // Adjust vertical position
                          right: 275, // Center horizontally

                          child: FittedBox(
                            fit: BoxFit
                                .contain, // Adjust as needed: cover, fill, etc.
                            child: ElevatedButton(
                              onPressed: () {
                                Get.toNamed(Routes.AUTH);
                              },
                              child: Text(
                                'Masuk',
                                style: GoogleFonts.urbanist(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue, // Your desired color
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 20)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
                              padding: EdgeInsets.symmetric(
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
