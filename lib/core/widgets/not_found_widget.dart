import 'package:flutter/material.dart';

class NotFoundWidget extends StatelessWidget {
  final String title;
  final String desc;
  const NotFoundWidget({super.key, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/not_found.jpg"),
          Text(
            title,
            style: TextStyle(fontSize: 20),
          ),
          Text(desc),
        ],
      ),
    );
  }
}
