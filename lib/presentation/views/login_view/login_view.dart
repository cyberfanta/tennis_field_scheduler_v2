import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/lang/ui_texts.dart';
import '../../../app/theme/ui_colors.dart';
import '../../../domain/use_cases/login_view/login_view_use_cases.dart';
import '../../common_widgets/backgrounds/base_background.dart';
import '../../common_widgets/custom_button/custom_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  static const routeName = '/LoginView';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginViewUseCases loginViewUseCases = LoginViewUseCases();

  @override
  void initState() {
    super.initState();
    loginViewUseCases.initState(context)();
  }

  @override
  Widget build(BuildContext context) {
    UiTexts uiTexts = Provider.of<UiTexts>(context);
    Size screenSize = MediaQuery.of(context).size;

    return BaseBackground(
      backActions: loginViewUseCases.backActions(context),
      hasBackButton: true,
      content: buildContent(
        screenSize,
        uiTexts,
      ),
    );
  }

  Widget buildContent(Size screenSize, UiTexts uiTexts) {
    return Column(
      children: [
        Image.asset(
          "assets/images/login_background.png",
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        const Expanded(child: SizedBox.shrink()),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          child: CustomButton(
            context: context,
            text: uiTexts.goLogin,
            backgroundColor: cGreenForeground,
            actionsToDo: loginViewUseCases.doLogin(context),
          ),
        ),
        const SizedBox(
          height: 164,
        ),
      ],
    );
  }
}
