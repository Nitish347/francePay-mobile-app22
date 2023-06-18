import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:francepay/pages/welcome.dart';
import 'package:francepay/widgets/nextButton.dart';
import 'package:http/http.dart' as http;
import '../widgets/flagAppBar.dart';
import '../widgets/navigationDrawerWidget.dart';


class GenerateLink extends StatefulWidget {
  var amount;
  var message;
  GenerateLink({Key? key, required this.amount, required this.message}) : super(key: key);

  @override
  GenerateLinkState createState() => GenerateLinkState();
}

class GenerateLinkState extends State<GenerateLink> {

  /**postData() async{
    var response = await http.post(
      Uri.parse('http://api.france-pay.fr/transfer'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'amount': "5",
        "destinationWallet": widget.frPayId,
      }),
    );

    return response.body;
  }**/

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
              //Center(child: Text("Veuillez entrer les données de la transaction"),),

              Container(
                margin: EdgeInsets.only(left: width/15, right: width/15, top: height/300),
                child: Text("Montant: "+ widget.amount+" €"),
              ),
              Container(
                margin: EdgeInsets.only(left: width/15, right: width/15, top: height/300),
                child: Text("Message: " + widget.message),
              ),
              Container(
                margin: EdgeInsets.only(left: width/15, right: width/15, top: height/300),
                child: Text("https://f-pay.vercel.app/fr"),
              ),
              Container(
                  margin: EdgeInsets.only(top: height/20, bottom: height/20),
                  width: width/1.5,
                  child: ElevatedButton(onPressed: () {
                    Share.share("https://f-pay.vercel.app/fr");
                  },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color(0XFF1d3364)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),

                            )
                        )
                    ),
                    child: Text("Envoyer"),

                  )
              )
            ]
        ),
      ),
    );
  }
}
