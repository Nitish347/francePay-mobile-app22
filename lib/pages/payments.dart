

import 'package:flutter/material.dart';
import 'package:francepay/app/views/common/bottomnavbar.dart';
import 'package:francepay/pages/CreatePaymentRequest.dart';
import 'package:francepay/pages/GenerateLink.dart';
import 'package:francepay/pages/chooseAmount.dart';
//import 'package:francepay/pages/Menu.dart';
import 'package:francepay/pages/generateQR.dart';
import 'package:francepay/pages/linkRequest.dart';
import 'package:francepay/pages/staticQR.dart';
//import 'package:francepay/pages/stats.dart';
//import 'package:francepay/pages/transactions.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import 'QrScan.dart';
import 'dynamicQR.dart';

class WaysOfPayments extends StatefulWidget {
  const WaysOfPayments ({Key? key}) : super(key: key);

  @override
  WaysOfPaymentsState createState() => WaysOfPaymentsState();
}

class WaysOfPaymentsState extends State<WaysOfPayments> {

  var currentIndex = 3;

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(


      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(left: width/4, right: width/4, top: height/10, bottom: height/10),
                child: Image.asset("assets/images/logo-main.png", scale: 25)),
            Center(
              child: Container(
                  margin: EdgeInsets.only(bottom: height/20),
                  child: Text("Choisissez votre moyen de paiement", style: TextStyle(color: Color(0XFF1d3364), fontWeight: FontWeight.bold),)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.toNamed("/profile");
                  },
                  child: Container(
                    height: width/3.2,
                    width: width/3.2,
                    child: Card(

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        //color: Color(0XFF1d3364),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(child: Image.asset("assets/images/staticQr.jpeg", scale: 9),
                              //margin: EdgeInsets.only(top: height/25),
                            ),
                            Container(
                              //margin: EdgeInsets.only(top: height/40),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("Statique", style: TextStyle(color: Color(0XFF1d3364), fontWeight: FontWeight.bold),),
                              ),
                            ),
                          ],
                        )
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ChooseAmount()));
                  },
                  child: Container(
                    height: width/3.2,
                    width: width/3.2,
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        //color: Color(0XFF1d3364),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(child: Image.asset("assets/images/dynamicQr.png", scale: 7)),
                            Container(
                              alignment: Alignment.center,
                              child: Text("Dynamique", style: TextStyle(color: Color(0XFF1d3364), fontWeight: FontWeight.bold),),
                            ),
                          ],
                        )
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => LinkRequest()));
                  },
                  child: Container(
                    height: width/3.2,
                    width: width/3.2,
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        //color: Color(0XFF1d3364),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(child: Image.asset("assets/images/link-removebg-preview.png", scale: 9)),
                            Container(
                              //margin: EdgeInsets.only(top: height/20),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("Lien", style: TextStyle(color: Color(0XFF1d3364), fontWeight: FontWeight.bold),),
                              ),
                            ),
                          ],
                        )
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => CreatePaymentRequest()));
                  },
                  child: Container(
                    height: width/3.2,
                    width: width/3.2,
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        //color: Color(0XFF1d3364),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(child: Image.asset("assets/images/quote-request-removebg-preview.png", scale: 7)),
                            Container(
                              //margin: EdgeInsets.only(top: height/20),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("Requête", style: TextStyle(color: Color(0XFF1d3364), fontWeight: FontWeight.bold),),
                              ),
                            ),
                          ],
                        )
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child:GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => QRScanPage()));
                },
                child: Container(
                  height: width/3.2,
                  width: width/3.2,
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      //color: Color(0XFF1d3364),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Align( alignment: Alignment.center,child: Image.asset("assets/images/qr-scan-removebg-preview.png", scale: 7)),
                          Container(
                            //margin: EdgeInsets.only(top: height/40),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text("Scanner", style: TextStyle(color: Color(0XFF1d3364), fontWeight: FontWeight.bold),),
                            ),
                          ),
                        ],
                      )
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: NavBar(index: 3),
    );
  }
}
