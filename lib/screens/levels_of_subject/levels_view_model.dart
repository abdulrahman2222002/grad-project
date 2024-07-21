import 'package:flutter/material.dart';

import '../../data_source/remote/repository_data_source.dart';
import '../../models/levels_data_response.dart';

class LevelsViewModel extends ChangeNotifier{
 bool isLoading = true;

 Future<LevelsDataResponse> getLevelsObject({required String? subjectId})async{
  isLoading = true;
  notifyListeners();
  LevelsDataResponse subject = await RemoteDataSource.getLevels(subjectId:subjectId );
  isLoading = false;
  notifyListeners();
  return subject;
 }
}