import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profil_controller.dart';
import 'package:ta_mobile/app/modules/profil/views/web_screen.dart';
import 'package:ta_mobile/app/modules/profil/views/mobile_screen.dart';
import 'package:ta_mobile/app/modules/profil/views/responsive_layout.dart';

class ProfilView extends GetView<ProfilController> {
  const ProfilView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScreen: MobileScreen(),
      webScreen: WebScreen());
      }
    }
