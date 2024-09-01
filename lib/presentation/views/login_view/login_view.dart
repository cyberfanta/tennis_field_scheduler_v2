import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennis_field_scheduler_v2/app/theme/ui_text_styles.dart';
import 'package:tennis_field_scheduler_v2/presentation/common_widgets/behaviors/ontap_wrapper.dart';
import 'package:tennis_field_scheduler_v2/presentation/common_widgets/custom_input_text/custom_input_text.dart';

import '../../../app/lang/ui_texts.dart';
import '../../../app/theme/ui_colors.dart';
import '../../../domain/use_cases/login_view/login_view_use_cases.dart';
import '../../../utils/validators.dart';
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

  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
  ];

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
    List<String> titles = [
      uiTexts.email,
      uiTexts.pass,
    ];

    List<String> icons = [
      "assets/images/email.svg",
      "assets/images/pass.svg",
    ];

    List<String> hints = [
      uiTexts.hintEmail,
      uiTexts.hintPass,
    ];

    List<TextInputType> keyboards = [
      TextInputType.text,
      TextInputType.visiblePassword,
    ];

    List<TextInputAction> textInputActions = [
      TextInputAction.next,
      TextInputAction.send,
    ];

    List<bool Function(String)> validators = [
      isValidEmail,
      isValidPassword,
    ];

    double marginHorizontal = 32;

    return Column(
      children: [
        Image.asset(
          "assets/images/login_background.png",
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: marginHorizontal),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Text(
                  uiTexts.goLogin,
                  style: styleSemiBold(24, cBlack),
                ),
                const SizedBox(height: 5),
                Container(
                  width: 80,
                  height: 1,
                  color: cBlue,
                ),
                const SizedBox(height: 46),
                CustomInputText(
                  title: titles[0],
                  icon: icons[0],
                  controller: controllers[0],
                  hint: hints[0],
                  keyboard: keyboards[0],
                  textInputAction: textInputActions[0],
                  validator: validators[0],
                ),
                const SizedBox(height: 20),
                CustomInputText(
                  title: titles[1],
                  icon: icons[1],
                  controller: controllers[1],
                  hint: hints[1],
                  keyboard: keyboards[1],
                  textInputAction: textInputActions[1],
                  validator: validators[1],
                ),
                const SizedBox(height: 13),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(width: 6),
                    Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        border: Border.all(color: cCheckBoxBorder),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      uiTexts.rememberPass,
                      style: styleRegular(12, cBlack),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      OnTapWrapper(
                        widgetToWrap: Text(
                          uiTexts.forgotYourPass,
                          style: styleRegular(14, cBlue),
                          textAlign: TextAlign.center,
                        ),
                        actionsToDo: loginViewUseCases.doForgotPass(context),
                      ),
                      const SizedBox(height: 40),
                      CustomButton(
                        context: context,
                        text: uiTexts.goLogin,
                        backgroundColor: cGreenForeground,
                        actionsToDo: loginViewUseCases.doLogin(context),
                      ),
                      const Expanded(child: SizedBox.shrink()),
                      OnTapWrapper(
                        widgetToWrap: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: uiTexts.stillNotAccount,
                                style: styleRegular(14, cBlack),
                              ),
                              TextSpan(
                                text: " ",
                                style: styleRegular(14, cBlack),
                              ),
                              TextSpan(
                                text: uiTexts.goSignUp2,
                                style: styleRegular(14, cBlue),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        actionsToDo: loginViewUseCases.goSignUp(context),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
