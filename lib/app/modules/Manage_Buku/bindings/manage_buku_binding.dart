import 'package:get/get.dart';

import '../controllers/manage_buku_controller.dart';

class ManageBukuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageBukuController>(
      () => ManageBukuController(),
    );
  }
}
