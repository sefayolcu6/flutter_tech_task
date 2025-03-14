import 'package:flutter/material.dart';
import 'package:flutter_tech_task/core/helpers/custom_paddings.dart';

class AppTextFormField extends StatefulWidget {
  final String label;
  final FocusNode? focusNode;
  final bool? obscureText;
  final TextEditingController controller;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final bool? readOnly;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final void Function()? suffixIconOnPressed;

  const AppTextFormField({
    Key? key,
    required this.label,
    this.focusNode,
    this.obscureText,
    required this.controller,
    this.onTap,
    this.prefixIcon,
    this.readOnly,
    this.validator,
    this.onChanged,
    this.suffixIconOnPressed,
  }) : super(key: key);

  @override
  _AppTextFormFieldState createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CustomPaddingConstant.instance.appPaddingAll4,
      child: TextFormField(
        onChanged: widget.onChanged,
        validator: widget.validator,
        onTap: widget.onTap,
        focusNode: widget.focusNode,
        readOnly: widget.readOnly ?? false,
        textAlign: TextAlign.start,
        obscureText: widget.obscureText ?? false,
        controller: widget.controller,
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          suffixIcon: IconButton(
            onPressed: () {
              widget.controller.clear();
              widget.focusNode?.unfocus();
              widget.suffixIconOnPressed!();
            },
            icon: const Icon(Icons.close),
          ),
          labelText: widget.label,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
          ),
        ),
      ),
    );
  }
}
