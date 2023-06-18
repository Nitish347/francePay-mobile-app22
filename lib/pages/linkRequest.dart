import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:francepay/pages/GenerateLink.dart';
import 'package:share/share.dart';
import 'package:francepay/pages/welcome.dart';
import 'package:francepay/widgets/nextButton.dart';
import 'package:http/http.dart' as http;
import '../widgets/flagAppBar.dart';
import '../widgets/navigationDrawerWidget.dart';


class LinkRequest extends StatefulWidget {
  String frPayId = "";
  LinkRequest({Key? key, this.frPayId = ""}) : super(key: key);

  @override
  LinkRequestState createState() => LinkRequestState();
}

class LinkRequestState extends State<LinkRequest> {

  postData() async{
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
  }

  @override
  Widget build(BuildContext context) {


    TextEditingController amountControl = new TextEditingController();
    TextEditingController messageControl = new TextEditingController();
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
                  controller: amountControl,
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
                  controller: messageControl,
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
                  margin: EdgeInsets.only(top: height/20, bottom: height/20),
                  width: width/1.5,
                  child: ElevatedButton(onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GenerateLink(amount: amountControl.text, message: messageControl.text,)),
                    );
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
