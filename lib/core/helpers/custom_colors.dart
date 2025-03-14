import 'package:flutter/material.dart';

class CustomColorConstant {
  static final CustomColorConstant _instance = CustomColorConstant._init();
  static CustomColorConstant get instance => _instance;
  CustomColorConstant._init();

  final Color red = Colors.red;
  final Color green = Colors.green;
  final Color primarygreen = Color.fromARGB(255, 27, 141, 31);
  final Color blue = Colors.blue;
  final Color yellow = Colors.yellow;
  final Color orange = Colors.orange;
  final Color pink = Colors.pink;
  final Color purple = Colors.purple;
  final Color deepPurple = Colors.deepPurple;
  final Color indigo = Colors.indigo;
  final Color cyan = Colors.cyan;
  final Color teal = Colors.teal;
  final Color lime = Colors.lime;
  final Color amber = Colors.amber;
  final Color brown = Colors.brown;
  final Color grey = Colors.grey;
  final Color ligthGrey = const Color.fromARGB(255, 212, 210, 210);
  final Color blueGrey = Colors.blueGrey;
  final Color lightBlue = Colors.lightBlue;
  final Color lightGreen = Colors.lightGreen;
  final Color deepOrange = Colors.deepOrange;
  final Color black = Colors.black;
  final Color themeColor = Color.fromARGB(255, 39, 116, 136);
  final Color white = Colors.white;
  final Color primaryWhite = const Color.fromARGB(255, 240, 239, 239);
  final Color transparent = Colors.transparent;

  final Color redAccent = Colors.redAccent;
  final Color greenAccent = Colors.greenAccent;
  final Color blueAccent = Colors.blueAccent;
  final Color primaryColor = Color.fromARGB(255, 6, 66, 168);
  final Color yellowAccent = Colors.yellowAccent;
  final Color orangeAccent = Colors.orangeAccent;
  final Color pinkAccent = Colors.pinkAccent;
  final Color purpleAccent = Colors.purpleAccent;
  final Color deepPurpleAccent = Colors.deepPurpleAccent;
  final Color indigoAccent = Colors.indigoAccent;
  final Color cyanAccent = Colors.cyanAccent;
  final Color tealAccent = Colors.tealAccent;
  final Color limeAccent = Colors.limeAccent;
  final Color amberAccent = Colors.amberAccent;
  final Color brownAccent = Colors.brown;
  final Color greyAccent = Colors.grey;
  final Color blueGreyAccent = Colors.blueGrey;

  final Color lightBlueAccent = Colors.lightBlueAccent;
  final Color lightGreenAccent = Colors.lightGreenAccent;
  final Color deepOrangeAccent = Colors.deepOrangeAccent;

  // Custom shades for existing colors
  final Color red50 = Colors.red.shade50;
  final Color red100 = Colors.red.shade100;
  final Color red200 = Colors.red.shade200;
  final Color green50 = Colors.green.shade50;
  final Color green100 = Colors.green.shade100;
  final Color green200 = Colors.green.shade200;
  final Color blue50 = Colors.blue.shade50;
  final Color blue100 = Colors.blue.shade100;
  final Color blue200 = Colors.blue.shade200;
}
