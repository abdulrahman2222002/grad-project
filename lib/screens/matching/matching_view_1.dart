import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_matcher/flutter_quiz_matcher.dart';
import 'package:flutter_quiz_matcher/models/model.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../experiance_shared_pref.dart';
import 'dummy.dart';


class MatchingViewObj1 extends StatelessWidget {
   MatchingViewObj1({Key? key, }) : super(key: key);
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: QuizMatcher(
      questions: [
        ...matchObject1.q!.map(
          (e) => Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black)),
            width: 100,
            height: 100,
            child: Image.asset(e),
          ),
        )
      ],
      answers: [
        ...matchObject1.a!.map(
          (e) => Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black)),
            width: 100,
            height: 100,
            child: Center(
                child: Text(
              e,
              style: const TextStyle(fontSize: 20),
            )),
          ),
        )
      ],
      defaultLineColor: Colors.black,
      correctLineColor: Colors.green,
      incorrectLineColor: Colors.red,
      drawingLineColor: Colors.black,
      onScoreUpdated: (UserScore userAnswers) async {
        // print(userAnswers.questionIndex);
        // print(userAnswers.questionAnswer);
        if (userAnswers.questionAnswer == true) {
          Fluttertoast.showToast(msg: 'أحسنت');
          await _audioPlayer.play(AssetSource('audio/assets_audios_3.mp3'));
          int? exValue = await Experiance.getExValue();
          Experiance.saveExValue(exValue! + 5);
          debugPrint('Experiance = ${await Experiance.getExValue()}');

        }else{
          Fluttertoast.showToast(msg: 'خطأ');
          await _audioPlayer.play(AssetSource('audio/assets_audios_2X.mp3'));
        }
      },
      paddingAround: const EdgeInsets.all(20),
    ));
  }
}
