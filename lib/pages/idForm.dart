import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:francepay/widgets/nextButton.dart';
import 'package:http/http.dart' as http;
import 'package:quickalert/models/quickalert_type.dart';
import '../app/controllers/sigin_controller.dart';
import '../widgets/flagAppBar.dart';
import 'congratulationPage.dart';
import 'package:quickalert/quickalert.dart';
import 'package:get/get.dart';

class IdForm extends StatefulWidget {
  String verify;

  IdForm({Key? key, required this.verify}) : super(key: key);

  @override
  _IdFormState createState() => _IdFormState();
}

class _IdFormState extends State<IdForm> {
  final SigninController sigInController = Get.put(SigninController());
  bool isLoading = false;

  paymentSuccess(data) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: data,
    );
  }

  paymentFailed(data) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Oops...',
      text: data,
    );
  }

  postData(String firstName, String lastName, String dateOfBirth,
      String password) async {
    var response = await http.post(
      Uri.parse('https://api.france-pay.fr/api/auth/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'firstname': firstName,
        "lastname": lastName,
        "password": password,
        "dateOfBirth": dateOfBirth,
        "register_verify": widget.verify,
      }),
    );

    return response.body;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController dateController = TextEditingController();
    TextEditingController pwController = TextEditingController();
    TextEditingController confirmPwController = TextEditingController();

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const FlagAppBar(),
            Container(
              child: Image.asset(
                "assets/images/logo-main.png",
                height: height * 0.05,
              ),
            ),
            Form(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: width / 10, top: height / 50),
                    child: Row(
                      children: [
                        Image.asset("assets/images/nameOffice.png", scale: 30),
                        Container(
                            margin: EdgeInsets.only(left: width / 100),
                            child: Text(
                              "Nom",
                              style: TextStyle(
                                  color: Color(0XFF757F8C),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ))
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          left: width / 10,
                          right: width / 10,
                          bottom: height / 20),
                      child: TextFormField(
                        controller: lastNameController,
                        decoration: InputDecoration(
                          hintText: 'Nom',

                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true, //<-- SEE HERE
                          fillColor:
                              Color.fromRGBO(207, 203, 185, 0.6), //<-- SEE HERE
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(left: width / 10),
                    child: Row(
                      children: [
                        Image.asset("assets/images/nameOffice.png", scale: 30),
                        Container(
                            margin: EdgeInsets.only(left: width / 100),
                            child: Text(
                              "Prénoms",
                              style: TextStyle(
                                  color: Color(0XFF757F8C),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ))
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          left: width / 10,
                          right: width / 10,
                          bottom: height / 20),
                      child: TextFormField(
                        controller: firstNameController,
                        decoration: InputDecoration(
                          hintText: 'Prénom',

                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true, //<-- SEE HERE
                          fillColor:
                              Color.fromRGBO(207, 203, 185, 0.6), //<-- SEE HERE
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(left: width / 10),
                    child: Row(
                      children: [
                        Image.asset("assets/images/calendar.png", scale: 30),
                        Container(
                            margin: EdgeInsets.only(left: width / 100),
                            child: Text(
                              "Date de naissance",
                              style: TextStyle(
                                  color: Color(0XFF757F8C),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ))
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          left: width / 10,
                          right: width / 10,
                          bottom: height / 20),
                      child: TextFormField(
                        controller: dateController,
                        decoration: InputDecoration(
                          hintText: 'JJ/MM/AAAA',

                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true, //<-- SEE HERE
                          fillColor:
                              Color.fromRGBO(207, 203, 185, 0.6), //<-- SEE HERE
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(left: width / 10),
                    child: Row(
                      children: [
                        Image.asset("assets/images/passwordIcon.png",
                            scale: 30),
                        Container(
                            margin: EdgeInsets.only(left: width / 100),
                            child: Text(
                              "Mot de passe",
                              style: TextStyle(
                                  color: Color(0XFF757F8C),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ))
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          left: width / 10,
                          right: width / 10,
                          bottom: height / 20),
                      child: TextFormField(
                        controller: pwController,
                        decoration: InputDecoration(
                          hintText: 'Mot de Passe',

                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true, //<-- SEE HERE
                          fillColor:
                              Color.fromRGBO(207, 203, 185, 0.6), //<-- SEE HERE
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(left: width / 10),
                    child: Row(
                      children: [
                        Image.asset("assets/images/passwordIcon.png",
                            scale: 30),
                        Container(
                            margin: EdgeInsets.only(left: width / 100),
                            child: Text(
                              "Mot de passe",
                              style: TextStyle(
                                  color: Color(0XFF757F8C),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ))
                      ],
                    ),
                  ),
                  Container(
                      margin:
                          EdgeInsets.only(left: width / 10, right: width / 10),
                      child: TextFormField(
                        controller: confirmPwController,
                        decoration: InputDecoration(
                          hintText: 'Confirmation de mot de passe',

                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true, //<-- SEE HERE
                          fillColor:
                              Color.fromRGBO(207, 203, 185, 0.6), //<-- SEE HERE
                        ),
                      ))
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: height / 20, bottom: height / 20),
                width: width / 1.5,
                child: ElevatedButton(
                  onPressed: () async {
                    if (firstNameController.text == null ||
                        firstNameController.text.isEmpty) {
                      paymentFailed("Espace nom incomplet");
                    } else if (lastNameController.text == null ||
                        lastNameController.text.isEmpty) {
                      paymentFailed("Espace prénom incomplet");
                    } else if (dateController.text == null ||
                        dateController.text.isEmpty) {
                      paymentFailed("Date incorrect");
                    } else if (pwController.text == null ||
                        pwController.text.isEmpty) {
                      paymentFailed("Mot de passe invalide");
                    } else if (confirmPwController.text == null ||
                        confirmPwController.text.isEmpty) {
                      paymentFailed("Confirmation de mot de passe incorrect");
                    } else {
                      setState(() {
                        isLoading = true;
                      });

                      var data = await sigInController.RegisterUser(
                          firstNameController.text,
                          lastNameController.text,
                          pwController.text,
                          "123",
                          widget.verify);

                      print("-----------$data");

                      // if (data['wallet_id'] != null &&
                      //     data['wallet_id'] != "") {
                      paymentSuccess(data['msg']);
                      Get.toNamed("/home");
                      print(data);
                      // } else if (data['status'] == false) {
                      //   paymentFailed(data['msg']);
                      // } else {
                      //   paymentFailed(data['msg']);
                    }

                    setState(() {
                      isLoading = false;
                    });
                  },

                  /*var response = await postData(firstNameController.text,
                  lastNameController.text,
                  dateController.text,
                  pwController.text);
              Map<String, dynamic> data = json.decode(response);
              print(data);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CongratulationPages(token: "",)),
              );*/
                  // },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0XFF1d3364)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                      ))),
                  child: Text("CONTINUER"),
                )),
          ],
        ),
      ),
    );
  }
}
