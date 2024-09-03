import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_field_scheduler_v2/domain/use_cases/login_views/signup_view_cubit.dart';
import 'package:tennis_field_scheduler_v2/presentation/views/login_views/login_view.dart';

import '../../../app/lang/ui_texts.dart';
import '../../../app/static_data/static_data.dart';
import '../../../data/repository.dart';
import '../../../presentation/common_widgets/backgrounds/error_message_cubit.dart';
import '../../../presentation/views/inner_views/begin_view.dart';
import '../../../presentation/views/login_views/signup_view.dart';
import '../../../utils/stamp.dart';
import '../../entities/base_user.dart';

class SignUpViewUseCases {
  final String _tag =
      SignUpView.routeName.substring(1, SignUpView.routeName.length);
  Repository repository = Repository();

  Future<void> Function() initState(BuildContext context) => () async {
        context.read<SignUpViewCubit>().reset();
      };

  Future<void> Function() doSignUp(BuildContext context, UiTexts uiTexts,
          String name, String email, String phone, String pass) =>
      () async {
        stamp(_tag, "Button Pressed: \"doSignUp\"",
            decoratorChar: " * ", extraLine: true);

        FocusScope.of(context).unfocus();

        if (name.isEmpty) {
          stamp(_tag, "Can not login - Name is empty");
          context.read<ErrorMessageCubit>().setValue(uiTexts.emailEmpty);
          return;
        }

        if (email.isEmpty) {
          stamp(_tag, "Can not login - Email is empty");
          context.read<ErrorMessageCubit>().setValue(uiTexts.emailEmpty);
          return;
        }

        if (phone.isEmpty) {
          stamp(_tag, "Can not login - Phone is empty");
          context.read<ErrorMessageCubit>().setValue(uiTexts.phoneEmpty);
          return;
        }

        if (pass.isEmpty) {
          stamp(_tag, "Can not login - Pass is empty");
          context.read<ErrorMessageCubit>().setValue(uiTexts.passEmpty);
          return;
        }

        BaseUser baseUser = BaseUser(
          name: name,
          email: email,
          phone: phone,
          pass: pass,
          remember: false,
        );

        stamp(_tag, "Sign up success!!!");
        currentUser = baseUser;
        scheduleList.value = defaultScheduled;
        favoriteList.value = defaultScheduled;

        await repository.saveLogin(baseUser);

        // ignore: use_build_context_synchronously
        viewManager.popAndStay(context);
        // ignore: use_build_context_synchronously
        viewManager.pushAndStay(context, LoginView.routeName);
        viewManager.setControlPoint(BeginView.routeName);
        // ignore: use_build_context_synchronously
        viewManager.push(context, BeginView.routeName);
      };

  Future<void> Function() goLogIn(BuildContext context) => () async {
        stamp(_tag, "Button Pressed: \"goLogIn\"",
            decoratorChar: " * ", extraLine: true);

        viewManager.popAndStay(context);
        viewManager.push(context, LoginView.routeName);
      };

  Future<void> Function() backActions(BuildContext context) => () async {
        stamp(_tag, "Button Pressed: \"Back\"",
            decoratorChar: " * ", extraLine: true);

        viewManager.pop(context);
      };
}
