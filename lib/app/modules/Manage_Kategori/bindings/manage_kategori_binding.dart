import 'package:get/get.dart';

import '../controllers/manage_kategori_controller.dart';

class ManageKategoriBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageKategoriController>(
      () => ManageKategoriController(),
    );
  }
}
