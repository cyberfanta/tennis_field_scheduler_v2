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
        decoration: decoration ??
            BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        clipBehavior: Clip.hardEdge,
        child: imageIcon != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  imageIcon!,
                  const SizedBox(width: 14.5),
                  Container(
                    constraints: const BoxConstraints(
                      maxWidth: 178,
                    ),
                    child: Text(
                      text,
                      style: textStyle ?? styleSemiBold(18, textColor),
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              )
            : Text(
                text,
                style: textStyle ?? styleSemiBold(18, textColor),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
      ),
      actionsToDo: actionsToDo,
    );
  }
}
