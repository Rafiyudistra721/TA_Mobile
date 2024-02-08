import 'package:get/get.dart';

import '../controllers/manage_peminjaman_controller.dart';

class ManagePeminjamanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManagePeminjamanController>(
      () => ManagePeminjamanController(),
    );
  }
}
