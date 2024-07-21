import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../auth/auth_provider/login_provider.dart';
import '../auth/auth_provider/register_provider.dart';
import '../models/login_data_response.dart';
import '../screens/letters_screen/letters_view_model.dart';
import '../screens/letters_typing_screen/letters_typing_view_model.dart';
import '../screens/levels_of_subject/levels_view_model.dart';
import '../screens/subjects_screen/subject_view_model.dart';
import '../screens/units_of_level/units_view_model.dart';

class AppProviders{
  static List<SingleChildWidget> appProviders=[
    ChangeNotifierProvider(create: (_) => SubjectViewModel()),
    ChangeNotifierProvider(create: (_) => LevelsViewModel()),
    ChangeNotifierProvider(create: (_) => UnitsViewModel()),
    ChangeNotifierProvider(create: (_) => LettersViewModel()),
    ChangeNotifierProvider(create: (_) => LettersTypingViewModel()),
    //LettersTypingViewModel
    ChangeNotifierProvider(create: (_) => LoginViewModel()),
    ChangeNotifierProvider(create: (_) => RegisterViewModel()),
  ];
}

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    email: '',
    name: '',
    password: '',
  );

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user as Map<String, dynamic>);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}