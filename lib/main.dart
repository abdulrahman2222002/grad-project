import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/screens/onboarding_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'auth/auth_services/auth_services.dart';
import 'auth/register_screen/sign_up_screen.dart';
import 'auth/login_screen/sign_in.dart';

import 'constants/providers.dart';
///test commit
import 'screens/units_of_level/units_screen.dart';
import 'screens/levels_of_subject/levels_of_subject.dart';
import 'screens/units_of_level/lessons.dart';
import 'screens/subjects_screen/subjects_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, }) : super(key: key);
//  static final AuthService _authService = AuthService();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: AppProviders.appProviders,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: const Locale('ar'),
            routes: {
              'LoginScreen': (context) => const LoginScreen(),
              'RegisterScreen': (context) => const RegisterScreen(),
              // 'ForgetPassword' : (context)=> const ForgetPassword(),
              // 'SetNewPassword' : (context)=> const SetNewPassword(),
              // 'AskForName': (context) => const AskForName(),
              // 'AskForAge': (context) => const AskForAge(),
              'SubjectsScreen': (context) => const SubjectsScreen(),
              'LevelsOfSubject': (context) => const LevelsOfSubject(),
              'UnitsScreen': (context) =>  UnitsScreen(),
              'LessonsScreen': (context) => LessonsScreen(),
            },
            home: AnimatedSplashScreen(
              duration: 500,
              splash: Image.asset(
                'assets/images/splash1.jpg',
                fit: BoxFit.fill,
              ),
              splashTransition: SplashTransition.scaleTransition,
              centered: true,
              animationDuration: const Duration(seconds: 1),
              splashIconSize: double.infinity,
              nextScreen: FutureBuilder<String?>(
                future: AuthService.getToken(),
                builder: (context, snapshot) {
                  // Check if the future is completed
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.data == 'NA') {
                      // Token is null, navigate to RegisterScreen
                      return const LoginScreen();
                    } else {
                      // Token is not null, navigate to HomeScreen
                      return const OnboardingScreen();
                    }
                  }
                  // Show a loading indicator while checking the token
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
