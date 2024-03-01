import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ta_mobile/app/modules/home/views/web_screen.dart';
import 'package:ta_mobile/app/modules/home/views/mobile_screen.dart';
import 'package:ta_mobile/app/modules/home/views/responsive_layout.dart';

import '../controllers/semua_buku_controller.dart';


class SemuaBukuView extends GetView<SemuaBukuController> {
  const SemuaBukuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScreen: MobileScreen(), 
      webScreen: WebScreen());
  }
}
