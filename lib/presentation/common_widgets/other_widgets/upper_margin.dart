import 'package:flutter/material.dart';

double safeAreaTop = 40;
double appBarHeight = 64;

class UpperMargin extends StatelessWidget {
  const UpperMargin({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: safeAreaTop + appBarHeight,
    );
  }
}
