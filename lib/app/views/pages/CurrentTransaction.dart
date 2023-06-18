import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:francepay/pages/qrScanPage.dart';
import 'package:francepay/widgets/flagAppBar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:number_to_words/number_to_words.dart';

import '../../models/current_trsaction_details.dart';

class CurrentTransaction extends StatefulWidget {
  String amount;
  String? to;
  String? from;
  CurrentTransaction(
      {required this.amount, required this.to, required this.from});

  @override
  State<CurrentTransaction> createState() => _CurrentTransactionState();
}

class _CurrentTransactionState extends State<CurrentTransaction> {
  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    int currentIndex = 4;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        // drawer: NavigationDrawerWidget(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FlagAppBar(),
            SizedBox(
              height: height * 0.08,
            ),
            Container(
              child: Text(
                "TRANSACTION DETAILS",
                style: GoogleFonts.sarabun(
                    fontSize: height * 0.028, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Container(
                // height: width * 0.7,
                width: width * 0.95,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff204394)),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Paid Successfully",
                          style: GoogleFonts.sarabun(
                              color: Colors.white,
                              fontSize: height * 0.03,
                              fontWeight: FontWeight.w400),
                        ),
                        Lottie.network(
                            "https://assets10.lottiefiles.com/packages/lf20_dyy9le6w.json",
                            height: height * 0.15),
                        Column(
                          children: [
                            Text(
                              "${widget.amount}€",
                              style: GoogleFonts.sarabun(
                                  color: Colors.white,
                                  fontSize: height * 0.06,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "${capitalize(NumberToWord().convert('en-in', int.parse(widget.amount)))} Euros",
                              style: GoogleFonts.sarabun(
                                  color: Colors.white,
                                  fontSize: height * 0.025,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              card1(height, width, "Comment",
                                  Icon(CupertinoIcons.text_bubble)),
                              card1(height, width, "Share", Icon(Icons.share)),
                              card1(height, width, "Repeat",
                                  Icon(CupertinoIcons.refresh)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              child: Container(
                height: height * 0.2,
                width: width,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  color: Colors.pink,
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "From : ",
                                      style: GoogleFonts.sarabun(
                                          color: Colors.white,
                                          fontSize: height * 0.019,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "Null",
                                      style: GoogleFonts.sarabun(
                                          color: Colors.white,
                                          fontSize: height * 0.022,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.005,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "FPAY ID :",
                                      style: GoogleFonts.sarabun(
                                          color: Colors.white,
                                          fontSize: height * 0.018,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "${widget.from!}@fpay",
                                      style: GoogleFonts.sarabun(
                                          color: Colors.white,
                                          fontSize: height * 0.020,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 15),
                              child: CircleAvatar(
                                radius: 22,
                                backgroundImage: AssetImage(
                                    "assets/images/photoIdentite.jpg"),
                              ),
                            )
                          ],
                        ),
                        Divider(
                          height: 1,
                          color: Colors.white,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "To : ",
                                      style: GoogleFonts.sarabun(
                                          color: Colors.white,
                                          fontSize: height * 0.019,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "Null",
                                      style: GoogleFonts.sarabun(
                                          color: Colors.white,
                                          fontSize: height * 0.022,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.005,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "FPAY ID :",
                                      style: GoogleFonts.sarabun(
                                          color: Colors.white,
                                          fontSize: height * 0.018,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "${widget.to!}@fpay",
                                      style: GoogleFonts.sarabun(
                                          color: Colors.white,
                                          fontSize: height * 0.02,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 15),
                              child: CircleAvatar(
                                radius: 22,
                                backgroundImage: AssetImage(
                                    "assets/images/photoIdentite.jpg"),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget card1(double height, double width, String text, Icon icon) {
  return Container(
    alignment: Alignment.center,
    height: height * 0.07,
    width: width * 0.25,
    decoration: BoxDecoration(
        color: Color(0xffD9D9D9).withOpacity(0.5),
        borderRadius: BorderRadius.circular(10)),
    child: Padding(
        padding: EdgeInsets.all(2.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            icon,
            Text(text, style: GoogleFonts.sarabun(fontSize: height * 0.017))
          ],
        )),
  );
}
