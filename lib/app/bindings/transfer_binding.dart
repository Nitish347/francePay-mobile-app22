import 'package:get/get.dart';

import 'package:francepay/app/controllers/transfer_controller.dart';
import 'package:francepay/app/controllers/account_controller.dart';

class TransferBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransferController>(
          () => TransferController(),

    );

    Get.lazyPut<AccountController>(
          () => AccountController(),

    );


  }
}