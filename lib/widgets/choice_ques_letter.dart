import 'package:flutter/material.dart';

class ChoiceQuestionLetter extends StatelessWidget {
  final String? letter;
  const ChoiceQuestionLetter({Key? key,   this.letter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 5,
      height: 5,
      decoration: BoxDecoration(
          color: Colors.white54,
          border: Border.all(color: Colors.black,)
      ),
      child: Center(child:Text(letter??'',textAlign: TextAlign.center,)),
    );
  }
}
