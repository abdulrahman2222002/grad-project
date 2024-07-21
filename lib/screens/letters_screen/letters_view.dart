// ignore_for_file: must_be_immutable

import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../models/lessons_data_response.dart';
import '../../utils/size_helper.dart';
import '../../widgets/close_button.dart';
import '../../widgets/to_right_left_button.dart';
import '../units_of_level/units_view_model.dart';
import 'menu_dialog.dart';

class LettersView extends StatefulWidget {
  const LettersView({Key? key, }) : super(key: key);

  @override
  State<LettersView> createState() => _LettersViewState();
}

class _LettersViewState extends State<LettersView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //var lettersViewModel = context.read<LettersViewModel>();
    var unitsViewModel = context.read<UnitsViewModel>();
    return Scaffold(
      // appBar: AppBar(),
      body: Stack(
        children: [
          Container(
              width: SizeHelper.getScreenWidth(context: context),
              height: SizeHelper.getScreenHeight(context: context),
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 5.h),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/lesson.png',
                    ),
                    fit: BoxFit.fill),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      XCloseButton(),
                      SizeHelper.expandedSpace(),
                      InkWell(
                        onTap: () async {
                          var soundUrl = unitsViewModel.lessonsDataResponse
                              ?.categs?[unitsViewModel.index].video?.secureUrl;
                          final player = AudioPlayer();
                          await player.play(UrlSource(soundUrl ?? ''));
                        },
                        child: Image.asset(
                          'assets/images/audio.png',
                          height: 40,
                          width: 40,
                        ),
                      ),
                      SizeHelper.horizontalSpace(10),
                      const MenuButton(),
                      SizeHelper.horizontalSpace(10),
                    ],
                  ),
                  SizeHelper.verticalSpace(35.h),
                  ToRightLeft(
                    toRight: () {
                      // final player = AudioPlayer();
                      // player.dispose();
                      // player.stop();
                      unitsViewModel.increaseIndex(context);
                      // var soundUrl= unitsViewModel.lessonsDataResponse
                      //           ?.categs?[lettersViewModel.index].video?.secureUrl;

                      //  player.play(UrlSource(soundUrl??''));
                      // player.stop();
                    },
                    toLeft: () {
                      // final player = AudioPlayer();
                      // player.stop();
                      unitsViewModel.decreaseIndex();
                      // var soundUrl= unitsViewModel.lessonsDataResponse
                      //           ?.categs?[unitsViewModel.index].video?.secureUrl;
                      //
                      //        player.play(UrlSource(soundUrl??''));
                      // player.stop();
                    },
                  )
                ],
              )),
          Positioned(
            left: 12.w,
            right: 12.w,
            top: 18.h,
            bottom: 18.h,
            child: SizedBox(
              // color: Colors.red,
              height: SizeHelper.getScreenHeight(context: context) * 0.65,
              width: SizeHelper.getScreenWidth(context: context) * 0.85,
              child: Consumer<UnitsViewModel>(
                  builder: (context, provider, child) => LetterItem(
                        letter: provider
                            .lessonsDataResponse?.categs?[provider.index],
                      )),
            ),
          )
        ],
      ),
    );
  }
}

class LetterItem extends StatelessWidget {
  Categs? letter;
  LetterItem({Key? key,  this.letter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizeHelper.verticalSpace(5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(letter?.text ?? '',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 33.sp,
                    fontWeight: FontWeight.bold)),
            // SizeHelper.horizontalSpace(10.w),
            // Text(
            //   letter?.text ?? '',
            //   style: TextStyle(color: Colors.green, fontSize: 50.sp),
            // ),
          ],
        ),
        SizeHelper.verticalSpace(8.h),
        SizedBox(
          height: 200,
          width: 230,
          child: CachedNetworkImage(
            imageUrl: letter?.image?.secureUrl ?? '',
            width: 150.w,
            height: 30.h,
            fit: BoxFit.fill,
          ),
        )
      ],
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

class MenuButton extends StatelessWidget {
  const MenuButton({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => const MenuDialog(),
          );
        },
        child: Image.asset(
          'assets/images/menu.png',
          height: 40,
          width: 40,
        ));
  }
}
