import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/lang/ui_texts.dart';
import '../../../app/theme/ui_colors.dart';
import '../../../app/theme/ui_text_styles.dart';

class DatePickerTitle extends StatelessWidget {
  const DatePickerTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    UiTexts uiTexts = Provider.of<UiTexts>(context);

    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Text(
        uiTexts.dateTime,
        style: styleMedium(18, cBlack),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
      ),
    );
  }
}
