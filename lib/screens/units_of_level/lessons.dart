// ignore_for_file: prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable

//https://smart-edu-for-kids-seven.vercel.app/cat?unitId=6634be950d0e4e8858b7531a
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/screens/units_of_level/units_view_model.dart';
import 'package:provider/provider.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/build_app_bar.dart';
import '../choice_ques_screen/choice_ques_view.dart';
import '../letters_screen/letters_view.dart';
import '../letters_typing_screen/letters_typing_view.dart';
import '../matching/matching_view_1.dart';
import '../matching/matching_view_2.dart';
import '../matching/matching_view_num.dart';
//D:\grad_project\lib\models\typing_letters_data_response.dart

class LessonsScreen extends StatefulWidget {
  String? unitId;
  String? catId;
  String? unitName;
  LessonsScreen({this.unitId, this.unitName,this.catId});

  static String id = 'LessonsScreen';

  @override
  State<LessonsScreen> createState() => _LessonsScreenState();
}

class _LessonsScreenState extends State<LessonsScreen> {
  //
  @override
  void initState() {
    var provider = context.read<UnitsViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await provider.getLessonsObject(unitId: widget.unitId);
      await provider.getQuesObject(unitId: provider.lessonsDataResponse?.categs?.first.id);
      await provider.getTypingLettersQues(unitId: provider.lessonsDataResponse?.categs?.first.id);
      await provider.getChoiceQuesObject(unitId: provider.lessonsDataResponse?.categs?.first.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.read<UnitsViewModel>();
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.only(left: 4.w, right: 4.w, top: 7.h, bottom: 4.h),
            child: const BuildAppBar(),
          ),
           SizedBox(
            height: 8.h,
          ),
          // Container(
          //   height: 71,
          //   color: const Color(0xffC4C4C4).withOpacity(.4),
          //   width: double.infinity,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       const Text(
          //         "اللغة العربية",
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //             fontWeight: FontWeight.w500,
          //             fontSize: 28,
          //             color: Color(0xff4A4373)),
          //       ),
          //       const SizedBox(
          //         width: 10,
          //       ),
          //       Image.asset(
          //         "assets/images/Vector.png",
          //       ),
          //       const SizedBox(
          //         width: 10,
          //       ),
          //       const Text(
          //         "3",
          //         style: TextStyle(fontSize: 30, color: Colors.amber),
          //       ),
          //       const SizedBox(
          //         width: 27,
          //       ),
          //       Image.asset(
          //         "assets/images/geles.png",
          //       ),
          //       const SizedBox(
          //         width: 10,
          //       ),
          //       const Text(
          //         "213",
          //         style: TextStyle(fontSize: 30, color: Colors.blue),
          //       ),
          //     ],
          //   ),
          // ),

          Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 200,
                height: 120,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xffC4C4C4).withOpacity(.4),
                    border:
                        Border.all(color: const Color(0xffC4C4C4), width: 4)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.unitName ?? '',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 28,
                          color: Color(0xff4A4373)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/Vector.png",
                        ),
                        const ProgressBar(
                          width: 100,
                          height: 15,
                          value: 2,
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.amber,
                              Colors.amber,
                              Color(0xffC4C4C4),
                              Color(0xffC4C4C4),
                            ],
                          ),
                        ),
                        const Text(
                          "18/50",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                top: -65,
                child: Image.asset(
                  "assets/images/Horse.png",
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: index.isOdd
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          //For Testing
                          if (index == 0) {
                            if (provider.lessonsDataResponse?.categs != null &&
                                provider
                                    .lessonsDataResponse!.categs!.isNotEmpty) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LettersView(),
                                  ));
                            } else {
                              Fluttertoast.showToast(msg: "لا يوجد محتوي");
                            }
                          } else if (index == 1) {
                            if (provider.typingLettersDataResponse?.ques !=
                                    null &&
                                provider.typingLettersDataResponse!.ques!
                                    .isNotEmpty) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LettersTypingView(
                                    ),
                                  ));
                            } else {
                              Fluttertoast.showToast(msg: "لا يوجد محتوي");
                            }
                            // Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //         builder: (context) => const LettersTypingView(),
                            //       ));
                          } else if (index == 2) {
                            if (provider.choiceQuesResponse?.quesChoice !=
                                    null &&
                                provider.choiceQuesResponse!.quesChoice!
                                    .isNotEmpty) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChoiceQuestionView(
                                      quesChoice: provider
                                          .choiceQuesResponse!.quesChoice,
                                    ),
                                  ));
                            } else {
                              Fluttertoast.showToast(msg: "لا يوجد محتوي");
                            }
                          } else if(index==3) {
                            // Flutter toast.showToast(msg: "لا يوجد محتوي");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                        MatchingViewNum(),
                                ));
                          }
                          else if(index==4) {
                            // Flutter toast.showToast(msg: "لا يوجد محتوي");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                        MatchingViewObj1(),
                                ));
                          }
                          else if(index==5) {
                            // Flutter toast.showToast(msg: "لا يوجد محتوي");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                        MatchingViewObj2(),
                                ));
                          }
                        },
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                    width: 110,
                                    height: 110,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: const Color(0xffC4C4C4),
                                            width: 10)),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.blue,
                                          border: Border.all(
                                              color: Colors.white, width: 1)),
                                      child: Image.asset(
                                          "assets/images/Pencil.png"),
                                    )),
                                Container(
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/Vector.png"))),
                                  width: 27,
                                  height: 27,
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "6",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                )
                              ],
                            ),
                            Text(
                              index == 0
                                  ? "الحروف"
                                  : index == 1
                                      ? "كتابة الحروف"
                                      : index == 2
                                          ? "الأسئلة"
                                          : index==3 ?
                                          "توصيل الارقام":index==4?"توصيل 1":"توصيل 2",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
