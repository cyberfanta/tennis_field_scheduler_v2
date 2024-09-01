import 'package:flutter/material.dart';
import 'package:tennis_field_scheduler_v2/presentation/views/login_view/login_view.dart';

import '../../../app/static_data/static_data.dart';
import '../../../presentation/views/inner_view/begin_view.dart';
import '../../../presentation/views/login_view/signup_view.dart';
import '../../../utils/stamp.dart';

class SignUpViewUseCases {
  final String _tag =
      SignUpView.routeName.substring(1, SignUpView.routeName.length);

  Future<void> Function() initState(BuildContext context) => () async {};

  Future<void> Function() doSignUp(BuildContext context) => () async {
        stamp(_tag, "Button Pressed: \"doSignUp\"",
            decoratorChar: " * ", extraLine: true);

        viewManager.popAndStay(context);
        viewManager.pushAndStay(context, LoginView.routeName);
        viewManager.setControlPoint(BeginView.routeName);
        viewManager.push(context, BeginView.routeName);
      };

  Future<void> Function() backActions(BuildContext context) => () async {
        stamp(_tag, "Button Pressed: \"Back\"",
            decoratorChar: " * ", extraLine: true);

        viewManager.pop(context);
      };
}
