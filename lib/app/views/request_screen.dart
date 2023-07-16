import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/material.dart';
import 'package:francepay/app/controllers/account_controller.dart';
import 'package:francepay/app/models/PendingRQSTModel.dart';
import 'package:francepay/app/views/accept_request.dart';
import 'package:francepay/pages/AcceptFriendRequest.dart';
import 'package:francepay/widgets/flagAppBar.dart';
import 'package:francepay/widgets/request_card_new.dart';
import 'package:francepay/widgets/transaction_card.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/TransactionCard.dart';
import '../obsData.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({Key? key}) : super(key: key);

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  void fetchReqst() {}

  @override
  void initState() {
    fetchReqst();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FlagAppBar(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      Container(
                        child: SegmentedTabControl(
                          radius: Radius.circular(20),
                          backgroundColor: Colors.white,
                          indicatorColor: Color(0xff204394),
                          tabTextColor: Colors.black,
                          squeezeIntensity: 2,
                          height: 40,
                          textStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400, fontSize: 15),
                          tabPadding: EdgeInsets.symmetric(horizontal: 8),
                          tabs: const [
                            SegmentTab(
                              label: "Payment Requests",
                              textColor: Color(0xff204394),
                            ),
                            SegmentTab(
                              label: "Friend Requests",
                              textColor: Color(0xff204394),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: height * 0.82,
                        child: TabBarView(
                          physics: BouncingScrollPhysics(),
                          children: [
                            Center(
                              child: PendingRequests(height, width),
                            ),
                            PendingFriendRequests(height, width)
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

Widget PendingRequests(double height, double width) {
  ObsData controller = Get.put(ObsData());
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Pending Payment Requests",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400, fontSize: height * 0.035),
        ),
      ),
      Expanded(
        child: Container(
          child: Obx(
            () => ListView.builder(
              itemCount: controller.pendingList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0.5),
                  child: InkWell(
                    onTap: () {
                      // AccountController().GetAllRequest();
                      Get.to(() => AcceptRequestScreen(
                            amount:
                                controller.pendingList[index].amount.toString(),
                            id: controller.pendingList[index].payerId
                                .toString(),
                          ));
                    },
                    child: RequestCard(
                        width,
                        height,
                        "Nitish Chaurasiya",
                        "Pending",
                        controller.pendingList[index].receiverId.toString(),
                        "svgPath",
                        Colors.red,
                        controller.pendingList[index].amount.toString(),
                        controller.pendingList[index].createdAt.toString()),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      )
    ],
  );
}

Widget PendingFriendRequests(double height, double width) {
  ObsData controller = Get.put(ObsData());
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Pending Friend Requests",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400, fontSize: height * 0.035),
        ),
      ),
      Expanded(
        child: Container(
          child: Obx(
            () => ListView.builder(
              itemCount: controller.pendingList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0.5),
                  child: InkWell(
                    onTap: () {
                      // AccountController().GetAllRequest();
                      Get.to(() => AcceptRequestScreen(
                            amount:
                                controller.pendingList[index].amount.toString(),
                            id: controller.pendingList[index].payerId
                                .toString(),
                          ));
                    },
                    child: FriendReqCard(
                        width,
                        height,
                        "Nitish Chaurasiya",
                        "Pending",
                        controller.pendingList[index].receiverId.toString(),
                        "svgPath",
                        Colors.red,
                        controller.pendingList[index].amount.toString(),
                        controller.pendingList[index].createdAt.toString()),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      )
    ],
  );
}
