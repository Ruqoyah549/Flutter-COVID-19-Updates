import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final Color color;

  MyText({this.text, this.color});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 35.0,
        color: color,
        letterSpacing: 1.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
