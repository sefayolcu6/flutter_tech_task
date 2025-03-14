import 'package:flutter/material.dart';

class CustomTextRich extends StatelessWidget {
  final String firstText;
  final String lastText;

  const CustomTextRich({super.key, required this.firstText, required this.lastText});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: firstText),
          TextSpan(
            text: lastText,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
