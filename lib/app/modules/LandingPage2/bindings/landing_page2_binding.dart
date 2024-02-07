import 'package:get/get.dart';

import '../controllers/landing_page2_controller.dart';

class LandingPage2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LandingPage2Controller>(
      () => LandingPage2Controller(),
    );
  }
}
