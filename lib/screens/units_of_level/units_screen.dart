// ignore_for_file: prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:graduation_project/screens/units_of_level/units_view_model.dart';

import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../experiance_shared_pref.dart';
import '../../widgets/build_app_bar.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/network_image.dart';
import 'lessons.dart';

class UnitsScreen extends StatefulWidget {
   UnitsScreen({this.levelsId,this.catId});
  String? levelsId;
  String? catId;

  static String id = 'UnitsScreen';

  @override
  State<UnitsScreen> createState() => _UnitsScreenState();
}

class _UnitsScreenState extends State<UnitsScreen> {
  int? progressBarValue;
  // Unit
  List<Map<String, dynamic>> unitData = [
    {"name": "الوحده 1", "image": "assets/images/Group.png", "number": 0.1},
    {"name": "الوحده 2", "image": "assets/images/lock.png", "number": 0.5},
    {"name": "الوحده 3", "image": "assets/images/lock.png", "number": 0.3},
    {"name": "الوحده 4", "image": "assets/images/lock.png", "number": 0.8},
  ];
int? experiance=0;
  // List<Map<String, dynamic>> unitData = [
  //   {"name": "الوحده 1", "image": "assets/images/Group.png", "number": 0.1},
  //   {"name": "الوحده 2", "image": "assets/images/lock.png", "number": 0.5},
  //   {"name": "الوحده 3", "image": "assets/images/lock.png", "number": 0.3},
  //   {"name": "الوحده 4", "image": "assets/images/lock.png", "number": 0.8},
  // ];

  @override
  void initState() {
    var provider = context.read<UnitsViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await provider.getUnitsObject(levelId:widget.levelsId);
      experiance = await Experiance.getExValue();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // levelsId = ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
      body: Consumer<UnitsViewModel>(
        builder: (context, unitsProvider, child) => unitsProvider.isLoading ==
                false
            ? unitsProvider.unitDataResponse!.error!.isEmpty
                ? Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 4.w, right: 4.w, top: 7.h, bottom: 4.h),
                        child: const BuildAppBar(),
                      ),
                      Container(
                        height: 10.h,
                        color: const Color(0xffE8E8E8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.local_fire_department_outlined,
                                  color: const Color(0xffEB9F4A),
                                  size: 35.sp,
                                ),
                                Text(
                                  '3',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    color: const Color(0xffEB9F4A),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/ttt.jpg',
                                  height: 8.h,
                                  width: 8.w,
                                ),
                                Text(
                                  '$experiance XP',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    color: const Color(0xff726C90),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.favorite_outlined,
                                  color: const Color(0xffDC3F00),
                                  size: 35.sp,
                                ),
                                Text(
                                  '3',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    color: const Color(0xffDC3F00),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   height: 3.h,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Text(
                      //       "تعلم اللغة العربية",
                      //       textAlign: TextAlign.center,
                      //       style: TextStyle(
                      //         fontWeight: FontWeight.w500,
                      //         fontSize: 22.sp,
                      //         color: const Color(0xff4A4373),
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: 2.w,
                      //     ),
                      //     Image.asset(
                      //       "assets/images/Vector.png",
                      //       width: 10.w,
                      //       height: 5.h,
                      //     ),
                      //     Text(
                      //       "18/50",
                      //       style: TextStyle(
                      //         fontSize: 15.sp,
                      //         color: miniBlackColor,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 4.w,
                            right: 4.w,
                          ),
                          child: GridView.builder(
                            itemCount:
                                unitsProvider.unitDataResponse?.units?.length ??
                                    0,
                            clipBehavior: Clip.none,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // number of items in each row
                              mainAxisSpacing: 5.h, // spacing between columns
                              crossAxisSpacing: 5.w, // spacing between rows
                              mainAxisExtent: 25.h,
                            ),
                            itemBuilder: (context, index) => UnitContainer(
                              onTap: () {
                                // Navigator.pushNamed(
                                //     context, 'LessonsScreen');
                                Navigator.push(context, MaterialPageRoute(builder: (context) => LessonsScreen(unitId:unitsProvider.unitDataResponse
                                      ?.units?[index].id ,unitName: unitsProvider.unitDataResponse
                                      ?.units?[index].unitName,
                                      catId: widget.catId,
                                      ),));
                              },
                              name: unitsProvider.unitDataResponse
                                      ?.units?[index].unitName ??
                                  '',
                              mainImage: unitsProvider.unitDataResponse
                                      ?.units?[index].image?.secureUrl ??
                                  '',
                              vectorImage: 'assets/images/Vector.png',
                            ),
                          ),
                        ),
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

class UnitContainer extends StatelessWidget {
  UnitContainer({
    required this.onTap,
    required this.mainImage,
    required this.name,
    this.percenIndicator,
    this.progressBarValue,
    this.vectorImage,
    this.percent,
  });

  final VoidCallback onTap;
  String name;
  String mainImage;
  String? vectorImage;
  Widget? percenIndicator;
  int? progressBarValue;
  double? percent;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xffC4C4C4).withOpacity(.5),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding:  EdgeInsets.all(4.sp),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              ImageFromNetwork(
                imageUrl: mainImage,
                width: 20.w,
                height: 20.h,
              ),
              // Image.network(
              //   mainImage,
              //   width: 20.w,
              //   errorBuilder: (context, error, stackTrace) => SizedBox(width: 20.w,child: Icon(Icons.error),),
              // ),
              const Spacer(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Image.asset(
              //       vectorImage!,
              //       width: 8.w,
              //     ),
              //     LinearPercenIndicator(
              //       progressBarValue: 10,
              //       width: 22.w,
              //       lineHeight: 1.5.h,
              //       percent: 0.2,
              //       backgroundColor: Colors.grey[200],
              //       progressColor: const Color(0xffFBB237),
              //     ),
              //     Text(
              //       "20/20",
              //       style: TextStyle(
              //         fontWeight: FontWeight.w500,
              //         fontSize: 10.sp,
              //         color: Colors.black,
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
