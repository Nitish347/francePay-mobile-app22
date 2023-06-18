import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/material.dart';
import 'package:francepay/app/views/profile.dart';
import 'package:google_fonts/google_fonts.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "All Transactions",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400, fontSize: height * 0.035),
            ),
          ),
          Positioned(
              top: 160,
              child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffF5F5F5),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  width: width,
                  height: height * 0.75,
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: DefaultTabController(
                          length: 3,
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
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                  tabPadding:
                                      EdgeInsets.symmetric(horizontal: 8),
                                  tabs: [
                                    SegmentTab(
                                      label: "All Trasactions",
                                      textColor: Color(0xff204394),
                                    ),
                                    SegmentTab(
                                      label: "Bank",
                                      textColor: Color(0xff204394),
                                    ),
                                    SegmentTab(
                                      label: "Card",
                                      textColor: Color(0xff204394),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                height: height - 300,
                                child: TabBarView(
                                  physics: BouncingScrollPhysics(),
                                  children: [
                                    Center(
                                      child: Text("kjsvjjs"),
                                    ),
                                    Center(
                                      child: Text("kjsvjjs"),
                                    ),
                                    Center(
                                      child: Text("gfd"),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ))))),
        ],
      ),
    );
  }
}
