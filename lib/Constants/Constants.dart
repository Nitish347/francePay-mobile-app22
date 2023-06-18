import 'dart:ui';
import 'package:flutter/material.dart';

class Constants {
  static final neumorphic1 = [
    BoxShadow(
      color: Colors.white.withOpacity(0.2),
      blurRadius: 1.0,
    ),
    BoxShadow(
        color: Colors.black.withOpacity(0.2),
        // offset: Offset(2.0, 2.0),
        blurRadius: 1.0)
  ];
}

final shadow = [
  BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset.fromDirection(20))
];

Color blueColor = Color(0XFF1d3364);

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
