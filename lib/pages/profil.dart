// import 'dart:convert';
// import 'dart:io';
// import 'dart:typed_data';
// import 'dart:ui' as ui;
// import 'dart:ui';
// import 'package:flutter/rendering.dart';
// import 'package:francepay/pages/qrScanPage.dart';
// import 'package:francepay/widgets/invoice.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:francepay/pages/bankForm.dart';
// import 'package:francepay/pages/phoneNumber.dart';
// import 'package:francepay/widgets/nextButton.dart';
// import 'package:qr_flutter/qr_flutter.dart';
// import '../widgets/flagAppBar.dart';
// import '../widgets/navigationDrawerWidget.dart';
// import 'cardForm.dart';
// import 'gerer.dart';
// import 'mainMenu.dart';
//
// class Profil extends StatefulWidget {
//   const Profil({Key? key}) : super(key: key);
//
//   @override
//   ProfilState createState() => ProfilState();
// }
//
// class ProfilState extends State<Profil> {
//   var qr = QrImage(
//     data: "787314480@FPAY",
//     version: QrVersions.auto,
//     size: 200.0,
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     final GlobalKey globalKey = GlobalKey();
//
//     int currentIndex = 4;
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       drawer: NavigationDrawerWidget(),
//       appBar: AppBar(
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(Icons.comment),
//             tooltip: 'Comment Icon',
//             onPressed: () {},
//           ), //IconButton
//           IconButton(
//             icon: Icon(Icons.notifications),
//             tooltip: 'Setting Icon',
//             onPressed: () {},
//           ), //IconButton
//         ], //<Wi
//         backgroundColor: Color(0XFF1d3364),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               height: height / 10,
//               margin: EdgeInsets.only(
//                   top: height / 50,
//                   bottom: height / 50,
//                   left: width / 20,
//                   right: width / 20),
//               child: Image.asset(
//                 "assets/images/logo-main.png",
//                 scale: 40,
//               ),
//             ),
//             Card(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Container(
//                     margin: EdgeInsets.only(
//                         right: width / 10,
//                         top: height / 50,
//                         bottom: height / 50,
//                         left: height / 50),
//                     height: height / 10,
//                     width: height / 10,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       image: DecorationImage(
//                           image: AssetImage('assets/images/photoIdentite.jpg'),
//                           fit: BoxFit.fill),
//                     ),
//                   ),
//                   Container(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           margin: EdgeInsets.only(bottom: height / 40),
//                           child: Row(
//                             children: [
//                               Container(
//                                 margin: EdgeInsets.only(right: width / 30),
//                                 child: Image.asset(
//                                   "assets/images/name.png",
//                                   scale: 20,
//                                 ),
//                               ),
//                               Container(
//                                 child: Text("Jad HARIRI"),
//                               )
//                             ],
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(bottom: height / 40),
//                           child: Row(
//                             children: [
//                               Container(
//                                 margin: EdgeInsets.only(right: width / 30),
//                                 child: Image.asset(
//                                   "assets/images/phoneIcon.png",
//                                   scale: 5,
//                                 ),
//                               ),
//                               Container(
//                                 child: Text("0787314480"),
//                               )
//                             ],
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             Container(
//                                 margin: EdgeInsets.only(right: width / 30),
//                                 child: Text(
//                                   "FPAY ID ",
//                                   style: TextStyle(
//                                       color: Color(0XFF1d3364),
//                                       fontSize: 10,
//                                       fontWeight: FontWeight.bold),
//                                 )),
//                             Container(
//                               child: Text("787314480@FPAY"),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: height / 10),
//               decoration:
//                   BoxDecoration(border: Border.all(color: Color(0XFF1d3364))),
//               // child: Card(
//               child: RepaintBoundary(
//                 key: globalKey,
//                 child: QrImage(
//                   data: "787314480@FPAY",
//                   version: QrVersions.auto,
//                   size: 200.0,
//                 ),
//               ),
//               //),
//             ),
//             Container(
//                 margin: EdgeInsets.only(top: height / 10),
//                 width: width / 3,
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     //await Share.share("Hello 787314480@FPAY is my France pay ID");
//                   },
//                   style: ButtonStyle(
//                       backgroundColor:
//                           MaterialStateProperty.all(Color(0xFFCED2D9)),
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                           RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30.0),
//                       ))),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                           child: Icon(
//                         Icons.share,
//                         size: 30,
//                         color: Colors.black,
//                       )),
//                       Container(
//                         child: Text(
//                           "Partager QR",
//                           style: TextStyle(fontSize: 10, color: Colors.black),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ))
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         fixedColor: Color(0XFF1d3364),
//         //backgroundColor: Color(0XFF1d3364),
//         showUnselectedLabels: true,
//         currentIndex: currentIndex,
//         type: BottomNavigationBarType.fixed,
//         elevation: 10.0,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home, color: Colors.grey),
//             label: "Accueil",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings, color: Colors.grey),
//             label: "Gérer",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.qr_code_scanner, color: Colors.grey),
//             label: "Scanner",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.message,
//               color: Colors.grey,
//             ),
//             label: "Messagerie",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.person,
//               color: Color(0XFF1d3364),
//             ),
//             label: "Profil",
//           )
//         ],
//         onTap: (currentIndex) {
//           switch (currentIndex) {
//             case 0:
//               {
//                 // Navigator.of(context).push(
//                 //     MaterialPageRoute(
//                 //         builder: (context) => MainMenu()));
//               }
//               break;
//
//             case 1:
//               {
//                 Navigator.of(context)
//                     .push(MaterialPageRoute(builder: (context) => Gerer()));
//               }
//               break;
//
//             case 2:
//               {
//                 Navigator.of(context).push(
//                     MaterialPageRoute(builder: (context) => QRScanPage()));
//               }
//               break;
//             case 3:
//               {
//                 // loading = false;
//                 //Navigator.of(context).push(
//                 //  MaterialPageRoute(
//                 //    builder: (context) => Messagerie(userId: userId,)));
//               }
//               break;
//             case 4:
//               {}
//               break;
//           }
//         },
//       ),
//     );
//   }
// }
