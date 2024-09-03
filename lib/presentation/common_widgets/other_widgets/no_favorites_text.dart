import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/lang/ui_texts.dart';
import '../../../app/theme/ui_colors.dart';
import '../../../app/theme/ui_text_styles.dart';

class NoFavoritesText extends StatelessWidget {
  const NoFavoritesText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    UiTexts uiTexts = Provider.of<UiTexts>(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      child: Text(
        uiTexts.noFavorites,
        style: styleRegular(16, cBlack),
      ),
    );
  }
}
