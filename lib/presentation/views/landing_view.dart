import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/lang/ui_texts.dart';
import '../../domain/use_cases/landing_view/landing_view_use_cases.dart';
import '../common_widgets/backgrounds/base_background.dart';

class LandingView extends StatefulWidget {
  const LandingView({super.key});

  static const routeName = '/';

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  String tag = LandingView.routeName.substring(1, LandingView.routeName.length);
  LandingViewUseCases landingViewUseCases = LandingViewUseCases();

  @override
  void initState() {
    super.initState();
    landingViewUseCases.initState(context)();
  }

  @override
  Widget build(BuildContext context) {
    UiTexts uiTexts = Provider.of<UiTexts>(context);
    Size screenSize = MediaQuery.of(context).size;

    return BaseBackground(
      backActions: landingViewUseCases.backActions(tag, context),
      hasBackButton: true,
      hasFavoriteButton: true,
      hasAppBar: true,
      hasMenu: true,
      // backgroundImage: "assets/images/landing_background.png",
      content: buildContent(
        screenSize,
        uiTexts,
      ),
    );
  }

  Widget buildContent(Size screenSize, UiTexts uiTexts) {
    return const Placeholder();
  }
}
