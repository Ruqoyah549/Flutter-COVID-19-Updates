import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class FormatTime extends StatelessWidget {
  final String timeString;

  FormatTime({this.timeString});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${formatDate(DateTime.parse(timeString), [hh, ':', nn, ' ', am])}',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 30.0,
        color: Colors.white,
      ),
    );
  }
}
