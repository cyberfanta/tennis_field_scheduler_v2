import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/lang/ui_texts.dart';
import '../../../app/theme/ui_colors.dart';
import '../../../app/theme/ui_text_styles.dart';
import 'templates/one_button_dialog.dart';

class NotImplementedDialog extends StatelessWidget {
  const NotImplementedDialog({
    super.key,
    required this.tag,
  });

  final String tag;

  @override
  Widget build(BuildContext context) {
    UiTexts uiTexts = Provider.of<UiTexts>(context);

    return OneButtonDialog(
      tag: tag,
      titleText: uiTexts.info,
      titleTextStyle: styleMedium(18, cWhite),
      contentWidget: Text(
        uiTexts.notImplementedContext,
        style: styleRegular(14, cWhite),
        textAlign: TextAlign.center,
      ),
      backgroundColor: cBlueTransparent90,
      borderColor: cWhite,
      borderWidth: 1,
      buttonText: uiTexts.ok,
      buttonTextStyle: styleBold(12, cWhite),
      buttonAction: () async {
        Navigator.pop(context);
      },
      buttonColor: cGreenForeground,
      buttonBorderColor: cGreenForeground,
      buttonBorderWidth: 0,
      buttonSize: const Size(80, 24),
    );
  }
}
