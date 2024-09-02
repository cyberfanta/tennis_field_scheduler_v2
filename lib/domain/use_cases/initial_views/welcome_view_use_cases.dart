import 'package:flutter/material.dart';
import 'package:tennis_field_scheduler_v2/presentation/views/login_views/login_view.dart';
import 'package:tennis_field_scheduler_v2/presentation/views/login_views/signup_view.dart';

import '../../../app/static_data/static_data.dart';
import '../../../app/theme/ui_colors.dart';
import '../../../presentation/common_widgets/dialog/log_out_dialog.dart';
import '../../../presentation/views/initial_views/welcome_view.dart';
import '../../../utils/stamp.dart';

class WelcomeViewUseCases {
  final String _tag =
      WelcomeView.routeName.substring(1, WelcomeView.routeName.length);

  Future<void> Function() initState(BuildContext context) => () async {
  };

  Future<void> Function() goLogin(BuildContext context) => () async {
        stamp(_tag, "Button Pressed: \"goLogin\"",
            decoratorChar: " * ", extraLine: true);

        viewManager.push(context, LoginView.routeName);
      };

  Future<void> Function() goSignUp(BuildContext context) => () async {
        stamp(_tag, "Button Pressed: \"goSignUp\"",
            decoratorChar: " * ", extraLine: true);

        viewManager.push(context, SignUpView.routeName);
      };

  Future<void> Function() backActions(BuildContext context) => () async {
        stamp(_tag, "Button Pressed: \"Back\"",
            decoratorChar: " * ", extraLine: true);

        showDialog(
          context: context,
          barrierColor: cBlackOpacity50,
          useSafeArea: false,
          builder: (BuildContext context) {
            return const LogOutDialog(tag: "Dialog Opened: \"Logout\"");
          },
        );
      };
}
