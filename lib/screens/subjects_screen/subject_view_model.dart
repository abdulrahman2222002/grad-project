import 'package:flutter/cupertino.dart';

import '../../data_source/remote/repository_data_source.dart';
import '../../models/subject_data_response.dart';


class SubjectViewModel extends ChangeNotifier{
 bool isLoading = true;
 SubjectDataResponse? subjectDataResponse;

 Future<SubjectDataResponse?> getSubjectObject()async{
  isLoading = true;
  notifyListeners();
  subjectDataResponse = await RemoteDataSource.getSubject();
  isLoading = false;
  notifyListeners();
  return subjectDataResponse;
 }
}