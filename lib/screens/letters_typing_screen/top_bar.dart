import 'package:flutter/material.dart';

import '../../utils/size_helper.dart';
import '../../widgets/close_button.dart';
import '../letters_screen/menu_dialog.dart';


class LettersTypingTopBar extends StatelessWidget {
  const LettersTypingTopBar({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        XCloseButton(),
        SizeHelper.expandedSpace(),
        Image.asset('assets/images/audio.png'),
        SizeHelper.horizontalSpace(10),
        Image.asset('assets/images/refresh.png'),
        // SizeHelper.horizontalSpace(10),
        // const MenuButton(),
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
            builder: (context) => MenuDialog(),
          );
        },
        child: Image.asset('assets/images/menu.png'));
  }
}
