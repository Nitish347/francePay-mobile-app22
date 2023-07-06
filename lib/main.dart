import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:francepay/pages/welcome.dart';
import 'package:francepay/widgets/flagAppBar.dart';
//import 'package:francepay/app/routes/app_pages.dart';
import 'app/routes/app_pages.dart';

import 'package:get/get.dart';

import 'app/views/contact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fpay Wallet',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      // home: ContactsPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          ),
      // home: const MyHomePage(),
    );
  }
}

/*
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var done = false;

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
   // SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    Future.delayed(const Duration(seconds: 5), (){
      
      if(!done) {
        done = true;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AppPages),

        );
      }
    });
    return Scaffold(
          body: SafeArea(
              child: Column(
                //mainAxisSize: MainAxisSize.max,
              children: [
                const FlagAppBar(),
                Container(
                  margin: EdgeInsets.only(top: height/8, left: width/5, right: width/5),
                  child: Image.asset("assets/images/logo-main.png"),),
          Spacer(),
              Center(

                    child: Image.asset("assets/images/monuments.png"),
                    ),

          ])),
    );
  }
}*/
