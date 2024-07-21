import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../utils/size_helper.dart';
import '../units_of_level/units_view_model.dart';

class MenuDialog extends StatelessWidget {
  // Offers? offer;
  const MenuDialog({Key? key,
  }) : super(key: key);

//  bool _isChanged = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25), // Set a circular border radius
      ),
      backgroundColor: const Color.fromRGBO(247, 246, 246, 1),
      contentPadding: const EdgeInsets.all(20), // Remove content padding
      content: SizedBox(
          height: 50.h,
          width: 60.w,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                        child: Image.asset(
                      'assets/images/letter_to_left.png',
                      height: 50,
                      width: 40,
                    )),
                    SizeHelper.horizontalSpace(50),
                    Image.asset(
                      'assets/images/Home_icon.png',
                      height: 85,
                      width: 85,
                    )
                  ],
                ),
                SizeHelper.verticalSpace(20),
                Consumer<UnitsViewModel>(
                  builder: (context, value, child) => SizedBox(
                    height: 33.h,
                    child: GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemCount: value.lessonsDataResponse?.categs?.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            var provider = context.read<UnitsViewModel>();
                            provider.setIndex(indexx: index);
                          },
                          child: Container(
                            // width: 5,
                            // height: 5,
                            decoration: BoxDecoration(
                                color: Colors.white54,
                                border: Border.all(
                                  color: Colors.black,
                                ),
                            borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                                child: Text(
                              value.lessonsDataResponse?.categs?[index].text ??
                                  '',
                              textAlign: TextAlign.center,
                            )),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          )),
      // actions: [

      // ],
    );
  }
}
