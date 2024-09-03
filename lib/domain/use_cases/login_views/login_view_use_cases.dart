import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_field_scheduler_v2/app/lang/ui_texts.dart';
import 'package:tennis_field_scheduler_v2/app/theme/ui_colors.dart';
import 'package:tennis_field_scheduler_v2/data/repository.dart';
import 'package:tennis_field_scheduler_v2/domain/use_cases/login_views/login_view_cubit.dart';
import 'package:tennis_field_scheduler_v2/presentation/views/inner_views/begin_view.dart';
import 'package:tennis_field_scheduler_v2/presentation/views/login_views/signup_view.dart';

import '../../../app/static_data/static_data.dart';
import '../../../presentation/common_widgets/backgrounds/error_message_cubit.dart';
import '../../../presentation/common_widgets/dialog/not_implemented_dialog.dart';
import '../../../presentation/views/login_views/login_view.dart';
import '../../../utils/stamp.dart';
import '../../entities/base_user.dart';

class LoginViewUseCases {
  final String _tag =
      LoginView.routeName.substring(1, LoginView.routeName.length);
  Repository repository = Repository();

  Future<void> Function() initState(
          BuildContext context, List<TextEditingController> controllers) =>
      () async {
        LoginViewCubit loginViewCubit = context.read<LoginViewCubit>();
        loginViewCubit.reset();

        BaseUser? baseUser = await repository.getLogin();

        if (baseUser != null) {
          controllers[0].text = "${baseUser.email}";
          loginViewCubit.setEmail("${baseUser.email}");

          if (baseUser.remember == true) {
            controllers[1].text = "${baseUser.pass}";
            loginViewCubit.setPass("${baseUser.pass}");
            return;
          }

          controllers[1].text = "";
          loginViewCubit.removePass();
        }
      };

  Future<void> Function() doForgotPass(BuildContext context) => () async {
        stamp(_tag, "Button Pressed: \"doForgotPass\"",
            decoratorChar: " * ", extraLine: true);

        FocusScope.of(context).unfocus();

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

  Future<void> Function() doLogin(BuildContext context, UiTexts uiTexts,
          String email, String pass, bool rememberPass) =>
      () async {
        stamp(_tag, "Button Pressed: \"doLogin\"",
            decoratorChar: " * ", extraLine: true);

        FocusScope.of(context).unfocus();

        if (email.isEmpty) {
          stamp(_tag, "Can not login - Email is empty");
          context.read<ErrorMessageCubit>().setValue(uiTexts.emailEmpty);
          return;
        }

        if (pass.isEmpty) {
          stamp(_tag, "Can not login - Pass is empty");
          context.read<ErrorMessageCubit>().setValue(uiTexts.passEmpty);
          return;
        }

        BaseUser? baseUser = await repository.validateLogin();

        if (baseUser == null) {
          stamp(_tag, "Can not login - No login data available");
          // ignore: use_build_context_synchronously
          context.read<ErrorMessageCubit>().setValue(uiTexts.noData);
          return;
        }

        if (baseUser.email != email || baseUser.pass != pass) {
          stamp(_tag, "Can not login - Credential do not match");
          // ignore: use_build_context_synchronously
          context.read<ErrorMessageCubit>().setValue(uiTexts.wrongCredential);
          return;
        }

        stamp(_tag, "Login success!!!");

        BaseUser savingUser = BaseUser(
          name: baseUser.name,
          email: baseUser.email,
          phone: baseUser.phone,
          pass: baseUser.pass,
          remember: rememberPass,
        );
        await repository.saveLogin(savingUser);

        currentUser = savingUser;
        scheduleList.value = defaultScheduled;
        favoriteList.value = defaultScheduled;

        viewManager.setControlPoint(BeginView.routeName);
        // ignore: use_build_context_synchronously
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
