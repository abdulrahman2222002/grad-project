import 'dart:io';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

import 'package:path_provider/path_provider.dart';

import '../../constants/constants.dart';
import '../letters_screen/dummy_letters.dart';

class LettersTypingViewModel extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isLoading = true;
  int index = 0;

  final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  chechLetterTracing(InputImage image, String? letter) async {
    final RecognizedText recognizedText =
        await textRecognizer.processImage(image);
    if (letter == recognizedText.text) {
      Fluttertoast.showToast(msg: 'أحسنت');
      await _audioPlayer.play(AssetSource('audio/assets_audios_3.mp3'));    } else {
      Fluttertoast.showToast(msg: 'خطأ');
      await _audioPlayer.play(AssetSource('audio/assets_audios_2X.mp3'));    }
    debugPrint('Recognized text : $letter');
  }

  // Convert Uint8List to File
  Future<File> convertUint8ListToFile(Uint8List data, String fileName) async {
    // Create a new temporary file
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    File tempFile = File('$tempPath/$fileName');

    // Write the data to the file
    await tempFile.writeAsBytes(data);

    return tempFile;
  }

  void setIndex({required int indexx}) {
    index = indexx;
    logger.d('Letter index : $index');

    notifyListeners();
  }

  void increaseIndex() {
    if (dummyLetters.length - 1 != index) {
      index++;
      logger.d('Letter index : $index');
      notifyListeners();
    }
  }

  void decreaseIndex() {
    if (index > 0) {
      index--;
      logger.d('Letter index : $index');
      notifyListeners();
    }
  }
}
