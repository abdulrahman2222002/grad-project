// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';



import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../helper/build_widgets.dart';
import '../../models/dummy_data/subject_dummy.dart';
import '../../models/levels_data_response.dart' as levels;
import '../../widgets/loading_widget.dart';
import '../../widgets/network_image.dart';
import '../units_of_level/units_screen.dart';
import 'levels_view_model.dart';

class LevelsOfSubject extends StatefulWidget {
  const LevelsOfSubject();

  static String id = 'LevelsOfSubject';

  @override
  State<LevelsOfSubject> createState() => _ArabicScreenState();
}

class _ArabicScreenState extends State<LevelsOfSubject> {
  int? progressBarValue;
  String? subjectId;
  levels.LevelsDataResponse? levelsDataResponse;
  @override
  void initState() {
    var provider = context.read<LevelsViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      levelsDataResponse = await provider.getLevelsObject(subjectId: subjectId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    subjectId = ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: Consumer<LevelsViewModel>(
        builder: (context, levelsProvider, child) => levelsProvider.isLoading ==
                false
            ? levelsDataResponse!.error!.isEmpty
                ? Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 4.w, right: 4.w, top: 7.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BuildButton(
                              icon: Icons.arrow_back_ios,
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            // BuildButton(
                            //   icon: Icons.menu,
                            //   onTap: () {},
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Image.asset(
                        dummySubjectDetails.first.imageUrl ?? '',
                        width: 60.w,
                        height: 25.h,
                      ),
                      Text(
                        "هيا نتعلم",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25.sp,
                          color: Color(0xff4A4373),
                        ),
                      ),
                      SizedBox(
                        height: 0.1.h,
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(
                              vertical: 0.h, horizontal: 4.w),
                          itemCount: levelsDataResponse?.levels?.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UnitsScreen(
                                        levelsId: levelsDataResponse
                                            ?.levels?[index].id,
                                            catId: subjectId,
                                      ),
                                    ));
                                // Navigator.of(context).pushNamed(
                                // 'UnitsScreen',
                                // arguments: levelsDataResponse?.levels?[index].id
                                // );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 1.h,
                                  horizontal: 2.w,
                                ),
                                margin: EdgeInsets.only(bottom: 2.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                  border: Border.all(
                                    color: const Color(0xffCDCDCD),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(5.sp),
                                      decoration: BoxDecoration(
                                          color: index.isOdd
                                              ? Color(0xff8BC34A)
                                              : Color(0xffFBB237),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Column(
                                        children: [
                                          ImageFromNetwork(
                                            imageUrl: levelsDataResponse
                                                    ?.levels?[index]
                                                    .image
                                                    ?.secureUrl ??
                                                '',
                                            width: 14.w,
                                            height: 5.h,
                                          ),
                                          // Image.network(
                                          //   levelsDataResponse?.levels?[index]
                                          //           .image?.secureUrl ??
                                          //       '',
                                          //   width: 14.w,
                                          //   height: 5.h,
                                          //   errorBuilder:
                                          //       (context, error, stackTrace) =>
                                          //           SizedBox(
                                          //               width: 14.w,
                                          //               height: 5.h,
                                          //               child: const Icon(
                                          //                   Icons.error)),
                                          // ),
                                          Text(
                                            levelsDataResponse?.levels?[index]
                                                    .levelName ??
                                                '',
                                            style: TextStyle(
                                              fontSize: 9.sp,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          levelsDataResponse?.levels?[index]
                                                  .subjectName ??
                                              '',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.sp,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 0.01.h,
                                        ),
                                        Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: LinearPercenIndicator(
                                                progressBarValue: 20,
                                                width: 48.w,
                                                lineHeight: 1.5.h,
                                                percent: 0.5,
                                                backgroundColor:
                                                    Colors.grey[200],
                                                progressColor: index == 0
                                                    ? Color(0xffFBB237)
                                                    : index.isOdd
                                                    ? Color(0xff8BC34A)
                                                    : Color(0xffFBB237),
                                              ),
                                            ),
                                            Text(
                                              "${dummySubjectDetails.first.levelsList?[index].score ?? ''}/20",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 10.sp,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      // Container(
                      //   width: 60.w,
                      //   height: 8.h,
                      //   alignment: Alignment.center,
                      //   decoration: BoxDecoration(
                      //     color: Color(0xff4A4373),
                      //     borderRadius: BorderRadius.circular(30),
                      //   ),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Text(
                      //         "التعلم الان",
                      //         textAlign: TextAlign.center,
                      //         style: TextStyle(
                      //           fontWeight: FontWeight.w500,
                      //           fontSize: 18.sp,
                      //           color: Colors.white,
                      //         ),
                      //       ),
                      //       SizedBox(
                      //         width: 10.w,
                      //       ),
                      //       Container(
                      //         width: 10.w,
                      //         height: 10.h,
                      //         decoration: BoxDecoration(
                      //             color: Colors.blue, shape: BoxShape.circle),
                      //         child: IconButton(
                      //           onPressed: () {},
                      //           icon: Icon(
                      //             Icons.arrow_forward_ios,
                      //             size: 20.sp,
                      //             color: Colors.white,
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      SizedBox(
                        height: 2.h,
                      ),
                    ],
                  )
                : const Center(
                    child: Text('Somthing Went Wrong !!'),
                  )
            : const Loading(),
      ),
    );
  }
}

class BuildButton extends StatelessWidget {
  BuildButton({
    required this.onTap,
    required this.icon,
  });
  final VoidCallback onTap;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12.w,
      height: 6.h,
      decoration: BoxDecoration(
        color: const Color(0xff4A4373),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: () {
          onTap();
        },
        icon: Center(
          child: Row(
            children: [
              SizedBox(width: 3,),
              Icon(
                icon,
                size: 20.sp,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
