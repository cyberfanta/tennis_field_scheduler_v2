import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/lang/ui_texts.dart';
import '../../../app/theme/ui_colors.dart';
import '../../../app/theme/ui_text_styles.dart';
import '../../../domain/use_cases/inner_views/favorites_view_use_cases.dart';
import '../../common_widgets/backgrounds/base_background.dart';
import '../../common_widgets/other_widgets/lower_margin.dart';
import '../../common_widgets/other_widgets/upper_margin.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  static const routeName = '/FavoritesView';

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  String tag =
      FavoritesView.routeName.substring(1, FavoritesView.routeName.length);
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
    double leftMargin = 23;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const UpperMargin(),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: [
              const SizedBox(height: 21),
              Container(
                margin: EdgeInsets.only(left: leftMargin),
                child: Text(
                  uiTexts.myFavorites,
                  style: styleMedium(18, cBlack),
                ),
              ),
              const SizedBox(height: 16),
              ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return const SizedBox(
                    width: double.infinity,
                    height: 152,
                    child: Placeholder(),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 16);
                },
                itemCount: 5,
              ),
              const SizedBox(height: 20),
              const LowerMargin(),
            ],
          ),
        ),
      ],
    );
  }
}
