import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/lang/ui_texts.dart';
import '../../../app/theme/ui_colors.dart';
import '../../../app/theme/ui_text_styles.dart';
import 'templates/one_button_dialog.dart';

class DayNotAvailableDialog extends StatelessWidget {
  const DayNotAvailableDialog({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    UiTexts uiTexts = Provider.of<UiTexts>(context);

    return OneButtonDialog(
      titleText: uiTexts.info,
      titleTextStyle: styleMedium(18, cWhite),
      contentWidget: Text(
        uiTexts.dayNotAvailable,
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
