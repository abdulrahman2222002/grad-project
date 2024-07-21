import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/constants.dart';

Widget indicator(bool isActive) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    height: 1.2.h,
    width: isActive ? 12.w : 5.w,
    margin: const EdgeInsets.only(right: 5.0),
    decoration: BoxDecoration(
      color: isActive ? blueColor : miniGrayColor,
      borderRadius: BorderRadius.circular(5),
    ),
  );
}