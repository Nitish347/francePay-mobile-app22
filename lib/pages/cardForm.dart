import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:francepay/pages/mainMenu.dart';
import 'package:francepay/widgets/nextButton.dart';
import 'package:http/http.dart' as http;
import '../widgets/flagAppBar.dart';
import 'congratulationPage.dart';

class CardForm extends StatefulWidget {
  String token;
  CardForm({Key? key, required this.token}) : super(key: key);

  @override
  _CardFormState createState() => _CardFormState();
}

class _CardFormState extends State<CardForm> {
  @override
  Widget build(BuildContext context) {

    postData(String email, String password) async{
      var response = await http.post(
        Uri.parse('https://api.france-pay.fr/api/auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{

        }),
      );

      return response.body;
    }

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
            Form(
              child: Column(
                children: [
                  Container(
                    child: Text("VEUILLEZ ENTRER VOS DONNEES", style: TextStyle(fontSize: 20, fontFamily: "sarabun", fontWeight: FontWeight.w500),),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: width/15, right: width/15, top: height/30),
                      child: Image.asset("assets/images/cardCompany.png")
                  ),
                  Container(
                    margin: EdgeInsets.only(left: width/14, top: height/50),
                    child: Row(
                      children: [
                        Image.asset("assets/images/cardHand.png", scale: 30),
                        Container(
                            margin: EdgeInsets.only(left: width/100),
                            child: Text("Numéro",
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
                        hintText: 'Numéro de carte',

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
                        Image.asset("assets/images/nameOffice.png", scale: 30),
                        Container(
                            margin: EdgeInsets.only(left: width/100),
                            child: Text("Nom",
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
                        hintText: 'Nom du propriétaire',

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
                        Container(
                          child: Row(
                            children: [
                              Image.asset("assets/images/calendar.png", scale: 30),
                              Container(
                                  margin: EdgeInsets.only(left: width/100),
                                  child: Text("Date d'expiration",
                                    style: TextStyle(color: Color(0XFF757F8C),
                                        fontWeight: FontWeight.w500, fontSize: 12),))
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: width/5.7),
                          child: Row(
                            children: [
                              Image.asset("assets/images/calendar.png", scale: 30),
                              Container(
                                  margin: EdgeInsets.only(left: width/100),
                                  child: Text("Date d'expiration",
                                    style: TextStyle(color: Color(0XFF757F8C),
                                        fontWeight: FontWeight.w500, fontSize: 12),))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: width/14, top: height/300),
                          width: width/2.5,
                          child: TextFormField(
                            scrollPadding:  EdgeInsets.only(bottom:40),
                            decoration: InputDecoration(
                                hintText: 'Date',

                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                filled: true, //<-- SEE HERE
                                fillColor: Color.fromRGBO(207, 203, 185, 0.6)),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: height/300),
                            width: width/2.5,
                            child: TextFormField(
                              scrollPadding:  EdgeInsets.only(bottom:40),
                              decoration: InputDecoration(
                                  hintText: 'CVC',

                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  filled: true, //<-- SEE HERE
                                  fillColor: Color.fromRGBO(207, 203, 185, 0.6)),
                            ))
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: height/20),
                      //child: NextButton(buttonColor: Color(0XFF1d3364), text: "Suivant", nextPage: MainMenu())
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
