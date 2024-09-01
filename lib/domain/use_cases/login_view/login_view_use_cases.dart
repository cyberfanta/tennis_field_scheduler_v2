import 'package:flutter/material.dart';
import 'package:tennis_field_scheduler_v2/presentation/views/inner_view/begin_view.dart';

import '../../../app/static_data/static_data.dart';
import '../../../presentation/views/login_view/login_view.dart';
import '../../../utils/stamp.dart';

class LoginViewUseCases {
  final String _tag = LoginView.routeName.substring(1, LoginView.routeName.length);

  Future<void> Function() initState(BuildContext context) => () async {

      };

  Future<void> Function() doLogin(BuildContext context) => () async {
    stamp(_tag, "Button Pressed: \"doLogin\"",
        decoratorChar: " * ", extraLine: true);

    viewManager.setControlPoint(BeginView.routeName);
    viewManager.push(context, BeginView.routeName);
  };

  Future<void> Function() backActions(BuildContext context) =>
      () async {
        stamp(_tag, "Button Pressed: \"Back\"",
            decoratorChar: " * ", extraLine: true);

        viewManager.pop(context);
   };

}
