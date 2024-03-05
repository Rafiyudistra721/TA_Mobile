import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/koleksi_controller.dart';
import 'package:ta_mobile/app/modules/koleksi/views/web_screen.dart';
import 'package:ta_mobile/app/modules/koleksi/views/mobile_screen.dart';
import 'package:ta_mobile/app/modules/koleksi/views/responsive_layout.dart';

class KoleksiView extends GetView<KoleksiController> {
  const KoleksiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScreen: MobileScreen(), 
      webScreen:  WebScreen());
      }
    }
