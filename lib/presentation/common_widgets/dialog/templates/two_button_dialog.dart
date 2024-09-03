import 'package:flutter/material.dart';

class TwoButtonDialog extends StatelessWidget {
  const TwoButtonDialog({
    super.key,
    required this.titleText,
    required this.titleTextStyle,
    required this.contentWidget,
    required this.backgroundColor,
    required this.borderColor,
    required this.borderWidth,
    required this.firstButtonText,
    required this.firstButtonTextStyle,
    required this.firstButtonAction,
    required this.firstButtonColor,
    required this.firstButtonBorderColor,
    required this.firstButtonBorderWidth,
    required this.firstButtonSize,
    required this.secondButtonText,
    required this.secondButtonTextStyle,
    required this.secondButtonAction,
    required this.secondButtonColor,
    required this.secondButtonBorderColor,
    required this.secondButtonBorderWidth,
    required this.secondButtonSize,
  });

  final String titleText;
  final TextStyle titleTextStyle;
  final Widget contentWidget;

  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;

  final String firstButtonText;
  final TextStyle firstButtonTextStyle;
  final Future<void> Function() firstButtonAction;
  final Color firstButtonColor;
  final Color firstButtonBorderColor;
  final double firstButtonBorderWidth;
  final Size firstButtonSize;

  final String secondButtonText;
  final TextStyle secondButtonTextStyle;
  final Future<void> Function() secondButtonAction;
  final Color secondButtonColor;
  final Color secondButtonBorderColor;
  final double secondButtonBorderWidth;
  final Size secondButtonSize;

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
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(
                      width: firstButtonBorderWidth,
                      color: firstButtonBorderColor,
                    ),
                    backgroundColor: firstButtonColor,
                    padding: EdgeInsets.zero,
                    fixedSize: firstButtonSize,
                  ),
                  onPressed: firstButtonAction,
                  child: Text(
                    firstButtonText,
                    style: firstButtonTextStyle,
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(
                      width: secondButtonBorderWidth,
                      color: secondButtonBorderColor,
                    ),
                    backgroundColor: secondButtonColor,
                    padding: EdgeInsets.zero,
                    fixedSize: secondButtonSize,
                  ),
                  onPressed: secondButtonAction,
                  child: Text(
                    secondButtonText,
                    style: secondButtonTextStyle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
