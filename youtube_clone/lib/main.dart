import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '/pages/dashboard.dart';

void main() {
  runApp(MaterialApp(
    home: DashBoard(),
    //default theme is light therefore
    theme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
  ));
}
