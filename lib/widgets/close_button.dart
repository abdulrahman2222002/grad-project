// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class XCloseButton extends StatelessWidget {
  Function? onTap;
   XCloseButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Image.asset(
                'assets/images/letter_close.png',
                height: 40,
                width: 40,
                fit: BoxFit.fill,
              ),
    );
  }
}