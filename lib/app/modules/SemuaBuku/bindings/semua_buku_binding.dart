import 'package:get/get.dart';

import '../controllers/semua_buku_controller.dart';

class SemuaBukuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SemuaBukuController>(
      () => SemuaBukuController(),
    );
  }
}
