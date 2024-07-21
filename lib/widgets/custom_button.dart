// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  CustomButton(this.title, this.onTap,this.buttonColor,this.titleColor, {Key? key, }) : super(key: key);
  String? title;
  VoidCallback onTap;
  Color buttonColor;
  Color titleColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: buttonColor),
            height: 65,
            width: 344,
            child: Center(
              child: Text(
                title!,
                style:  TextStyle(
                  color: titleColor,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}



class BuildButton extends StatelessWidget {
   BuildButton({Key? key,

    required this.onTap,
    required this.title,
    required this.buttonColor,
    required this.titleColor,
     this.height,
     this.width,

  }) : super(key: key);


  final VoidCallback onTap;
  final String title;
  Color buttonColor;
  Color titleColor;
  double? height;
  double? width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child:  Center(
            child: Text(
              title,
              style:  TextStyle(
                  fontSize: 15.sp,
                  color: titleColor,
                  fontWeight: FontWeight.w700
              ),
            )),
      ),
    );
  }
}