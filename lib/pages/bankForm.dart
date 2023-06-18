import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:francepay/widgets/nextButton.dart';

import '../widgets/flagAppBar.dart';
import 'congratulationPage.dart';

class BankForm extends StatefulWidget {
  const BankForm({Key? key}) : super(key: key);

  @override
  _BankFormState createState() => _BankFormState();
}

class _BankFormState extends State<BankForm> {
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const FlagAppBar(),
            Container(
              margin: EdgeInsets.only(left: width/4, right: width/4, top: height/20, bottom: height/40),
              child: Image.asset("assets/images/logo-main.png"),),
            Form(
              child: Column(
                children: [
                  Container(
                    child: Text("VEUILLEZ ENTRER VOS DONNEES", style: TextStyle(fontSize: 20, fontFamily: "sarabun", fontWeight: FontWeight.w500),),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: width/15, right: width/15, top: height/60),
                      child: Image.asset("assets/images/banksLogo.gif")
                  ),
                  Container(
                    margin: EdgeInsets.only(left: width/14, top: height/50),
                    child: Row(
                      children: [
                        Image.asset("assets/images/nameOffice.png", scale: 30),
                        Container(
                            margin: EdgeInsets.only(left: width/100),
                            child: Text("Nom du propriétaire",
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
                        hintText: 'Nom',

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
                        Image.asset("assets/images/bankGrey.jpg", scale: 30),
                        Container(
                            margin: EdgeInsets.only(left: width/100),
                            child: Text("Banque",
                              style: TextStyle(color: Color(0XFF757F8C),
                                  fontWeight: FontWeight.w500, fontSize: 12),))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: width/15, right: width/15, top: height/300),
                    child: TextFormField(
                      // Only numbers can be entered
                      scrollPadding:  EdgeInsets.only(bottom:40),
                      decoration: InputDecoration(
                        hintText: 'Banque',

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
                        Image.asset("assets/images/contractIcon.png", scale: 30),
                        Container(
                            margin: EdgeInsets.only(left: width/100),
                            child: Text("Numéro de contrat",
                              style: TextStyle(color: Color(0XFF757F8C),
                                  fontWeight: FontWeight.w500, fontSize: 12),))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: width/15, right: width/15, top: height/300),
                    child: TextFormField(
                      // Only numbers can be entered
                      scrollPadding:  EdgeInsets.only(bottom:40),
                      decoration: InputDecoration(
                        hintText: 'Contrat',

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
                        Image.asset("assets/images/passwordIcon.png", scale: 30),
                        Container(
                            margin: EdgeInsets.only(left: width/100),
                            child: Text("Mot de Passe",
                              style: TextStyle(color: Color(0XFF757F8C),
                                  fontWeight: FontWeight.w500, fontSize: 12),))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: width/15, right: width/15, top: height/300),
                    child: TextFormField(
                      // Only numbers can be entered
                      scrollPadding:  EdgeInsets.only(bottom:40),
                      decoration: InputDecoration(
                        hintText: 'Contrat',

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
                      margin: EdgeInsets.only(top: height/20, bottom: height/20),
                     // child: NextButton(buttonColor: Color(0XFF1d3364), text: "Suivant", nextPage: CongratulationPage(token: "",))
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
