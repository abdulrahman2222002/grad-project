import 'package:flutter/material.dart';

import '../../utils/size_helper.dart';
import '../../widgets/close_button.dart';
import '../choice_ques_screen/top_bar.dart';


class LettersTopBar extends StatelessWidget {
  const LettersTopBar({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        XCloseButton(),
        SizeHelper.expandedSpace(),
        Image.asset('assets/images/audio.png'),
        SizeHelper.horizontalSpace(10),
        Image.asset('assets/images/refresh.png'),
        SizeHelper.horizontalSpace(10),
        const MenuButton(),
      ],
    );
  }
}

