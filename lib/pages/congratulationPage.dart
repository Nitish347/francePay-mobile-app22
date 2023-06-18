import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:francepay/pages/bankForm.dart';
import 'package:francepay/pages/phoneNumber.dart';
import 'package:francepay/pages/profil.dart';
import 'package:francepay/widgets/nextButton.dart';

import '../widgets/flagAppBar.dart';
import 'cardForm.dart';
import 'mainMenu.dart';


class CongratulationPage extends StatefulWidget {
  String token;
  CongratulationPage({Key? key, required this.token}) : super(key: key);

  @override
  CongratulationPageState createState() => CongratulationPageState();
}


class CongratulationPageState extends State<CongratulationPage> {


  @override
  Widget build(BuildContext context) {
  print(widget.token);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const FlagAppBar(),
            Container(
              margin: EdgeInsets.only(left: width/4, right: width/4, top: height/20, bottom: height/20),
              child: Image.asset("assets/images/logo-main.png"),),
            Container(
              margin: EdgeInsets.only(left: width/6, right: width/6, bottom: 0),
              child: Text("Bienvenue dans l'univers de France Pay,"
                  " pour pouvoir profiter pleinement de nos service "
                  "vous devez connecter votre compte bancaire ou une carte bancaire",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      height: height/9,
                      width: width/3.5,
                      child: GestureDetector(
                        onTap:() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CardForm(token: widget.token,)),
                          );
                        },
                        child: Card(
                            color: Color(0XFF1d3364),
                            child: Align(
                                alignment: Alignment.center,
                                child: Image.asset("assets/images/addCardIcon.png", scale: 15,)
                            )
                        ),
                      ),
                    ),
                    Container(
                        child: Text("Carte bancaire", style: TextStyle(fontSize: 10, fontFamily: "sarabun", fontWeight: FontWeight.w600),)
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: height/9,
                      width: width/3.5,
                      child: GestureDetector(
                        onTap:() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BankForm()),
                          );
                        },
                        child: Card(
                            color: Color(0XFFED2939),
                            child: Align(
                                alignment: Alignment.center,
                                child: Image.asset("assets/images/bankWhite.png", scale: 10,)
                            )
                        ),
                      ),
                    ),
                    Container(
                        child: Text("Compte en banque", style: TextStyle(fontSize: 10, fontFamily: "sarabun", fontWeight: FontWeight.w600),)
                    )
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: height/40),
             // child: NextButton(buttonColor: Color(0XFF1d3364), text: "Suivant", nextPage: Profil())
            )
          ],
        ),
      ),
    );
  }
}
