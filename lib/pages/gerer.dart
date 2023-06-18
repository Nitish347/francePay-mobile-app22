import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:francepay/pages/bankForm.dart';
import 'package:francepay/pages/phoneNumber.dart';
import 'package:francepay/pages/profil.dart';
import 'package:francepay/pages/qrScanPage.dart';
import 'package:francepay/widgets/nextButton.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../app/views/profile.dart';
import '../widgets/flagAppBar.dart';
import '../widgets/navigationDrawerWidget.dart';
import 'cardForm.dart';
import 'mainMenu.dart';

class Gerer extends StatefulWidget {
  const Gerer({Key? key}) : super(key: key);

  @override
  GererState createState() => GererState();
}

class GererState extends State<Gerer> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 1;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height / 10,
              margin: EdgeInsets.only(
                  top: height / 50, left: width / 20, right: width / 20),
              child: Center(
                  child: Image.asset(
                "assets/images/logo-main.png",
                scale: 40,
              )),
            ),
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: width,
                      child: Image.asset("assets/images/offer 1.png"),
                    ),
                    Container(
                      width: width,
                      child: Image.asset("assets/images/offer 1.png"),
                    )
                  ],
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(
                    right: width * 60 / 100,
                    top: height / 50,
                    bottom: height / 50),
                child: Text(
                  "Paiement digitaux",
                  style: TextStyle(
                      color: Color(0XFF757F8C),
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                )),
            Container(
              // margin: EdgeInsets.only(top: height/40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: height / 7,
                    width: width / 3,
                    child: Card(
                        shape: RoundedRectangleBorder(
                            //<-- SEE HERE
                            side: BorderSide(
                              color: Color(0XFF1d3364),
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: height / 100),
                                child: Image.asset(
                                  "assets/images/qr-code - blue.png",
                                  scale: 10,
                                )),
                            Container(
                              child: Text(
                                "QR statique",
                                style: TextStyle(
                                    color: Color(0XFF1d3364),
                                    fontFamily: "Sarabun",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10),
                              ),
                            )
                          ],
                        )),
                  ),
                  Container(
                    height: height / 7,
                    width: width / 3,
                    child: GestureDetector(
                      onTap: () {
                        //Navigator.of(context).push(
                        //    MaterialPageRoute( builder: (context) => CreateTransaction()));
                      },
                      child: Card(
                          shape: RoundedRectangleBorder(
                              //<-- SEE HERE
                              side: BorderSide(
                                color: Color(0XFF1d3364),
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          //color: Color(0XFF1d3364),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(bottom: height / 100),
                                  child: Image.asset(
                                      "assets/images/id - Copie.png",
                                      scale: 10)),
                              Container(
                                child: Text(
                                  "ID FPAY",
                                  style: TextStyle(
                                      color: Color(0XFF1d3364),
                                      fontFamily: "Sarabun",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10),
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                  Container(
                    height: height / 7,
                    width: width / 3,
                    child: Card(
                        shape: RoundedRectangleBorder(
                            //<-- SEE HERE
                            side: BorderSide(
                              color: Color(0XFF1d3364),
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: height / 100),
                                child: Image.asset(
                                  "assets/images/qr-code - blue.png",
                                  scale: 10,
                                )),
                            Container(
                              child: Text(
                                "QR dynamique",
                                style: TextStyle(
                                    color: Color(0XFF1d3364),
                                    fontFamily: "Sarabun",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10),
                              ),
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(
                    right: width * 60 / 100,
                    top: height / 50,
                    bottom: height / 50),
                child: Text(
                  "Paiement de facture",
                  style: TextStyle(
                      color: Color(0XFF757F8C),
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                )),
            Container(
              // margin: EdgeInsets.only(top: height/40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: height / 7,
                    width: width / 3,
                    child: Card(
                        shape: RoundedRectangleBorder(
                            //<-- SEE HERE
                            side: BorderSide(
                              color: Color(0XFF1d3364),
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: height / 100),
                                child: Image.asset(
                                  "assets/images/electricity.png",
                                  scale: 10,
                                )),
                            Container(
                              child: Text(
                                "Facture d'électricité",
                                style: TextStyle(
                                    color: Color(0XFF1d3364),
                                    fontFamily: "Sarabun",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10),
                              ),
                            )
                          ],
                        )),
                  ),
                  Container(
                    height: height / 7,
                    width: width / 3,
                    child: GestureDetector(
                      onTap: () {
                        //Navigator.of(context).push(
                        //    MaterialPageRoute( builder: (context) => CreateTransaction()));
                      },
                      child: Card(
                          shape: RoundedRectangleBorder(
                              //<-- SEE HERE
                              side: BorderSide(
                                color: Color(0XFF1d3364),
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          //color: Color(0XFF1d3364),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(bottom: height / 100),
                                  child: Image.asset("assets/images/wifi.png",
                                      scale: 10)),
                              Container(
                                child: Text(
                                  "Facture d'opérateur",
                                  style: TextStyle(
                                      color: Color(0XFF1d3364),
                                      fontFamily: "Sarabun",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10),
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                  Container(
                    height: height / 7,
                    width: width / 3,
                    child: Card(
                        shape: RoundedRectangleBorder(
                            //<-- SEE HERE
                            side: BorderSide(
                              color: Color(0XFF1d3364),
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: height / 100),
                                child: Image.asset(
                                  "assets/images/water-tap.png",
                                  scale: 10,
                                )),
                            Container(
                              child: Text(
                                "Facture d'eau",
                                style: TextStyle(
                                    color: Color(0XFF1d3364),
                                    fontFamily: "Sarabun",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10),
                              ),
                            )
                          ],
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
