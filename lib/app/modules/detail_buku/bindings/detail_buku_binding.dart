import 'package:get/get.dart';

import '../controllers/detail_buku_controller.dart';

class DetailBukuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailBukuController>(
      () => DetailBukuController(),
    );
  }
}
