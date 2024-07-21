import 'package:flutter/material.dart';

import '../screens/levels_of_subject/levels_of_subject.dart';


class BuildAppBar extends StatelessWidget {
  const BuildAppBar({Key? key,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}