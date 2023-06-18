

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:francepay/pages/newPayment.dart';
import 'package:francepay/pages/phoneNumber.dart';
import 'package:francepay/pages/welcome.dart';

import '../widgets/flagAppBar.dart';
import '../widgets/nextButton.dart';

class ManageAccounts extends StatelessWidget {
  const ManageAccounts({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          //mainAxisSize: MainAxisSize.max,
            children: [
              const FlagAppBar(),
              Container(
                margin: EdgeInsets.only(left: width/4, right: width/4, top: height/10, bottom: height/10),
                child: Image.asset("assets/images/logo-main.png"),),
              Container(
                margin: EdgeInsets.only(left: width/6, right: width/6, bottom: 0),
                child: Text("GERER TOUS VOS COMPTES BANCAIRE EN UNE SEULE APPLICATION", textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: width/6, right: width/6, bottom: 0, top: height/20),
                child: Image.asset("assets/images/manageBank.png"),
              ),

              Container(
                margin: EdgeInsets.only(top: height/15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  //  NextButton(buttonColor: Color(0XFFED2939), text: "Retour",nextPage: NewPayment()),
                   // NextButton(buttonColor: Color(0XFF1d3364), text: "Suivant", nextPage: PhoneNumber(),),
                  ],
                ),
              )
            ]
        ),
      ),
    );
  }
}