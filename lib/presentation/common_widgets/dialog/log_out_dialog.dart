import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tennis_field_scheduler_v2/presentation/common_widgets/dialog/two_button_dialog.dart';

import '../../../app/lang/ui_texts.dart';
import '../../../app/theme/ui_colors.dart';
import '../../../app/theme/ui_text_styles.dart';

class LogOutDialog extends StatelessWidget {
  const LogOutDialog({
    super.key,
    required this.tag,
  });

  final String tag;

  @override
  Widget build(BuildContext context) {
    UiTexts uiTexts = Provider.of<UiTexts>(context);

    return TwoButtonDialog(
      tag: tag,
      titleText: uiTexts.warning,
      titleTextStyle: styleMedium(18, cWhite),
      contentWidget: Text(
        uiTexts.closeAppContext,
        style: styleRegular(14, cWhite),
        textAlign: TextAlign.center,
      ),
      backgroundColor: cBlueTransparent90,
      borderColor: cWhite,
      borderWidth: 1,
      firstButtonText: uiTexts.yes,
      firstButtonTextStyle: styleRegular(12, cWhite),
      firstButtonAction: () async {
        Navigator.pop(context);
        SystemNavigator.pop();
      },
      firstButtonColor: cBlueTransparent90,
      firstButtonBorderColor: cWhite,
      firstButtonBorderWidth: 1,
      firstButtonSize: const Size(80, 24),
      secondButtonText: uiTexts.no,
      secondButtonTextStyle: styleBold(12, cWhite),
      secondButtonAction: () async {
        Navigator.pop(context);
      },
      secondButtonColor: cGreenForeground,
      secondButtonBorderColor: cGreenForeground,
      secondButtonBorderWidth: 0,
      secondButtonSize: const Size(80, 24),
    );
  }
}
