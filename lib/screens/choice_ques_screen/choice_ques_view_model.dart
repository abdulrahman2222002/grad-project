

import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../letters_screen/dummy_letters.dart';


class ChoiceQuestionViewModel extends ChangeNotifier {
  bool isLoading = true;
  int index = 0;

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
