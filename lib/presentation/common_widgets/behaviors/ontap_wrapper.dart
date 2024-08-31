import 'package:flutter/material.dart';

class OnTapWrapper extends StatelessWidget {
  const OnTapWrapper({
    super.key,
    required this.widgetToWrap,
    this.actionsToDo,
  });

  final Widget widgetToWrap;
  final VoidCallback? actionsToDo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: actionsToDo,
      child: widgetToWrap,
    );
  }
}
