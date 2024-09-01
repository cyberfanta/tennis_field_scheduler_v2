import 'package:flutter/material.dart';

import '../../../app/theme/ui_colors.dart';
import '../../../app/theme/ui_text_styles.dart';
import '../behaviors/ontap_wrapper.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.context,
    required this.text,
    this.backgroundColor = cBlack,
    required this.actionsToDo,
  });

  final BuildContext context;
  final String text;
  final Color backgroundColor;
  final void Function() actionsToDo;

  @override
  Widget build(BuildContext context) {
    return OnTapWrapper(
      widgetToWrap: Container(
        width: double.infinity,
        height: 53,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: styleBold(16, cWhite),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      actionsToDo: actionsToDo,
    );
  }
}
