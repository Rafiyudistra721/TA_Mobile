import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_mobile/app/modules/Intro/controllers/intro_controller.dart';

class IntroView extends GetView<IntroController> {
  const IntroView({super.key});

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
                  'assets/icons/logofinalfinal.png',
                  height:375,
                  width: 375,
                  ),

              ),
            ),
            const SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}
