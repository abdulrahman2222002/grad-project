// ignore_for_file: must_be_immutable

import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project/screens/choice_ques_screen/top_bar.dart';

import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants.dart';
import '../../models/choises_question_data_response.dart';
import '../../utils/size_helper.dart';
import '../../widgets/to_right_left_button.dart';
import '../units_of_level/units_view_model.dart';

ScrollPhysics scrollPhysicsZ = const AlwaysScrollableScrollPhysics();

class ChoiceQuestionView extends StatefulWidget {
  List<QuesChoice>? quesChoice;
  ChoiceQuestionView({Key? key,  required this.quesChoice}) : super(key: key);

  @override
  State<ChoiceQuestionView> createState() => _ChoiceQuestionViewState();
}

class _ChoiceQuestionViewState extends State<ChoiceQuestionView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var unitsViewModel = context.read<UnitsViewModel>();
    return Scaffold(
      // appBar: AppBar(),

      body: Stack(
        children: [
          Container(
              width: SizeHelper.getScreenWidth(context: context),
              height: SizeHelper.getScreenHeight(context: context),
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/ques2.png',
                    ),
                    fit: BoxFit.fill),
              ),
              child: Column(
                children: [
                  const ChoiceQuestionTopBar(),
                  SizeHelper.verticalSpace(5.h),
                  QuestionName(
                    quesName: unitsViewModel.choiceQuesResponse
                        ?.quesChoice?[unitsViewModel.index].quesName,
                  ),
                  SizeHelper.verticalSpace(25.h),
                  ToRightLeft(
                    toRight: () {
                      // debugPrint('Index : $index');
                      // if ((widget.ques!.length)  != index) {
                      // index= index+1;
                      // }
                      // debugPrint('Index : $index');
                      unitsViewModel.increaseIndex(context);
                      debugPrint('Index Length : ${widget.quesChoice?.length}');
                      // imagePainterController.notifyListeners();
                      setState(() {});
                    },
                    toLeft: () {
                      // if (index > 0) {
                      // index= index-1;
                      // }
                      //  debugPrint('Index : $index');
                      unitsViewModel.decreaseIndex();
                      debugPrint('Index Length : ${widget.quesChoice?.length}');
                      //  imagePainterController.notifyListeners();
                      setState(() {});
                      // unitsViewModel.decreaseIndex();
                    },
                  )
                ],
              )),
          Positioned(
            left: 13.w,
            right: 13.w,
            top: 30.h,
            bottom: 10.h,
            child: SizedBox(
              // color: Colors.red,
              height: SizeHelper.getScreenHeight(context: context) * 0.65,
              width: SizeHelper.getScreenWidth(context: context) * 0.85,
              child: Consumer<UnitsViewModel>(
                  builder: (context, provider, child) {
                    final choiceQuesResponse = provider.choiceQuesResponse;

                    // Check if choiceQuesResponse and quesChoice are not null
                    if (choiceQuesResponse == null) {
                      return const Text('choiceQuesResponse is null');
                    }
                    final quesChoice = choiceQuesResponse.quesChoice;
                    if (quesChoice == null) {
                      return const Text('quesChoice is null');
                    }

                    // Check if index is within bounds for quesChoice
                    if (provider.index >= quesChoice.length) {
                      return Text('Index out of bounds for quesChoice: ${provider.index} / ${quesChoice.length}');
                    }

                    final choice = quesChoice[provider.index];
                    final images = choice.images;

                    // Check if images is not null
                    if (images == null) {
                      return Text('images is null for index: ${provider.index}');
                    }

                    // // Check if index is within bounds for images
                    // if (provider.index <= images.length) {
                    //   return Text('Index out of bounds for images: ${provider.index} / ${images.length}');
                    // }

                    final content = choice.content;

                    // Check if content is not null and has enough characters for substring operations
                    if (content == null) {
                      return Text('content is null for index: ${provider.index}');
                    }
                    if (content.length < 2) {
                      return Text('content too short for index: ${provider.index}, length: ${content.length}');
                    }

                    return ChoiceQuestionItem(
                      image: images[0].secureUrl ?? '',
                    );
                  }
              )


            ),

            // Expanded(
            //   child: ListView.builder(
            //     physics: scrollPhysicsZ,
            //     itemCount: widget.quesChoice?.length,
            //     shrinkWrap: true,
            //     itemBuilder: (context, index) {
            //       // final imagePainterController=ImagePainterController();
            //       return ChoiceQuestionItem(
            //         image: 'assets/images/camel.png',
            //         letter1: widget.quesChoice?[index].content
            //                 .toString()
            //                 .substring(1, 2) ??
            //             '',
            //         letter2: widget.quesChoice?[index].content
            //                 .toString()
            //                 .substring(4, 5) ??
            //             '',
            //       );
            //     },
            //   ),
            // ),

            // Column(
            //   children: [
            //     SingleChildScrollView(
            //       child: Column(
            //         children: [
            //           ChoiceQuestionItem(
            //             image: 'assets/images/camel.png',
            //             letter1: 'A',
            //             letter2: 'B',
            //           ),
            //           ChoiceQuestionItem(
            //             image: 'assets/images/camel.png',
            //             letter1: 'A',
            //             letter2: 'B',
            //           ),
            //           ChoiceQuestionItem(
            //             image: 'assets/images/camel.png',
            //             letter1: 'A',
            //             letter2: 'B',
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            // child: SizedBox(
            //   // color: Colors.red,
            //   height: SizeHelper.getScreenHeight(context: context) * 0.65,
            //   width: SizeHelper.getScreenWidth(context: context) * 0.85,
            //   child: Consumer2<LettersTypingViewModel,UnitsViewModel>(
            //       builder: (context, provider,unitsViewModel, child) => LetterTypingItem(
            //            // letter: unitsViewModel.lessonsDataResponse.categs[provider.index],
            //           )),
            // ),
          ),
          // Positioned(
          //   left: 3.w,
          //   right: 3.w,
          //   height: 5.h,
          //   // top: 22.h,
          //   bottom: 3.h,
          //   child: BuildButton(
          //     title: 'تأكيد',
          //     titleColor: blueColor,
          //     buttonColor: whitColor,
          //     onTap: () {},
          //   ),
          // ),
        ],
      ),
    );
  }
}

//! ChoiceQuestionItem
class ChoiceQuestionItem extends StatefulWidget {
  final String image;
  const ChoiceQuestionItem({Key? key,
    required this.image,
  }) : super(key: key);

  @override
  State<ChoiceQuestionItem> createState() => _ChoiceQuestionItemState();
}

class _ChoiceQuestionItemState extends State<ChoiceQuestionItem> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // SizeHelper.verticalSpace(1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CachedNetworkImage(
                imageUrl: widget.image,
                width: 40.w,
                height: 20.h,
                fit: BoxFit.fill,
              ),
            ],
          ),
          SizeHelper.verticalSpace(0.h),

          Consumer<UnitsViewModel>(
            builder: (context, value, child) => SizedBox(
              width: 40.w,

              child: GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                gridDelegate:
                 SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.w,
                    mainAxisSpacing: 3.h),
                itemCount: value.choiceQuesResponse?.quesChoice?[value.index].content?.length,
                itemBuilder: (context, index) {
                  String? choice =value.choiceQuesResponse?.quesChoice?[value.index].content?[index];
                  String? answer =value.choiceQuesResponse?.quesChoice?[value.index].answer;
                  int? choiceLenth =value.choiceQuesResponse?.quesChoice?[value.index].content?.length;
                  List<Color> containerColors = List<Color>.filled(choiceLenth!, Colors.white);

                  return GestureDetector(
                    onTap: () async {
                      bool isCorrect=choice==answer;
                     if(choice==answer){
                       setState(() {
                         containerColors[index] = isCorrect? Colors.green : Colors.red;
                         debugPrint(choiceLenth as String?);
                       });
                       Fluttertoast.showToast(msg: 'أحسنت');
                       await _audioPlayer.play(AssetSource('audio/assets_audios_3.mp3'));
                     }else{
                       setState(() {
                         containerColors[index] =  Colors.red;
                         debugPrint(choiceLenth as String?);
                       });
                       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Center(child: Text('خطأ'))));
                       await _audioPlayer.play(AssetSource('audio/assets_audios_2X.mp3'));
                       final player = AudioPlayer();
                       await player.play(AssetSource(heymp31));
                     }
                    },
                    child: Container(
                      // width: 10.w,
                      // height: 5.h,
                      decoration: BoxDecoration(
                          color:containerColors[index] ,
                          border: Border.all(
                            color: Colors.black,
                            width: 0.5,
                          ),
                      borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 1.w),
                          child: Text(
                            value.choiceQuesResponse?.quesChoice?[value.index].content?[index] ?? '',
                            style: TextStyle(
                              fontSize: 15.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizeHelper.verticalSpace(8.h),
        ],
      ),
    );
  }
}

// !QuestionName
class QuestionName extends StatelessWidget {
  final String? quesName;
  const QuestionName({Key? key,  required this.quesName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          quesName!,
          style: TextStyle(
              color: Colors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold),
        ),
        SizeHelper.horizontalSpace(3.h),
      ],
    );
  }
}

// !ChoiceQuestionLetter
class ChoiceQuestionLetter extends StatelessWidget {
  final String? letter;
  final void Function()? onTap;
  const ChoiceQuestionLetter({Key? key,
    this.letter,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // width: 10.w,
        // height: 5.h,
        decoration: BoxDecoration(
            color: Colors.white54,
            border: Border.all(
              color: Colors.black,
              width: 0.5,
            )),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 2.5.w),
            child: Text(
              letter ?? '',
              style: TextStyle(
                fontSize: 15.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class LetterText extends StatelessWidget {
  const LetterText({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('اسد', style: TextStyle(color: Colors.green, fontSize: 50.sp)),
        // SizeHelper.horizontalSpace(10.w),
        Text(
          'ا',
          style: TextStyle(color: Colors.green, fontSize: 50.sp),
        ),
      ],
    );
  }
}
