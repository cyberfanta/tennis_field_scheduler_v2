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
    this.textColor = cWhite,
    this.textStyle,
    this.imageIcon,
    this.actionsToDo,
  });

  final BuildContext context;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final TextStyle? textStyle;
  final Widget? imageIcon;
  final void Function()? actionsToDo;

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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            imageIcon != null ? imageIcon! : const SizedBox.shrink(),
            imageIcon != null
                ? const SizedBox(width: 14.5)
                : const SizedBox.shrink(),
            Text(
              text,
              style: textStyle ?? styleBold(16, textColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
      actionsToDo: actionsToDo,
    );
  }
}
