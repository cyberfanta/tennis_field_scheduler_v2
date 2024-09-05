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
    this.decoration,
    this.imageIcon,
    this.actionsToDo,
  });

  final BuildContext context;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final TextStyle? textStyle;
  final BoxDecoration? decoration;
  final Widget? imageIcon;
  final void Function()? actionsToDo;

  @override
  Widget build(BuildContext context) {
    return OnTapWrapper(
      widgetToWrap: Container(
        width: double.infinity,
        height: 53,
        decoration: decoration ?? BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            imageIcon != null ? imageIcon! : const SizedBox.shrink(),
            imageIcon != null
                ? const SizedBox(width: 14.5)
                : const SizedBox.shrink(),
            Expanded(
              child: Text(
                text,
                style: textStyle ?? styleSemiBold(18, textColor),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      actionsToDo: actionsToDo,
    );
  }
}
