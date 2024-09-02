import 'package:flutter/material.dart';

double keyboardHeight = 340;
double menuHeight = 74;

class LowerMargin extends StatelessWidget {
  const LowerMargin({
    super.key,
    this.hasKeyboard = false,
  });

  final bool hasKeyboard;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hasKeyboard ? keyboardHeight : menuHeight,
    );
  }
}
