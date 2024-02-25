import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ta_mobile/app/modules/Intro/controllers/intro_controller.dart';

class SplashScreen extends GetView<IntroController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 80,
            ),
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              duration: const Duration(seconds: 1),
              curve: Curves.easeIn,
              builder: (context, value, child) => Opacity(
                opacity: value,
                child: Image.asset(
                  'assets/icons/logo_login.png',
                  height:375,
                  width: 375,
                  ),

              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Text(
              'SmartLib',
              style: GoogleFonts.urbanist(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
