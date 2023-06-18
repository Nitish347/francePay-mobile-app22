import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:francepay/widgets/nextButton.dart';
import 'package:http/http.dart' as http;
import 'package:francepay/widgets/flagAppBar.dart';
import 'package:francepay/pages/congratulationPage.dart';
import 'package:francepay/app/controllers/sigin_controller.dart';
import 'package:quickalert/quickalert.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  //SignIn({Key? key}) : super(key: key);

  @override
  CreateSignInState createState() => CreateSignInState();
}

class CreateSignInState extends State<SignIn> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final SigninController sigInController = Get.put(SigninController());
  bool isLoading = false;
  bool _passwordVisible = false;

  paymentSuccess(data) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: data,
    );
  }

  paymentFaield(data) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Oops...',
      text: data,
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: isLoading
            ? Container(
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Column(
                children: [
                  const FlagAppBar(),
                  Container(
                    margin: EdgeInsets.only(
                        left: width / 4,
                        right: width / 4,
                        top: height / 20,
                        bottom: height / 20),
                    child: Image.asset("assets/images/logo-main.png"),
                  ),
                  // Form(
                  Column(
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                              left: width / 10,
                              right: width / 10,
                              bottom: height / 20),
                          child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: 'Email',

                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true, //<-- SEE HERE
                              fillColor: Color.fromRGBO(
                                  207, 203, 185, 0.6), //<-- SEE HERE
                            ),
                          )),
                      Container(
                          margin: EdgeInsets.only(
                              left: width / 10,
                              right: width / 10,
                              bottom: height / 20),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: passwordController,
                            obscureText: !_passwordVisible,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),

                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true, //<-- SEE HERE
                              fillColor: Color.fromRGBO(
                                  207, 203, 185, 0.6), //<-- SEE HERE
                            ),
                          )),
                    ],
                  ),
                  //   ),
                  Container(
                    margin: EdgeInsets.only(top: height / 20),
                    child: SizedBox(
                      width: width / 4,
                      height: height / 20,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (emailController.text == null ||
                              emailController.text.isEmpty) {
                            paymentFaield("Email is empty");
                          } else if (passwordController.text == null ||
                              passwordController.text.isEmpty) {
                            paymentFaield("Password is empty");
                          } else {
                            setState(() {
                              isLoading = true;
                            });
                            // await Future.delayed(Duration(seconds: 4));
                            var data = await sigInController.SiginUser(
                                emailController.text, passwordController.text);
                            // print("data"+data);

                            if (data['status'] == true) {
                              paymentSuccess(data['msg']);
                              Get.offAllNamed("/bottombar");
                            } else if (data['status'] == false) {
                              paymentFaield(data['msg']);
                            } else {
                              paymentFaield(data['msg']);
                            }

                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0XFF1d3364)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
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
