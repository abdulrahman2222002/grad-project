// ignore_for_file: must_be_immutable, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/constants.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(this.label, this.hintText, this.onChanged, this.type,
      {Key? key, }) : super(key: key);
  String? label;
  String? hintText;
  Function(String)? onChanged;
  @required
  TextInputType type;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 244,
      width: 50,
      child: TextFormField(
        cursorColor: blueColor,
        validator: (data) {
          if (data!.isEmpty) {
            return 'field is required';
          }
          return null;
        },
        style: const TextStyle(color: blueColor),
        onChanged: onChanged,
        keyboardType: type,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.email_outlined,
            color: blueColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: maxGrayColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: blueColor,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: blueColor,
            ),
          ),
          labelText: label,
          labelStyle: const TextStyle(color: blueColor),
          hintText: hintText,
          hintStyle: const TextStyle(color: blueColor),
        ),
      ),
    );
  }
}

class BuildTextFormFeild extends StatelessWidget {
  BuildTextFormFeild({Key? key,
    this.keyboardType,
    this.isPassword,
    required this.onSaved,
    this.prefixIcon,
    this.visibilityTaped,
    this.hintText,
    this.label,
    this.suffixIcon,
    required this.controller,
  }) : super(key: key);
  IconData? prefixIcon;
  IconData? suffixIcon;
  TextInputType? keyboardType;
  TextEditingController? controller;
  bool? isPassword;
  final void Function(String?)? onSaved;
  final VoidCallback? visibilityTaped;
  String? label;
  String? hintText;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50,
      width: 100.w,
      child: TextFormField(
        controller: controller,
        maxLines: 1,
        cursorColor: blueColor,
        keyboardType: keyboardType,
        obscureText: isPassword!,
        validator: (value){
          if(value?.isEmpty ?? true ){
            return "Feild is required";
          }else{
            return null;
          }
        },
       onSaved: onSaved,
        style: TextStyle(
          color: blackColor,
          fontWeight: FontWeight.w400,
          fontSize: 13.sp,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon,
            color: blueColor,
          ),
          suffixIcon: GestureDetector(
            onTap: visibilityTaped,
            child: Icon(
              suffixIcon,
              color: maximumBlackColor,
              size: 20.sp,
            ),
          ),
          border:  buildOutlineInputBorder(),
          focusedBorder:  buildOutlineInputBorder(),
          disabledBorder:  buildOutlineInputBorder(),
          enabledBorder:  buildOutlineInputBorder(),
          errorBorder:  buildOutlineInputBorder(),
          focusedErrorBorder: buildOutlineInputBorder(),
          labelText: label,
          labelStyle: const TextStyle(
            color: blueColor,
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: miniBlackColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide:  BorderSide(
        color:color?? blueColor,
        width: 1.5,
      ),
    );
  }
}
