import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:francepay/pages/mainMenu.dart';
import 'package:francepay/pages/profil.dart';
import 'package:francepay/pages/welcome.dart';
import 'package:francepay/widgets/nextButton.dart';

import '../widgets/flagAppBar.dart';
import '../widgets/navigationDrawerWidget.dart';
import 'congratulationPage.dart';
import 'newPayment.dart';

class CreateTransaction extends StatefulWidget {
  String frPayId = "";
  CreateTransaction({Key? key, this.frPayId = ""}) : super(key: key);

  @override
  CreateTransactionState createState() => CreateTransactionState();
}

class CreateTransactionState extends State<CreateTransaction> {
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(


      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: width/4, right: width/4, top: height/20, bottom: height/20),
              child: Image.asset("assets/images/logo-main.png"),),
            //Center(child: Text("Veuillez entrer les données de la transaction"),),
            Container(
              margin: EdgeInsets.only(right: 3*width/4),
              child: Text(
                "Solde",
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
              margin: EdgeInsets.only(left: width/14, top: height/50),
              child: Row(
                children: [
                  Image.asset("assets/images/receive.png", scale: 30),
                  Container(
                      margin: EdgeInsets.only(left: width/100),
                      child: Text("Id destinataire",
                        style: TextStyle(color: Color(0XFF757F8C),
                            fontWeight: FontWeight.w500, fontSize: 12),))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: width/15, right: width/15, top: height/300),
              child: TextFormField(
                initialValue: widget.frPayId,
                scrollPadding:  EdgeInsets.only(bottom:40),
                decoration: InputDecoration(
                  hintText: 'Fpay ID',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true, //<-- SEE HERE
                  fillColor: Color.fromRGBO(207, 203, 185, 0.6), //<-- SEE HERE
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: width/14, top: height/50),
              child: Row(
                children: [
                  Image.asset("assets/images/money 1.png", scale: 30),
                  Container(
                      margin: EdgeInsets.only(left: width/100),
                      child: Text("Montant",
                        style: TextStyle(color: Color(0XFF757F8C),
                            fontWeight: FontWeight.w500, fontSize: 12),))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: width/15, right: width/15, top: height/300),
              child: TextFormField(
                scrollPadding:  EdgeInsets.only(bottom:40),
                decoration: InputDecoration(
                  hintText: '0.00 €',

                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true, //<-- SEE HERE
                  fillColor: Color.fromRGBO(207, 203, 185, 0.6), //<-- SEE HERE
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: width/14, top: height/50),
              child: Row(
                children: [
                  Image.asset("assets/images/comment.png", scale: 30),
                  Container(
                      margin: EdgeInsets.only(left: width/100),
                      child: Text("Message",
                        style: TextStyle(color: Color(0XFF757F8C),
                            fontWeight: FontWeight.w500, fontSize: 12),))
                ],
              ),
            ),
            Container(
              height: height/5,
              margin: EdgeInsets.only(left: width/15, right: width/15, top: height/300),
              child: TextFormField(
                maxLines: 5,
                scrollPadding:  EdgeInsets.only(bottom:40),
                decoration: InputDecoration(
                  //hintText: '...',
                  //hintStyle: TextStyle(),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true, //<-- SEE HERE
                  fillColor: Color.fromRGBO(207, 203, 185, 0.6), //<-- SEE HERE
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: height/10, top: height/12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                //  NextButton(buttonColor: Color(0XFFED2939), text: "Quitter",nextPage: MainMenu()),
                  //NextButton(buttonColor: Color(0XFF000000), text: "Passer", nextPage: CongratulationPage(),),

                 // NextButton(buttonColor: Color(0XFF1d3364), text: "Suivant", nextPage: NewPayment(),),
                ],
              ),
            )
      ]
    ),
    ),
    );
  }
}
