import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tech_task/core/helpers/custom_colors.dart';

Future customErrorFlushbar({required BuildContext context, required String title, Widget? icon, Function()? onPressed, required String description}) {
  return Flushbar(
    icon: Icon(
      Icons.dangerous_outlined,
      color: CustomColorConstant.instance.black,
    ),
    margin: const EdgeInsets.all(6.0),
    borderRadius: BorderRadius.circular(12),
    backgroundGradient: LinearGradient(colors: [CustomColorConstant.instance.red, CustomColorConstant.instance.black]),
    boxShadows: const [
      BoxShadow(
        color: Colors.black,
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

Future customInfoFlushbar({required BuildContext context, required String title, Widget? icon, Function()? onPressed, required String description}) {
  return Flushbar(
    icon: Icon(
      Icons.info,
      color: CustomColorConstant.instance.black,
    ),
    margin: const EdgeInsets.all(6.0),
    borderRadius: BorderRadius.circular(12),
    backgroundGradient: const LinearGradient(colors: [Colors.orange, Colors.teal]),
    boxShadows: const [
      BoxShadow(
        color: Colors.orange,
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
    boxShadows: const [
      BoxShadow(
        color: Colors.orange,
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

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> customSnackBar({required BuildContext context, required String message, Function()? actionOnpress, String? actionText}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Text(message),
        ],
      ),
      backgroundColor: CustomColorConstant.instance.green,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      action: SnackBarAction(label: actionText ?? "", textColor: CustomColorConstant.instance.white, onPressed: actionOnpress ?? () {}),
      duration: const Duration(seconds: 3),
    ),
  );
}
