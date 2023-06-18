

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:francepay/pages/dynamicQR.dart';



import '../widgets/flagAppBar.dart';
import '../widgets/nextButton.dart';


class ChooseAmount extends StatefulWidget {
  const ChooseAmount({Key? key}) : super(key: key);

  @override
  ChooseAmountState createState() => ChooseAmountState();
}





class ChooseAmountState extends State<ChooseAmount> {

  bool showError = false;



  @override
  Widget build(BuildContext context) {


    TextEditingController phoneController = TextEditingController();
    Map<String, String> phoneNumber;
    String pattern = r'^(?:[+0]9)?[0-9]{10}$';
    RegExp exp = RegExp(pattern);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var response;

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            //mainAxisSize: MainAxisSize.max,
              children: [
                const FlagAppBar(),
                Container(
                    margin: EdgeInsets.only(left: width/4, right: width/4, top: height/10, bottom: height/10),
                    child: Image.asset("assets/images/logo-main.png", scale: 25)),
                Container(
                    //margin: EdgeInsets.only(right: width/3.5),
                    child: Text("Montant QR dynamique", style: TextStyle(fontFamily: "Inter", fontWeight:  FontWeight.w700, fontSize: 16))
                ),
                Container(
                  margin: EdgeInsets.only(left: width/11, right: width/10, top: height/100),
                  child: Text("Veuillez saisir le montant de transfert.", style: TextStyle(fontFamily: "Inter",)),

                ),
                Container(
                  margin: EdgeInsets.only(left: width/14, top: height/50),
                  child: Row(
                    children: [
                      Image.asset("assets/images/nameOffice.png", scale: 30),
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
                    controller: phoneController,
                    scrollPadding:  EdgeInsets.only(bottom:40),
                    decoration: InputDecoration(
                      hintText: 'Montant',

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
                    margin: EdgeInsets.only(top: height/10),
                    width: width/1.5,
                    child: ElevatedButton(onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DynamicQR(amount: phoneController.text,)),
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
                      child: Text("Génerer QR"),

                    )
                )
              ]
          ),
        ),
      ),
    );
  }
}




