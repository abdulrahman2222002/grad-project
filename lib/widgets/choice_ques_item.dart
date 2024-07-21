import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/size_helper.dart';
import 'choice_ques_letter.dart';

class ChoiceQuestionItem extends StatelessWidget {

  const ChoiceQuestionItem({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizeHelper.verticalSpace(5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/images/camel.png',width: 35.w,height: 15.h,),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ChoiceQuestionLetter(letter: 'A',),
              ChoiceQuestionLetter(letter: 'C',),
            ],
          ),
          SizeHelper.verticalSpace(25.h),
        ],
      ),
    );
  }
}