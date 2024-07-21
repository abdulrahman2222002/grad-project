import 'package:flutter/material.dart';
import '../../data_source/remote/repository_data_source.dart';
import '../../models/login_data_response.dart';
import '../../screens/subjects_screen/subjects_view.dart';
import '../auth_services/auth_services.dart';

class LoginViewModel extends ChangeNotifier {
  bool isLoading = false;

  LoginDataResponse? loginDataResponse;

  Future<LoginDataResponse?> login(
      {required Map<String, dynamic> reqData,
      required BuildContext ctx}) async {
    try {
      isLoading = true;
      notifyListeners();
      debugPrint("Login Req body : $reqData");
      loginDataResponse = await RemoteDataSource.login(body: reqData);
      AuthService.saveToken(loginDataResponse?.token ?? 'NA');
      isLoading = false;
      notifyListeners();
      debugPrint('Token : ${await AuthService.getToken()}');
      if(await AuthService.getToken()!='NA'){
             Navigator.pushAndRemoveUntil(
          ctx,
          MaterialPageRoute(
            builder: (context) => const SubjectsScreen(),
          ),
          (route) => false);
      }
      
    } catch (error) {
      isLoading = false;
      notifyListeners();
    }
    return loginDataResponse;
  }
}
