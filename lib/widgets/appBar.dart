import 'package:flutter/material.dart';
import 'package:francepay/app/views/request_screen.dart';

import '../Constants/Constants.dart';

AppBar FpayAppBar(double height, BuildContext context) {
  return AppBar(
      iconTheme: IconThemeData(color: blueColor),
      centerTitle: true,
      title: Image.asset("assets/images/logo-only.png", height: height * 0.18),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.comment,
          ),
          tooltip: 'Comment Icon',
          onPressed: () {},
        ), //IconButton

        Center(child: bellIcon(true, context))
      ],
      backgroundColor: Colors.white);
}

Widget bellIcon(bool noti, BuildContext context) {
  return Stack(
    children: [
      IconButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => RequestScreen()));
        },
        icon: Icon(Icons.notifications),
      ),
      if (noti)
        Positioned(
          top: 8.0,
          right: 8.0,
          child: Container(
            width: 10.0,
            height: 10.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
          ),
        ),
    ],
  );
}
