import 'package:flutter/material.dart';
import 'package:tennis_field_scheduler_v2/app/theme/ui_colors.dart';
import 'package:tennis_field_scheduler_v2/presentation/views/inner_view/begin_view.dart';
import 'package:tennis_field_scheduler_v2/presentation/views/login_view/signup_view.dart';

import '../../../app/static_data/static_data.dart';
import '../../../presentation/common_widgets/dialog/not_implemented_dialog.dart';
import '../../../presentation/views/login_view/login_view.dart';
import '../../../utils/stamp.dart';

class LoginViewUseCases {
  final String _tag =
      LoginView.routeName.substring(1, LoginView.routeName.length);

  Future<void> Function() initState(BuildContext context) => () async {};

  Future<void> Function() doForgotPass(BuildContext context) => () async {
        stamp(_tag, "Button Pressed: \"doForgotPass\"",
            decoratorChar: " * ", extraLine: true);

        showDialog(
          context: context,
          barrierColor: cBlackOpacity40,
          useSafeArea: false,
          builder: (BuildContext context) {
            return const NotImplementedDialog(
                tag: "Dialog Opened: \"NotImplemented\"");
          },
        );
      };

  Future<void> Function() doLogin(BuildContext context) => () async {
        stamp(_tag, "Button Pressed: \"doLogin\"",
            decoratorChar: " * ", extraLine: true);

        viewManager.setControlPoint(BeginView.routeName);
        viewManager.push(context, BeginView.routeName);
      };

  Future<void> Function() goSignUp(BuildContext context) => () async {
        stamp(_tag, "Button Pressed: \"goSignUp\"",
            decoratorChar: " * ", extraLine: true);

        viewManager.push(context, SignUpView.routeName);
      };

  Future<void> Function() backActions(BuildContext context) => () async {
        stamp(_tag, "Button Pressed: \"Back\"",
            decoratorChar: " * ", extraLine: true);

        viewManager.pop(context);
      };
}
