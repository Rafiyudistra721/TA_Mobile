import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_mobile/app/modules/Intro/controllers/intro_controller.dart';


class SplashScreen extends GetView<IntroController> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.blue.shade200,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 80,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.5,
              child: TweenAnimationBuilder(
                tween: Tween<double>(begin: 3, end: 1),
                duration: const Duration(seconds: 1),
                curve: Curves.elasticOut,
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: TweenAnimationBuilder(
                      tween: Tween<double>(begin: 2, end: 0),
                      duration: const Duration(seconds: 5),
                      curve: Curves.elasticOut,
                      builder: (context, value, child) {
                        return Transform.rotate(
                          angle: value,
                          child: Image.asset('assets/icons/logo_login.png'),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Text(
              'SmartLib',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 0,
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
