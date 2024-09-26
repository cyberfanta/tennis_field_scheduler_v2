import 'package:flutter/material.dart';

import '../other_widgets/delete_icon.dart';

class DismissibleWrapper extends StatelessWidget {
  const DismissibleWrapper({
    super.key,
    required this.id,
    required this.widgetToWrap,
    required this.actionToDo,
  });

  final String id;
  final Widget widgetToWrap;
  final void Function(DismissDirection)? actionToDo;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(id),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        child: const Row(
          children: [
            DeleteIcon(),
            Expanded(child: SizedBox.shrink()),
          ],
        ),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        child: const Row(
          children: [
            Expanded(child: SizedBox.shrink()),
            DeleteIcon(),
          ],
        ),
      ),
      onDismissed: actionToDo,
      child: widgetToWrap,
    );
  }
}
