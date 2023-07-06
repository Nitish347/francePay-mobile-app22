import 'package:flutter/material.dart';
import 'package:francepay/Constants/Constants.dart';
import 'package:francepay/pages/PinPage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:number_to_words/number_to_words.dart';

import '../../widgets/flagAppBar.dart';
import '../obsData.dart';

class AcceptRequestScreen extends StatefulWidget {
  String amount;
  String id;
  AcceptRequestScreen({Key? key, required this.amount, required this.id})
      : super(key: key);

  @override
  State<AcceptRequestScreen> createState() => _AcceptRequestScreenState();
}

class _AcceptRequestScreenState extends State<AcceptRequestScreen> {
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
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Payment Request",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400, fontSize: height * 0.035),
              ),
            ),
            reqCard(height, width, widget.amount, widget.id, context)
          ],
        ),
      ),
    );
  }
}

Widget reqCard(double height, double width, String amount, String id,
    BuildContext context) {
  ObsData controller = Get.put(ObsData());
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: SingleChildScrollView(
      child: Container(
        height: height * 0.5,
        width: width,
        decoration: BoxDecoration(
            boxShadow: shadow,
            color: Color(0xffDEDEDE),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: CircleAvatar(
                radius: 40,
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    "Nitish Chaurasiya",
                    style: GoogleFonts.poppins(fontSize: height * 0.03),
                  ),
                  Text(
                    "${id}@fpay",
                    style: GoogleFonts.poppins(
                        fontSize: height * 0.02,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    "Amount",
                    style: GoogleFonts.poppins(fontSize: height * 0.025),
                  ),
                  Text(
                    "€ ${amount}",
                    style: GoogleFonts.poppins(
                        fontSize: height * 0.05, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "${capitalize(NumberToWord().convert('en-in', int.parse(amount)))} Euros",
                    style: GoogleFonts.sarabun(
                        color: Colors.black,
                        fontSize: height * 0.028,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  button(height, width, "Reject", false, context, amount, id),
                  button(height, width, "Accept", true, context, amount, id),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget button(double height, double width, String name, bool accept,
    BuildContext context, String amount, String id) {
  return GestureDetector(
    onTap: () {
      if (accept) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    PinPage(balance: false, id: id, amount: amount)));
      } else {
        Navigator.pop(context);
      }
    },
    child: Container(
      height: height * 0.05,
      width: width * 0.3,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: accept ? Colors.green : Colors.red),
      child: Text(
        name,
        style:
            GoogleFonts.poppins(color: Colors.white, fontSize: height * 0.02),
      ),
    ),
  );
}
