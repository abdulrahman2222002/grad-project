import 'package:flutter/material.dart';

import '../../data_source/remote/repository_data_source.dart';
import '../../models/register_data_response.dart';
import '../login_screen/sign_in.dart';


class RegisterViewModel extends ChangeNotifier {
  bool isLoading = true;

  RegisterDataResponse? registerDataResponse;

  Future<RegisterDataResponse?> register(
      {required Map<String, dynamic> reqData,
      required BuildContext ctx}) async {
    try {
      isLoading = true;
      notifyListeners();
      registerDataResponse = await RemoteDataSource.register(body: reqData);
      isLoading = false;
      notifyListeners();
      if(registerDataResponse?.message=='success'){
            Navigator.push(
          ctx, MaterialPageRoute(builder: (context) => const LoginScreen()));
      }
      
    } catch (error) {
      isLoading = false;
      notifyListeners();
    }
    return registerDataResponse;
  }
}
