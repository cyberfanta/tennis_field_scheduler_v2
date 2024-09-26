import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/lang/ui_texts.dart';
import '../../../app/static_data/static_data.dart';
import '../../../app/theme/ui_colors.dart';
import '../../../app/theme/ui_text_styles.dart';
import '../../../domain/entities/scheduled_field.dart';
import '../../../domain/use_cases/inner_views/favorites_view_use_cases.dart';
import '../../common_widgets/backgrounds/base_background.dart';
import '../../common_widgets/behaviors/dismissible_wrapper.dart';
import '../../common_widgets/cards/reserved_field_card_2.dart';
import '../../common_widgets/other_widgets/lower_margin.dart';
import '../../common_widgets/other_widgets/no_favorites_text.dart';
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
              ValueListenableBuilder(
                valueListenable: favoriteList,
                builder: (context, list, _) {
                  if (list.isEmpty) {
                    return const NoFavoritesText();
                  }

                  return buildColumn(list);
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        const LowerMargin(),
      ],
    );
  }

  Widget buildColumn(List<ScheduledField> list) {
    List<Widget> answer = [];

    for (int index = 0; index < list.length; index++) {
      ScheduledField item = list[index];

      if (!item.isFavorite) {
        continue;
      }

      answer.add(DismissibleWrapper(
        id: item.id,
        widgetToWrap: ReservedFieldCard2(
          scheduledField: list[index],
        ),
        actionToDo: (direction) {
          favoritesViewUseCases.deleteSchedule(tag, index)();
        },
      ));

      answer.add(const SizedBox(height: 8));
    }

    if (answer.isEmpty) {
      return const NoFavoritesText();
    }

    answer.removeLast();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: answer,
    );
  }
}
