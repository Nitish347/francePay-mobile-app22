

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:francepay/pages/manageAccounts.dart';
import 'package:francepay/pages/welcome.dart';

import '../widgets/flagAppBar.dart';
import '../widgets/nextButton.dart';

class NewPayment extends StatelessWidget {
  const NewPayment({Key? key}) : super(key: key);

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
                child: Text("UN NOUVEAU SYSTEME DE PAIEMENT REVOLUTIONNAIRE", textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(),
                child: Image.asset("assets/images/paymentQR.gif"),
              ),
              Container(
                margin: EdgeInsets.only(left: width/6, right: width/6, bottom: 0),
                child: Text("Réalisez vos transactions en un clin d’oeil, rien qu’en scannant le QR code de votre commerçant.  ", textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: height/15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                   // NextButton(buttonColor: Color(0XFFED2939), text: "Retour",nextPage: WelcomePage()),
                   // NextButton(buttonColor: Color(0XFF1d3364), text: "Suivant", nextPage: ManageAccounts(),),
                  ],
                ),
              )
            ]
        ),
      ),
    );
  }
}
