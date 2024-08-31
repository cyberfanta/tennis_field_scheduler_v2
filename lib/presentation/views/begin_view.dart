import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/lang/ui_texts.dart';
import '../../domain/use_cases/landing_view/begin_view_use_cases.dart';
import '../common_widgets/backgrounds/base_background.dart';

class BeginView extends StatefulWidget {
  const BeginView({super.key});

  static const routeName = '/BeginView';

  @override
  State<BeginView> createState() => _BeginViewState();
}

class _BeginViewState extends State<BeginView> {
  String tag = BeginView.routeName.substring(1, BeginView.routeName.length);
  BeginViewUseCases beginViewUseCases = BeginViewUseCases();

  @override
  void initState() {
    super.initState();
    beginViewUseCases.initState(context)();
  }

  @override
  Widget build(BuildContext context) {
    UiTexts uiTexts = Provider.of<UiTexts>(context);
    Size screenSize = MediaQuery.of(context).size;

    return BaseBackground(
      backActions: beginViewUseCases.backActions(tag, context),
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
