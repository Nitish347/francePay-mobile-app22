import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:francepay/app/views/GenerateDynamicQr.dart';
import 'package:francepay/pages/PinPage.dart';

import 'package:francepay/widgets/CheckBalance.dart';
import 'package:francepay/widgets/logo.dart';
import 'package:google_fonts/google_fonts.dart';

class EnterAmount extends StatefulWidget {
  bool generate;
  String id;
  EnterAmount({required this.id, required this.generate});
  @override
  State<EnterAmount> createState() => _EnterAmountState();
}

class _EnterAmountState extends State<EnterAmount> {
  String amount = "";
  bool showErr = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    TextEditingController amountController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(children: [
              Logo(height * 0.7),
              Visibility(
                visible: !widget.generate,
                child: Padding(
                  padding: EdgeInsets.all(height * 0.01),
                  child: CircleAvatar(
                      radius: height * 0.05,
                      backgroundImage:
                          AssetImage('assets/images/photoIdentite.jpg')),
                ),
              ),
              Visibility(
                visible: !widget.generate,
                child: Text(
                  "Null",
                  style: GoogleFonts.poppins(fontSize: height * 0.03),
                ),
              ),
              Visibility(
                visible: widget.generate,
                child: Text(
                  "Generate Dynamic QR Code",
                  style: GoogleFonts.poppins(fontSize: height * 0.03),
                ),
              ),
              Visibility(
                visible: !widget.generate,
                child: Text(
                  "To: ${widget.id}@fpay",
                  style: GoogleFonts.poppins(
                      fontSize: height * 0.02, color: Colors.black45),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: InkWell(
                  onTap: () {
                    // print("check balance");
                    // GetBalance().checkBalance(context);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PinPage(balance: true)));
                    // showModalBottomSheet(
                    //     shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(10)),
                    //     context: context,
                    //     builder: (context) {
                    //       return Container(
                    //         height: height * 0.3,
                    //         width: width,
                    //       );
                    //     });
                  },
                  child: Text(
                    "Check Balance",
                    style: TextStyle(
                        fontSize: height * 0.02, color: Color(0XFF1d3364)),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.012),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Amount",
                    style: TextStyle(
                        fontFamily: "sarabun",
                        fontSize: height * 0.022,
                        color: Color(0XFF757F8C),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                height: height / 11.5,
                width: width,
                //color: Colors.red,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 2,
                  child: Center(
                      child: IntrinsicWidth(
                    child: TextFormField(
                      onChanged: (val) {
                        setState(() {
                          amount = val;
                        });
                      },
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: height * 0.035,
                          color: Colors.green),
                      cursorHeight: height * 0.03,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIconConstraints: const BoxConstraints(),
                          suffixIcon: Container(
                            margin: EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              '€',
                              style: TextStyle(
                                  fontSize: height * 0.05,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.green),
                            ),
                          ),
                          // prefixText: "€ 00.00",

                          hintText: " Enter Amount",
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 20, color: Colors.grey)),
                    ),
                  )),
                ),
              ),
              Visibility(
                visible: showErr,
                child: Text(
                  "Enter Amount*",
                  style: TextStyle(
                      fontFamily: "sarabun",
                      fontSize: height * 0.015,
                      color: Colors.red,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.012),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Message (Optional)",
                    style: TextStyle(
                        fontFamily: "sarabun",
                        fontSize: height * 0.022,
                        color: Color(0XFF757F8C),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                height: height * 0.22,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  scrollPadding: EdgeInsets.only(bottom: 50),
                  style: GoogleFonts.poppins(fontSize: height * 0.02),
                  cursorColor: Colors.black,
                  maxLines: 7,
                  decoration: InputDecoration(
                    hintText: "Enter Your Message",
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: height * 0.1),
              Container(
                  height: height * 0.06,
                  width: width * 0.75,
                  child: ElevatedButton(
                    onPressed: () {
                      if (amount == "") {
                        setState(() {
                          showErr = true;
                        });
                      } else if (widget.generate) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DynamicQrCode(
                                    amount: amount, id: widget.id)));
                      } else {
                        Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => PinPage(
                                      balance: false,
                                      amount: amount,
                                      id: widget.id,
                                      dynamic: false,
                                    )));
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0XFF1d3364)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ))),
                    child: Center(
                        child: Text(
                      widget.generate ? "Generate" : "Pay",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 18),
                    )),
                  ))
            ]),
          ),
        ),
      ),
    );
    ;
  }
}
