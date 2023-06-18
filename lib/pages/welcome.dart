import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:francepay/app/routes/app_pages.dart';
import 'package:francepay/pages/congratulationPage.dart';
import 'package:francepay/pages/mainMenu.dart';
import 'package:francepay/pages/newPayment.dart';
import 'package:francepay/pages/signIn.dart';
import 'package:get/get.dart';

import '../widgets/flagAppBar.dart';
import '../widgets/logo.dart';
import '../widgets/nextButton.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

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
              SizedBox(
                height: height * 0.09,
              ),
              Logo(height),
              SizedBox(
                height: height * 0.07,
              ),
              // Container(
              //   margin: EdgeInsets.only(
              //       left: width / 5,
              //       right: width / 5,
              //       top: height / 10,
              //       bottom: height / 20),
              //   child: Image.asset("assets/images/logo-main.png"),
              // ),
              Container(
                margin: EdgeInsets.only(left: width / 6, right: width / 6),
                child: Text(
                  "Contrôlez plusieurs comptes bancaires avec une seule application",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: height * 0.03, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: height * 0.15,
              ),
              Container(
                margin: EdgeInsets.only(top: height / 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //login button here
                    Container(
                        child: NextButton(
                            buttonColor: Color(0XFFED2939),
                            text: "Se connecter",
                            nextPage: "/login")),
                    Container(
                        child: NextButton(
                            buttonColor: Color(0XFF1D3364),
                            text: "S'inscrire",
                            nextPage: "/signup")),
                    //  NextButton(buttonColor: Color(0XFF1d3364), text: "Créer un compte", nextPage: NewPayment(),),
                    //  NextButton(buttonColor: Color(0XFFED2939), text: "Signup", nextPage: NewPayment(),),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
