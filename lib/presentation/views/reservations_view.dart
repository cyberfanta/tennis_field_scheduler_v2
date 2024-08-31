import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/lang/ui_texts.dart';
import '../../domain/use_cases/landing_view/reservations_view_use_cases.dart';
import '../common_widgets/backgrounds/base_background.dart';

class ReservationsView extends StatefulWidget {
  const ReservationsView({super.key});

  static const routeName = '/ReservationsView';

  @override
  State<ReservationsView> createState() => _ReservationsViewState();
}

class _ReservationsViewState extends State<ReservationsView> {
  String tag = ReservationsView.routeName.substring(1, ReservationsView.routeName.length);
  ReservationsViewUseCases reservationsViewUseCases = ReservationsViewUseCases();

  @override
  void initState() {
    super.initState();
    reservationsViewUseCases.initState(context)();
  }

  @override
  Widget build(BuildContext context) {
    UiTexts uiTexts = Provider.of<UiTexts>(context);
    Size screenSize = MediaQuery.of(context).size;

    return BaseBackground(
      backActions: reservationsViewUseCases.backActions(tag, context),
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
