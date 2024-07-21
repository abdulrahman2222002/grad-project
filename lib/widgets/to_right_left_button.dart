// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class ToRightLeft extends StatelessWidget {
  Function toRight;
  Function toLeft;
    ToRightLeft({Key? key, required this.toLeft,required this.toRight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // var lettersViewModel = context.read<LettersViewModel>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         //! To Left Button
            InkWell(
              onTap: () {
                // lettersViewModel.increaseIndex();
                toLeft() ;
              },
              child: Image.asset(
                'assets/images/letter_to_left.png',
                height: 10.h,
                width: 15.w,
                fit: BoxFit.fill,
              ),
            ),

            //! To Right Button
            InkWell(
              onTap: () {
                // lettersViewModel.decreaseIndex();
                toRight();
              },
              child: Image.asset(
                'assets/images/letter_to_right.png',
                height: 10.h,
                width: 15.w,
                fit: BoxFit.fill,
              ),
            ),
      ],
    );
  }
}