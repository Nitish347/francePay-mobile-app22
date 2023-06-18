import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:francepay/pages/newPayment.dart';
import 'package:francepay/pages/welcome.dart';

import '../widgets/flagAppBar.dart';
import '../widgets/nextButton.dart';

class VerificationCode extends StatefulWidget {
  const VerificationCode({Key? key}) : super(key: key);



  @override
  State<StatefulWidget> createState() {
    return VerificationCodeState();
  }
}

  class VerificationCodeState extends State<VerificationCode> {

      @override
      Widget build(BuildContext context) {
        var height = MediaQuery
            .of(context)
            .size
            .height;
        var width = MediaQuery
            .of(context)
            .size
            .width;
        return Scaffold(
          // resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                //mainAxisSize: MainAxisSize.max,
                  children: [
                    const FlagAppBar(),
                    Container(
                      margin: EdgeInsets.only(left: width / 4,
                          right: width / 4,
                          top: height / 10,
                          bottom: height / 10),
                      child: Image.asset("assets/images/logo-main.png"),),
                    Container(
                      margin: EdgeInsets.only(
                          left: width / 6, right: width / 6, bottom: 0),
                      child: Text(
                        "VEUILLEZ VALIDER VOTRE COMPTE AVEC LE CODE QUE VOUS AVEZ RECU PAR SMS",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: width / 6,
                          right: width / 6,
                          bottom: 0,
                          top: height / 20),
                      child: Image.asset("assets/images/phoneNumber.gif"),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: height / 15),
                        child: Row(
                          children: [
                          ],
                        )
                    )
                  ]
              ),
            ),
          ),
        );
      }
    }

