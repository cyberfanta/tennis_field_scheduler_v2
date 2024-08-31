import 'package:flutter/material.dart';

import '../../../app/theme/ui_colors.dart';
import '../../../app/theme/ui_text_styles.dart';
import '../behaviors/ontap_wrapper.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({
    super.key,
    required this.controller,
    required this.hint,
    required this.dateSelected,
    required this.actionsToDo,
  });

  final TextEditingController controller;
  final String hint;
  final String dateSelected;
  final void Function() actionsToDo;

  @override
  Widget build(BuildContext context) {
    return OnTapWrapper(
      widgetToWrap: Container(
        height: 50,
        decoration: BoxDecoration(
          color: cWhite,
          border: Border.all(color: cBlack, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.centerLeft,
        child: Text(
          (dateSelected.isEmpty || dateSelected == "null")
              ? hint
              : controller.text,
          style: styleRegular(14, cBlack),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      actionsToDo: actionsToDo,
    );
  }
}
