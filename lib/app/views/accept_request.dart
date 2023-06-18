import 'package:flutter/material.dart';
import 'package:francepay/Constants/Constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:number_to_words/number_to_words.dart';

import '../../widgets/flagAppBar.dart';

class AcceptRequestScreen extends StatefulWidget {
  const AcceptRequestScreen({Key? key}) : super(key: key);

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
            reqCard(height, width, "1000")
          ],
        ),
      ),
    );
  }
}

Widget reqCard(double height, double width, String amount) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
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
                  "8840867665@fpay",
                  style: GoogleFonts.poppins(
                      fontSize: height * 0.02,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey),
                ),
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
                  "€ $amount",
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
                button(height, width, "Reject", false),
                button(height, width, "Accept", true),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget button(double height, double width, String name, bool accept) {
  return Container(
    height: height * 0.05,
    width: width * 0.3,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: accept ? Colors.green : Colors.red),
    child: Text(
      name,
      style: GoogleFonts.poppins(color: Colors.white, fontSize: height * 0.02),
    ),
  );
}
