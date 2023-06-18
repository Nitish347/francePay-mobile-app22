import 'package:flutter/material.dart';

class FlagAppBar extends StatelessWidget {
  const FlagAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      height: height*1/15,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(child: Container(color: Color(0XFF1d3364))),

        Expanded(
          child: Container(color: Colors.white, child: Image.asset("assets/images/logo-only.png", scale: 0.5,fit: BoxFit.cover,)),

        ),
        Expanded(child: Container(color: Color(0XFFED2939))),
      ]),
    );
  }
}
