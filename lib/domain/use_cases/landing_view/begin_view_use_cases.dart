import 'package:flutter/material.dart';

import '../../../utils/stamp.dart';

class BeginViewUseCases {
  Future<void> Function() initState(BuildContext context) => () async {

      };

  Future<void> Function() backActions(String tag, BuildContext context) =>
      () async {
        stamp(tag, "Button Pressed: \"Back\"",
            decoratorChar: " * ", extraLine: true);
   };

}
