import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ta_mobile/app/routes/app_pages.dart';

import '../controllers/landing_page_controller.dart';

class MobileScreen extends GetView<LandingPageController> {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  "", // Replace with your desired big letter
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
}
