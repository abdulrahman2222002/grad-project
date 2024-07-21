import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../data_source/remote/repository_data_source.dart';
import '../../models/choises_question_data_response.dart';
import '../../models/lessons_data_response.dart';
import '../../models/typing_letters_data_response.dart';
import '../../models/units_data_response.dart';
import '../ques_screen/model/ques_response.dart';



class UnitsViewModel extends ChangeNotifier{

 bool isLoading = true;

 UnitsDataResponse? unitDataResponse;

 Future<UnitsDataResponse?> getUnitsObject({required String? levelId})async{
  isLoading = true;
  notifyListeners();
  unitDataResponse = await RemoteDataSource.getUnits(levelId: levelId);
  isLoading = false;
  notifyListeners();
  return unitDataResponse;
 }


 LessonsDataResponse? lessonsDataResponse;

 Future<LessonsDataResponse?> getLessonsObject({required String? unitId})async{
  lessonsDataResponse = null;
  index=0;
  isLoading = true;
  notifyListeners();
  lessonsDataResponse = await RemoteDataSource.getLessons(unitId: unitId);
  isLoading = false;
  notifyListeners();
  return lessonsDataResponse;
 }


  QuesResponse? quesResponse;

 Future<QuesResponse?> getQuesObject({required String? unitId})async{
  quesResponse = null;
  quesIndex=0;
  isLoading = true;
  notifyListeners();
  quesResponse = await RemoteDataSource.getQues(unitId: unitId);
  isLoading = false;
  notifyListeners();
  return quesResponse;
 }

 ChoicesQuestionDataResponse? choiceQuesResponse;

 Future<ChoicesQuestionDataResponse?> getChoiceQuesObject({required String? unitId})async{
   choiceQuesResponse = null;
   index=0;
  isLoading = true;
  notifyListeners();
   choiceQuesResponse = await RemoteDataSource.getChoiceQues(unitId: unitId);
  isLoading = false;
  notifyListeners();
  return choiceQuesResponse;
 }

 TypingLettersDataResponse? typingLettersDataResponse;

 Future<TypingLettersDataResponse?> getTypingLettersQues({required String? unitId})async{
  typingLettersDataResponse = null;
  quesIndex=0;
  isLoading = true;
  notifyListeners();
  typingLettersDataResponse = await RemoteDataSource.getTypingLettersQues(unitId: unitId);
  isLoading = false;
  notifyListeners();
  return typingLettersDataResponse;
 }

   int index = 0;
   int quesIndex = 0;
   int matchingIndex = 0;

  void setIndex({required int indexx}) {
    index = indexx;
    logger.d('Letter index : $index');
    notifyListeners();
  }

  void increaseIndex(BuildContext ctx) {
    // var length= ctx.read<UnitsViewModel>().lessonsDataResponse?.categs?.length;
    if ((lessonsDataResponse?.categs?.length)! - 1 != index) {
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

  void increaseMatchingIndex(BuildContext ctx) {
    // var length= ctx.read<UnitsViewModel>().lessonsDataResponse?.categs?.length;
    if (3  != matchingIndex) {
      matchingIndex++;
      logger.d('matchingIndex index : $matchingIndex');
      notifyListeners();
    }
  }

  void decreaseMatchingIndex() {
    if (3 > 0) {
      matchingIndex--;
      logger.d('matchingIndex index : $matchingIndex');
      notifyListeners();
    }
  }

 
 }