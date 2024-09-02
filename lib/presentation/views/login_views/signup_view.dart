import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../app/lang/ui_texts.dart';
import '../../../app/theme/ui_colors.dart';
import '../../../app/theme/ui_text_styles.dart';
import '../../../domain/use_cases/login_views/signup_view_cubit.dart';
import '../../../domain/use_cases/login_views/signup_view_use_cases.dart';
import '../../common_widgets/backgrounds/base_background.dart';
import '../../common_widgets/behaviors/ontap_wrapper.dart';
import '../../common_widgets/custom_button/custom_button.dart';
import '../../common_widgets/custom_input_text/custom_input_text.dart';
import '../../common_widgets/other_widgets/lower_margin.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  static const routeName = '/SignUpView';

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  SignUpViewUseCases signUpViewUseCases = SignUpViewUseCases();

  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  @override
  void initState() {
    super.initState();
    signUpViewUseCases.initState(context)();
  }

  @override
  Widget build(BuildContext context) {
    UiTexts uiTexts = Provider.of<UiTexts>(context);
    Size screenSize = MediaQuery.of(context).size;

    return BaseBackground(
      backActions: signUpViewUseCases.backActions(context),
      hasBackButton: true,
      content: buildContent(
        screenSize,
        uiTexts,
      ),
    );
  }

  Widget buildContent(Size screenSize, UiTexts uiTexts) {
    List<String> icons = [
      "assets/images/name.svg",
      "assets/images/email.svg",
      "assets/images/phone.svg",
      "assets/images/pass.svg",
      "assets/images/pass.svg",
    ];

    List<String> hints = [
      uiTexts.hintName,
      uiTexts.email,
      uiTexts.hintPhone,
      uiTexts.pass,
      uiTexts.confirmPass,
    ];

    List<TextInputType> keyboards = [
      TextInputType.name,
      TextInputType.emailAddress,
      TextInputType.phone,
      TextInputType.visiblePassword,
      TextInputType.visiblePassword,
    ];

    List<TextInputAction> textInputActions = [
      TextInputAction.next,
      TextInputAction.next,
      TextInputAction.next,
      TextInputAction.next,
      TextInputAction.send,
    ];

    List<bool Function(String)> validators = [
      context.read<SignUpViewCubit>().validateName,
      context.read<SignUpViewCubit>().validateEmail,
      context.read<SignUpViewCubit>().validatePhone,
      context.read<SignUpViewCubit>().validatePass,
      context.read<SignUpViewCubit>().validateConfirmPass,
    ];

    List<String> errors = [
      uiTexts.nameError,
      uiTexts.emailError,
      uiTexts.phoneError,
      uiTexts.passError1,
      uiTexts.confirmPassError,
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
                      uiTexts.goSignUp3,
                      style: styleSemiBold(24, cBlack),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: 80,
                      height: 1,
                      color: cBlue,
                    ),
                    const SizedBox(height: 46),
                    BlocBuilder<SignUpViewCubit, SignUpViewData>(
                      builder: (context, state) {
                        return CustomInputText(
                          title: "",
                          icon: icons[0],
                          controller: controllers[0],
                          hint: hints[0],
                          keyboard: keyboards[0],
                          textInputAction: textInputActions[0],
                          validator: validators[0],
                          hasError: state.nameHasError,
                          errorMessage: errors[0],
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    BlocBuilder<SignUpViewCubit, SignUpViewData>(
                      builder: (context, state) {
                        return CustomInputText(
                          title: "",
                          icon: icons[1],
                          controller: controllers[1],
                          hint: hints[1],
                          keyboard: keyboards[1],
                          textInputAction: textInputActions[1],
                          validator: validators[1],
                          hasError: state.emailHasError,
                          errorMessage: errors[1],
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    BlocBuilder<SignUpViewCubit, SignUpViewData>(
                      builder: (context, state) {
                        return CustomInputText(
                          title: "",
                          icon: icons[2],
                          controller: controllers[2],
                          hint: hints[2],
                          keyboard: keyboards[2],
                          textInputAction: textInputActions[2],
                          validator: validators[2],
                          hasError: state.phoneHasError,
                          errorMessage: errors[2],
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    BlocBuilder<SignUpViewCubit, SignUpViewData>(
                      builder: (context, state) {
                        return CustomInputText(
                          title: "",
                          icon: icons[3],
                          controller: controllers[3],
                          hint: hints[3],
                          keyboard: keyboards[3],
                          textInputAction: textInputActions[3],
                          validator: validators[3],
                          hasError: state.passHasError,
                          errorMessage: errors[3],
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    BlocBuilder<SignUpViewCubit, SignUpViewData>(
                      builder: (context, state) {
                        return CustomInputText(
                          title: "",
                          icon: icons[4],
                          controller: controllers[4],
                          hint: hints[4],
                          keyboard: keyboards[4],
                          textInputAction: textInputActions[4],
                          validator: validators[4],
                          hasError: state.confirmPassHasError,
                          errorMessage: errors[4],
                        );
                      },
                    ),
                    const SizedBox(height: 40),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BlocBuilder<SignUpViewCubit, SignUpViewData>(
                          builder: (context, state) {
                            return CustomButton(
                              context: context,
                              text: uiTexts.goSignUp,
                              backgroundColor: state.buttonAllowed
                                  ? cGreenForeground
                                  : cBlackOpacity15,
                              actionsToDo: state.buttonAllowed
                                  ? signUpViewUseCases.doSignUp(
                                      context,
                                      uiTexts,
                                      controllers[0].text,
                                      controllers[1].text,
                                      controllers[2].text,
                                      controllers[3].text,
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
                                  text: uiTexts.youHaveAccount,
                                  style: styleRegular(14, cBlack),
                                ),
                                TextSpan(
                                  text: " ",
                                  style: styleRegular(14, cBlack),
                                ),
                                TextSpan(
                                  text: uiTexts.goLogin,
                                  style: styleRegular(14, cBlue),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          actionsToDo: signUpViewUseCases.goLogIn(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const LowerMargin(hasKeyboard: true),
      ],
    );
  }
}
