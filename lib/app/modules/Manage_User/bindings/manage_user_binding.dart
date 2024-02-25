import 'package:get/get.dart';
import 'package:ta_mobile/app/modules/Manage_User/controllers/manage_user_controller.dart';

class ManageUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageUserController>(
      () => ManageUserController(),
    );
  }
}
