import 'package:flutter/material.dart';
import 'package:flutter_tech_task/core/helpers/custom_colors.dart';
import 'package:flutter_tech_task/core/helpers/custom_paddings.dart';

class CustomTextButtonError extends StatefulWidget {
  final void Function() onTap;
  final String text;

  const CustomTextButtonError({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  _CustomTextButtonErrorState createState() => _CustomTextButtonErrorState();
}

class _CustomTextButtonErrorState extends State<CustomTextButtonError> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        side: BorderSide(color: CustomColorConstant.instance.red, width: 2),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
      ),
      onPressed: widget.onTap,
      child: Padding(
        padding: CustomPaddingConstant.instance.appPaddingSymmetricHorizontal12,
        child: Text(widget.text, style: TextStyle(color: CustomColorConstant.instance.red, fontSize: 14, fontWeight: FontWeight.w500)),
      ),
    );
  }
}

class CustomTextButtonSuccess extends StatefulWidget {
  final void Function() onTap;
  final String text;

  const CustomTextButtonSuccess({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  _CustomTextButtonSuccessState createState() => _CustomTextButtonSuccessState();
}

class _CustomTextButtonSuccessState extends State<CustomTextButtonSuccess> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        side: BorderSide(color: CustomColorConstant.instance.primaryColor, width: 2),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
      ),
      onPressed: widget.onTap,
      child: Padding(
        padding: CustomPaddingConstant.instance.appPaddingSymmetricHorizontal12,
        child: Text(widget.text, style: TextStyle(color: CustomColorConstant.instance.primaryColor, fontSize: 14, fontWeight: FontWeight.w500)),
      ),
    );
  }
}