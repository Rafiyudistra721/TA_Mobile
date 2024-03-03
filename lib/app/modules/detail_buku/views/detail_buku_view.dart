import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_mobile/app/modules/detail_buku/controllers/detail_buku_controller.dart';
import 'package:ta_mobile/app/modules/detail_buku/views/web_screen.dart';
import 'package:ta_mobile/app/modules/detail_buku/views/mobile_screen.dart';
import 'package:ta_mobile/app/modules/detail_buku/views/responsive_layout.dart';

class DetailBukuView extends GetView<DetailBukuController> {
  const DetailBukuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScreen:  Mobile_Screen(), 
      webScreen:  Web_Screen());
      }
    }
