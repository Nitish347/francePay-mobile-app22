import 'package:flutter/material.dart';

Widget Logo(double height) {
  return Container(
    child: Image.asset(
      "assets/images/logo-main.png",
      height: height * 0.12,
    ),
  );
}
