import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ta_mobile/app/modules/home/views/web_screen.dart';
import 'package:ta_mobile/app/modules/home/views/mobile_screen.dart';
import 'package:ta_mobile/app/modules/home/views/responsive_layout.dart';

import '../controllers/home_controller.dart';


class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScreen: MobileScreen(), 
      webScreen: const WebScreen());
  }
}
