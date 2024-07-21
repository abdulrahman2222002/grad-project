// ignore_for_file: file_names, must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      content: Text(text),
    ),
  );
}



class LinearPercenIndicator extends StatelessWidget {
  LinearPercenIndicator({Key? key,
    required this.progressBarValue,
    required this.width,
    required this.lineHeight,
    required this.percent,
    this.backgroundColor,
    this.progressColor,

  }) : super(key: key);

  final int progressBarValue;
  double width;
  double lineHeight;
  double percent;
  Color? backgroundColor = Colors.grey[200];
  Color? progressColor = Colors.blue[400];

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      width: width,
      lineHeight:lineHeight,
      percent: percent,
      linearStrokeCap: LinearStrokeCap.roundAll,
      backgroundColor:backgroundColor,
      progressColor: progressColor,
    );
  }
}