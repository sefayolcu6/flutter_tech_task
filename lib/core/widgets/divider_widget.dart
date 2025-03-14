import 'package:flutter/material.dart';

Widget customDivider({Color? color, double? endIndent, double? indent, double? height, double? thickness}) {
  return Divider(
    color: color,
    endIndent: endIndent,
    height: height,
    indent: indent,
    thickness: thickness,
  );
}

Widget customVerticalDivider({Color? color, double? endIndent, double? indent, double? height, double? thickness}) {
  return VerticalDivider(
    color: color,
    endIndent: endIndent,
    indent: indent,
    thickness: thickness,
  );
}
