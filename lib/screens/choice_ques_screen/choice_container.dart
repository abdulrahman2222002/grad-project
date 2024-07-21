import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChoiceContainer extends StatefulWidget {
  final String choice;
  final String answer;

  const ChoiceContainer({required this.choice, required this.answer, Key? key}) : super(key: key);

  @override
  _ChoiceContainerState createState() => _ChoiceContainerState();
}

class _ChoiceContainerState extends State<ChoiceContainer> {
  Color containerColor = Colors.white54;
  final AudioPlayer _audioPlayer = AudioPlayer();

  void _playAudio(String path) async {
    await _audioPlayer.play(AssetSource(path));
  }

  void _checkAnswer() {
    if (widget.choice == widget.answer) {
      setState(() {
        containerColor = Colors.green;
      });
      _playAudio('assets/correct.mp3');
    } else {
      setState(() {
        containerColor = Colors.red;
      });
      _playAudio('assets/wrong.mp3');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.w,
      child: GestureDetector(
        onTap: _checkAnswer,
        child: Container(
          decoration: BoxDecoration(
            color: containerColor,
            border: Border.all(
              color: Colors.black,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                widget.choice,
                style: TextStyle(
                  fontSize: 15.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
