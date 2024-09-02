import 'package:flutter/material.dart';

import '../../../app/theme/ui_colors.dart';

class CustomSeparator extends StatelessWidget {
  const CustomSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      color: cSeparator,
    );
  }
}
