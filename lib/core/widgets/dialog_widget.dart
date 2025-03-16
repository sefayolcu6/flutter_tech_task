import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tech_task/core/helpers/custom_colors.dart';
import 'package:flutter_tech_task/core/widgets/button_widget.dart';

class DialogManager {
  static void customAlertDialog({required BuildContext context, required title, required List<Widget> alertBody, required String buttonText, required void Function() buttonOntap}) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          title,
          style: TextStyle(color: CustomColorConstant.instance.blueGrey),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: alertBody,
        ),
        actions: <Widget>[
          Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextButtonError(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  text: "no".tr()),
              CustomTextButtonSuccess(onTap: buttonOntap, text: buttonText),
            ],
          )),
        ],
      ),
    );
  }
}
