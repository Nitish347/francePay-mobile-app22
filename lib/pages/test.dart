import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:francepay/app/routes/app_pages.dart';
import 'package:francepay/pages/congratulationPage.dart';
import 'package:francepay/pages/mainMenu.dart';
import 'package:francepay/pages/newPayment.dart';
import 'package:francepay/pages/signIn.dart';
import 'package:get/get.dart';

import '../widgets/flagAppBar.dart';
import '../widgets/nextButton.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
        child: Column(
        children: [
        FlagAppBar(),
    Container(
    margin: EdgeInsets.only(left: width/4, right: width/4, top: height/20, bottom: height/20),
    child: Image.asset("assets/images/logo-main.png"),),
    Container(
    margin: EdgeInsets.only(right: 3*width/4),
    child: Text(
    "Balance",
    style: TextStyle(fontFamily: "sarabun", color: Color(0XFF757F8C), fontWeight: FontWeight.w500),
    ),
    ),
    Container(
    height: height/10,
    width: width/1.1,
    //color: Colors.red,
    child: Card(
    child: Center(
    child: Text("€ 00.00", textAlign: TextAlign.center, style: TextStyle(color: Color(0XFF118C4F), fontWeight: FontWeight.w600, fontFamily: "sarabun", fontSize: 20),),
    ),
    )
    ),
    Container(
    margin: EdgeInsets.only(top: height/15),
    width: 3*width/4,
    child: TextField(
    //controller: phoneController,
    scrollPadding:  EdgeInsets.only(bottom:40),
    decoration: InputDecoration(
    hintText: 'Montant de transfert',

    border: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(10.0),
    ),
    filled: true, //<-- SEE HERE
    fillColor: Color.fromRGBO(207, 203, 185, 0.6), //<-- SEE HERE
    ),
    )

    ),
    Container(
    margin: EdgeInsets.only(top: height/20, bottom: height/20),
    width: width/1.5,
    child: ElevatedButton(onPressed: () {
    // Navigator.push(
    // context,
    // MaterialPageRoute(builder: (context) => Transactions()),
    // );
    },
    style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Color(0XFF1d3364)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(18.0),

    )
    )
    ),
    child: Text("Add Money"),

    )
    )
    ],
    ),
    ),
    );
  }
}
