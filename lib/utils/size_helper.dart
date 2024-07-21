import 'package:flutter/material.dart';

class SizeHelper {
  static double getScreenWidth({required BuildContext context}) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight({required BuildContext context}) {
    return MediaQuery.of(context).size.height;
  }

  static Widget horizontalSpace(double? space) {
    return SizedBox(
      width: space,
    );
  }

  static Widget verticalSpace(double? space) {
    return SizedBox(
      height: space,
    );
  }

  static Widget expandedSpace() {
    return const Expanded(
      child: SizedBox(
      ),
    );
  }
}
