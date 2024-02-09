import 'package:get/get.dart';

import '../controllers/tambah_petugas_controller.dart';

class TambahPetugasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahPetugasController>(
      () => TambahPetugasController(),
    );
  }
}
