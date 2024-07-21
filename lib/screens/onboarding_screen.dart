// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:graduation_project/screens/subjects_screen/subjects_view.dart';
import 'package:sizer/sizer.dart';

import '../auth/login_screen/sign_in.dart';
import '../constants/constants.dart';
import '../widgets/custom_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key, }) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 5.w, top: 20),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SubjectsScreen()),
                );
              }, //to login screen. We will update later
              child: Text(
                'Skip>',
                style: TextStyle(
                  color: blueColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              CreatePage(
                image: 'assets/images/splash1.jpg',
                title: Constants.titleOne,
              ),
              CreatePage(
                image: 'assets/images/splash1.jpg',
                title: Constants.titleTwo,
              ),
              CreatePage(
                image: 'assets/images/splash1.jpg',
                title: Constants.titleThree,
              ),
            ],
          ),
          Positioned(
            bottom: 25.h,
            left: 38.w,
            child: Row(
              children: _buildIndicator(),
            ),
          ),
          Positioned(
            bottom: 5.h,
            left: 2.5.w,

            child: Row(
              children: [
                BuildButton(
                  title: 'Continue',
                  height: 8.h,
                  width: 95.w,
                  onTap: () {
                    setState(() {
                      if (currentIndex < 2) {
                        currentIndex++;
                        if (currentIndex < 3) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const LoginScreen(),
                          ),
                        );
                      }
                    });
                  },
                  titleColor: whitColor,
                  buttonColor: maxGrayColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //Extra Widgets

  //Create the indicator decorations widget
  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 1.2.h,
      width: isActive ? 12.w : 5.w,
      margin: const EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        color: isActive ? maxGrayColor : miniGrayColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

//Create the indicator list
  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }
}

class CreatePage extends StatelessWidget {
  final String image;
  final String title;

  const CreatePage({Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 80),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 15,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2.8,
            child: Container(
              child: Image.asset(
                image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 45,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style:  TextStyle(
              color: maxGrayColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
           SizedBox(
            height: MediaQuery.of(context).size.height /10,
          ),
        ],
      ),
    );
  }
}

class Constants {
  //primary color

  static var blackColor = Colors.black54;

  //onboardText
  static var titleOne = "This application is designed to help children learn";
  static var titleTwo =
      "We have a variety of activities that are fun and educational";
  static var titleThree = "let's get this party started!";
}
