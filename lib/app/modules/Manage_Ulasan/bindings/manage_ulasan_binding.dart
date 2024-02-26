import 'package:get/get.dart';

import '../controllers/manage_ulasan_controller.dart';

class ManageUlasanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageUlasanController>(
      () => ManageUlasanController(),
    );
  }
}
