import 'package:flutter/material.dart';
import 'package:francepay/app/views/accept_request.dart';
import 'package:francepay/widgets/flagAppBar.dart';
import 'package:francepay/widgets/request_card_new.dart';
import 'package:francepay/widgets/transaction_card.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/TransactionCard.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({Key? key}) : super(key: key);

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
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
              child: Text(
                "Pending Requests",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400, fontSize: height * 0.035),
              ),
            ),
            Container(
              height: height * 0.82,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0.5),
                    child: InkWell(
                      onTap: () => Get.to(() => AcceptRequestScreen()),
                      child: RequestCard(width, height, "Nitish Chaurasiya",
                          "Pending", "svgPath", Colors.red, "599"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(RequestScreen());
}
