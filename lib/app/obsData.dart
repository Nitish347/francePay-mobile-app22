import 'package:get/get.dart';

import 'models/PendingRQSTModel.dart';

class PendingRequestModel {}

class ObsData extends GetxController {
  RxList<PendingRequestsModel> pendingList = <PendingRequestsModel>[].obs;
  RxBool sent = false.obs;

  void addItem(PendingRequestsModel item) {
    pendingList.add(item);
  }

  void clearList() {
    pendingList.clear();
  }
}
