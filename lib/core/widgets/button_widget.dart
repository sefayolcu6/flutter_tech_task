import 'package:flutter/material.dart';
import 'package:flutter_tech_task/core/helpers/custom_colors.dart';
import 'package:flutter_tech_task/core/helpers/custom_paddings.dart';
import 'package:flutter_tech_task/core/mixins/utils.dart';

class CustomElevatedButton extends StatefulWidget {
  final Widget child;
  final void Function() onPressed;

  const CustomElevatedButton({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  @override
  _CustomElevatedButtonState createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      child: widget.child,
    );
  }
}

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
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
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
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Text(widget.text, style: TextStyle(color: CustomColorConstant.instance.primaryColor, fontSize: 14, fontWeight: FontWeight.w500)),
      ),
    );
  }
}

class CustomGeneralButton extends StatefulWidget {
  final void Function() onPressed;
  final String text;

  const CustomGeneralButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  _CustomGeneralButtonState createState() => _CustomGeneralButtonState();
}

class _CustomGeneralButtonState extends State<CustomGeneralButton> with Utils {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CustomPaddingConstant.instance.appPaddingAll2,
      child: SizedBox(
        height: screenHeigth(context) * 0.06,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: CustomColorConstant.instance.blueGrey,
          ),
          onPressed: widget.onPressed,
          child: Text(
            widget.text,
            style: TextStyle(
              color: CustomColorConstant.instance.white,
              fontStyle: FontStyle.normal,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomElevatedButtonIcon extends StatefulWidget {
  final void Function() onTap;
  final String label;
  final IconData icon;

  const CustomElevatedButtonIcon({
    Key? key,
    required this.onTap,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  _CustomElevatedButtonIconState createState() => _CustomElevatedButtonIconState();
}

class _CustomElevatedButtonIconState extends State<CustomElevatedButtonIcon> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(widget.icon), // Burada ikon belirlenir
      label: Text(widget.label), // Burada metin belirlenir
      style: ElevatedButton.styleFrom(
        side: BorderSide(color: CustomColorConstant.instance.purple),
      ),
      onPressed: widget.onTap,
    );
  }
}
