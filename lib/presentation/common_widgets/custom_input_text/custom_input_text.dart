import 'package:flutter/material.dart';

import '../../../app/theme/ui_colors.dart';
import '../../../app/theme/ui_text_styles.dart';

class CustomInputText extends StatelessWidget {
  const CustomInputText({
    super.key,
    required this.controller,
    required this.hint,
    required this.keyboard,
    required this.textInputAction,
  });

  final TextEditingController controller;
  final String hint;
  final TextInputType keyboard;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cWhite,
        border: Border.all(color: cBlack, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.centerLeft,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: styleRegular(14, cBlack),
        ),
        cursorColor: cBlack,
        keyboardType: keyboard,
        textInputAction: textInputAction,
        obscuringCharacter: '*',
        style: styleRegular(14, cBlack),
      ),
    );
  }
}
