import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormatDate extends StatelessWidget {
  final String dateString;

  FormatDate({this.dateString});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${DateFormat.yMMMMd("en_US").format(DateTime.parse(dateString))}',
//      '${formatDate(DateTime.parse(dateString), [dd, '-', mm, '-', yyyy])}',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 30.0,
        color: Colors.white,
      ),
    );
  }
}
