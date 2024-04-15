import 'package:flutter/material.dart';

class HelperFunctions {
//navigate
  static void nextScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }
}
