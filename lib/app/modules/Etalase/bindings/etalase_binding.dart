import 'package:get/get.dart';

import '../controllers/etalase_controller.dart';

class EtalaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EtalaseController>(
      () => EtalaseController(),
    );
  }
}
