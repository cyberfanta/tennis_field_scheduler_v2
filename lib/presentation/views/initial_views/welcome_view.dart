import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennis_field_scheduler_v2/app/theme/ui_colors.dart';
import 'package:tennis_field_scheduler_v2/presentation/common_widgets/custom_button/custom_button.dart';

import '../../../app/lang/ui_texts.dart';
import '../../../domain/use_cases/initial_views/welcome_view_use_cases.dart';
import '../../common_widgets/backgrounds/base_background.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  static const routeName = '/';

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  WelcomeViewUseCases welcomeViewUseCases = WelcomeViewUseCases();

  @override
  void initState() {
    super.initState();
    welcomeViewUseCases.initState(context)();
  }

  @override
  Widget build(BuildContext context) {
    UiTexts uiTexts = Provider.of<UiTexts>(context);
    Size screenSize = MediaQuery.of(context).size;

    return BaseBackground(
      backActions: welcomeViewUseCases.backActions(context),
      backgroundImage: "assets/images/landing_background.png",
      content: buildContent(
        screenSize,
        uiTexts,
      ),
    );
  }

  Widget buildContent(Size screenSize, UiTexts uiTexts) {
    return Container(
      margin: const EdgeInsets.only(top: 90, bottom: 51),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 83),
            child: Image.asset(
              "assets/images/logo.png",
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 32),
                child: CustomButton(
                  context: context,
                  text: uiTexts.goLogin,
                  backgroundColor: cGreenForeground,
                  actionsToDo: welcomeViewUseCases.goLogin(context),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 32),
                child: CustomButton(
                  context: context,
                  text: uiTexts.goSignUp,
                  backgroundColor: cWhiteOpacity30,
                  actionsToDo: welcomeViewUseCases.goSignUp(context),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
