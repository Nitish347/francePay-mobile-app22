import 'package:get/get.dart';

import '../controllers/sigin_controller.dart';

class SigInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SigninController>(
          () => SigninController(),
    );
  }
}