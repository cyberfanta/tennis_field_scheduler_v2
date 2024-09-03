import 'package:flutter/material.dart';

class OneButtonDialog extends StatelessWidget {
  const OneButtonDialog({
    super.key,
    required this.titleText,
    required this.titleTextStyle,
    required this.contentWidget,
    required this.backgroundColor,
    required this.borderColor,
    required this.borderWidth,
    required this.buttonText,
    required this.buttonTextStyle,
    required this.buttonAction,
    required this.buttonColor,
    required this.buttonBorderColor,
    required this.buttonBorderWidth,
    required this.buttonSize,
  });

  final String titleText;
  final TextStyle titleTextStyle;
  final Widget contentWidget;

  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;

  final String buttonText;
  final TextStyle buttonTextStyle;
  final Future<void> Function() buttonAction;
  final Color buttonColor;
  final Color buttonBorderColor;
  final double buttonBorderWidth;
  final Size buttonSize;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          width: borderWidth,
          color: borderColor,
        ),
      ),
      actionsOverflowAlignment: OverflowBarAlignment.center,
      title: Text(
        titleText,
        style: titleTextStyle,
        textAlign: TextAlign.center,
      ),
      content: contentWidget,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                side: BorderSide(
                  width: buttonBorderWidth,
                  color: buttonBorderColor,
                ),
                backgroundColor: buttonColor,
                padding: EdgeInsets.zero,
                fixedSize: buttonSize,
              ),
              onPressed: buttonAction,
              child: Text(
                buttonText,
                style: buttonTextStyle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
