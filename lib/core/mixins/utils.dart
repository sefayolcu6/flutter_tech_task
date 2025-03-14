import 'package:flutter/material.dart';

mixin Utils {
  double screenHeigth(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }


}
