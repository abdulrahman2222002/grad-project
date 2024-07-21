import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/size_helper.dart';

class QuestionName extends StatelessWidget {
  final String? quesName;
  const QuestionName({Key? key,  this.quesName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          quesName!,
          style: TextStyle(color: Colors.black, fontSize: 12.sp,fontWeight: FontWeight.bold),
        ),
        SizeHelper.horizontalSpace(5.w),
      ],
    );
  }
}