import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/lang/ui_texts.dart';
import '../../../domain/use_cases/inner_views/favorites_view_use_cases.dart';
import '../../common_widgets/backgrounds/base_background.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  static const routeName = '/FavoritesView';

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  String tag = FavoritesView.routeName.substring(1, FavoritesView.routeName.length);
  FavoritesViewUseCases favoritesViewUseCases = FavoritesViewUseCases();

  @override
  void initState() {
    super.initState();
    favoritesViewUseCases.initState(context)();
  }

  @override
  Widget build(BuildContext context) {
    UiTexts uiTexts = Provider.of<UiTexts>(context);
    Size screenSize = MediaQuery.of(context).size;

    return BaseBackground(
      backActions: favoritesViewUseCases.backActions(tag, context),
      hasAppBar: true,
      hasMenu: true,
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
