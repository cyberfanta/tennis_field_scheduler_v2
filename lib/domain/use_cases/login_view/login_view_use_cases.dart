import 'package:flutter/material.dart';
import 'package:tennis_field_scheduler_v2/app/theme/ui_colors.dart';
import 'package:tennis_field_scheduler_v2/app/theme/ui_text_styles.dart';
import 'package:tennis_field_scheduler_v2/presentation/views/inner_view/begin_view.dart';
import 'package:tennis_field_scheduler_v2/presentation/views/login_view/signup_view.dart';

import '../../../app/static_data/static_data.dart';
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
            String tag = "Upgrade Modal";
            stamp(tag, "Opened");

            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: cBlue,
              ),
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 100,vertical: 400),
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Material(
                color: cTransparent,
                child: Text(
                  "Esta funcionalidad no esta implementada aún",
                  style: styleRegular(14, cWhite),
                  textAlign: TextAlign.center,
                ),
              ),
            );
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
