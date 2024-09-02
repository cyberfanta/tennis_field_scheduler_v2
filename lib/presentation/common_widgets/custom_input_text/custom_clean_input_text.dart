import 'package:flutter/material.dart';

import '../../../app/theme/ui_colors.dart';
import '../../../app/theme/ui_text_styles.dart';

class CustomCleanInputText extends StatefulWidget {
  const CustomCleanInputText({
    super.key,
    required this.title,
    required this.controller,
    required this.hint,
    required this.keyboard,
    required this.textInputAction,
    this.size,
  });

  final String title;
  final TextEditingController controller;
  final String hint;
  final TextInputType keyboard;
  final TextInputAction textInputAction;
  final Size? size;

  @override
  State<CustomCleanInputText> createState() => _CustomCleanInputTextState();
}

class _CustomCleanInputTextState extends State<CustomCleanInputText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size?.width,
      height: widget.size?.height,
      decoration: BoxDecoration(
        color: cWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.title.isNotEmpty
              ? Text(
                  widget.title,
                  style: styleRegular(12, cInputTextTitle),
                )
              : const SizedBox.shrink(),
          widget.title.isNotEmpty
              ? const SizedBox(height: 4)
              : const SizedBox.shrink(),
          TextField(
            controller: widget.controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.hint,
              hintStyle: styleRegular(14, cGray2),
            ),
            cursorColor: cBlack,
            keyboardType: widget.keyboard,
            textInputAction: widget.textInputAction,
            obscureText: false,
            obscuringCharacter: '*',
            style: styleRegular(14, cBlack),
          ),
        ],
      ),
    );
  }
}
