import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tech_task/core/helpers/custom_colors.dart';

Future customSuccessFlushbar({required BuildContext context, Widget? icon, Function()? onPressed, required String title, required String description}) {
  return Flushbar(
    icon: Icon(
      Icons.info,
      color: CustomColorConstant.instance.black,
    ),
    margin: const EdgeInsets.all(6.0),
    borderRadius: BorderRadius.circular(12),
    backgroundGradient: LinearGradient(colors: [
      CustomColorConstant.instance.green,
      CustomColorConstant.instance.blue100,
    ]),
    boxShadows:  [
      BoxShadow(
        color: CustomColorConstant.instance.orange,
        offset: Offset(0.0, 2.0),
        blurRadius: 3.0,
      )
    ],
    title: title,
    mainButton: IconButton(
      icon: icon ?? const SizedBox(),
      onPressed: onPressed,
    ),
    message: description,
    duration: const Duration(seconds: 4),
  ).show(context);
}