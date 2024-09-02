import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tennis_field_scheduler_v2/app/theme/ui_text_styles.dart';
import 'package:tennis_field_scheduler_v2/presentation/common_widgets/behaviors/ontap_wrapper.dart';
import 'package:tennis_field_scheduler_v2/presentation/common_widgets/custom_input_text/custom_input_text.dart';

import '../../../app/lang/ui_texts.dart';
import '../../../app/theme/ui_colors.dart';
import '../../../domain/use_cases/login_views/login_view_cubit.dart';
import '../../../domain/use_cases/login_views/login_view_use_cases.dart';
import '../../common_widgets/backgrounds/base_background.dart';
import '../../common_widgets/custom_button/custom_button.dart';
import '../../common_widgets/other_widgets/lower_margin.dart';

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
    loginViewUseCases.initState(context, controllers)();
  }

  @override
  Widget build(BuildContext context) {
    UiTexts uiTexts = Provider.of<UiTexts>(context);
    Size screenSize = MediaQuery.of(context).size;

    return BaseBackground(
      backActions: loginViewUseCases.backActions(context),
      hasBackButton: true,
      content: buildContent(
        context,
        screenSize,
        uiTexts,
      ),
    );
  }

  Widget buildContent(BuildContext context, Size screenSize, UiTexts uiTexts) {
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
      TextInputType.emailAddress,
      TextInputType.visiblePassword,
    ];

    List<TextInputAction> textInputActions = [
      TextInputAction.next,
      TextInputAction.send,
    ];

    List<bool Function(String)> validators = [
      context.read<LoginViewCubit>().validateEmail,
      context.read<LoginViewCubit>().validatePass,
    ];

    List<String> errors = [
      uiTexts.emailError,
      uiTexts.passError2,
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
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
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
                    BlocBuilder<LoginViewCubit, LoginViewData>(
                        builder: (context, state) {
                      return CustomInputText(
                        title: titles[0],
                        icon: icons[0],
                        controller: controllers[0],
                        hint: hints[0],
                        keyboard: keyboards[0],
                        textInputAction: textInputActions[0],
                        validator: validators[0],
                        hasError: state.emailHasError,
                        errorMessage: errors[0],
                      );
                    }),
                    const SizedBox(height: 20),
                    BlocBuilder<LoginViewCubit, LoginViewData>(
                      builder: (context, state) {
                        return CustomInputText(
                          title: titles[1],
                          icon: icons[1],
                          controller: controllers[1],
                          hint: hints[1],
                          keyboard: keyboards[1],
                          textInputAction: textInputActions[1],
                          validator: validators[1],
                          hasError: state.passHasError,
                          errorMessage: errors[1],
                        );
                      },
                    ),
                    const SizedBox(height: 13),
                    OnTapWrapper(
                      widgetToWrap: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(width: 6),
                          BlocBuilder<LoginViewCubit, LoginViewData>(
                            builder: (context, state) {
                              return SvgPicture.asset(
                                width: 16,
                                height: 16,
                                state.rememberPass
                                    ? "assets/images/check_box_selected.svg"
                                    : "assets/images/check_box.svg",
                              );
                            },
                          ),
                          const SizedBox(width: 8),
                          Text(
                            uiTexts.rememberPass,
                            style: styleRegular(12, cBlack),
                          ),
                        ],
                      ),
                      actionsToDo:
                          context.read<LoginViewCubit>().toggleRememberPass,
                    ),
                    const SizedBox(height: 20),
                    Column(
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
                        BlocBuilder<LoginViewCubit, LoginViewData>(
                          builder: (context, state) {
                            return CustomButton(
                              context: context,
                              text: uiTexts.goLogin,
                              backgroundColor: state.buttonAllowed
                                  ? cGreenForeground
                                  : cBlackOpacity15,
                              actionsToDo: state.buttonAllowed
                                  ? loginViewUseCases.doLogin(
                                      context,
                                      uiTexts,
                                      controllers[0].text,
                                      controllers[1].text,
                                      state.rememberPass,
                                    )
                                  : null,
                            );
                          },
                        ),
                        const SizedBox(height: 64),
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
                    const LowerMargin(hasKeyboard: true),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
