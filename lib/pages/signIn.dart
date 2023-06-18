import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:francepay/widgets/nextButton.dart';
import 'package:http/http.dart' as http;
import '../widgets/flagAppBar.dart';
import 'congratulationPage.dart';

class SignIn extends StatefulWidget {


  SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  postData(String email, String password) async{
    var response = await http.post(
      Uri.parse('https://api.france-pay.fr/api/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        "password": password,
      }),
    );

    return response.body;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController emailController = TextEditingController();

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
                      margin: EdgeInsets.only(left: width/10, right: width/10, bottom: height/20),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',

                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true, //<-- SEE HERE
                          fillColor: Color.fromRGBO(207, 203, 185, 0.6), //<-- SEE HERE
                        ),
                      )
                  ),
                  Container(
                      margin: EdgeInsets.only(left: width/10, right: width/10, bottom: height/20),
                      child: TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true, //<-- SEE HERE
                          fillColor: Color.fromRGBO(207, 203, 185, 0.6), //<-- SEE HERE
                        ),
                      )
                  ),



                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: height/20),
              child: SizedBox(
                width: width/4,
                height: height/20,
                child: ElevatedButton(onPressed: () async{
                  print("Loadingg.....");
                  var response = await postData(emailController.text,
                      passwordController.text);
                  Map<String, dynamic> data = json.decode(response);
                  print(data["token"]["accessToken"]);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CongratulationPage(token: data["token"]["accessToken"],)),
                  );

                },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(

                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),

                        )
                    ),
                    backgroundColor:  MaterialStateProperty.all(Colors.black),
                  ),
                  child: Text("Envoyer"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
