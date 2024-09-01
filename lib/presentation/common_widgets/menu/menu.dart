import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:tennis_field_scheduler_v2/app/theme/ui_colors.dart';

import '../../../app/lang/ui_texts.dart';
import '../../../domain/use_cases/menu/menu_use_cases.dart';
import 'menu_card.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    UiTexts uiTexts = Provider.of<UiTexts>(context);
    double itemWidth = 70;
    double itemHeight = 50;

    MenuUseCases menuUseCases = MenuUseCases();

    return SimpleShadow(
      offset: const Offset(0, -1),
      color: cGrayShadow,
      sigma: 6,
      child: Container(
        width: double.infinity,
        height: 74,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: cWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const SizedBox(width: 20),
                MenuCard(
                  index: 0,
                  itemWidth: itemWidth,
                  itemHeight: itemHeight,
                  imageSelected: "assets/images/home_filled.svg",
                  imageUnselected: "assets/images/home.svg",
                  text: uiTexts.begin,
                  actionsToDo: menuUseCases.goToBegin(context),
                ),
                const Expanded(child: SizedBox.shrink()),
                MenuCard(
                  index: 1,
                  itemWidth: itemWidth,
                  itemHeight: itemHeight,
                  imageSelected: "assets/images/today_filled.svg",
                  imageUnselected: "assets/images/today.svg",
                  text: uiTexts.reservations,
                  actionsToDo: menuUseCases.goToReservations(context),
                ),
                const Expanded(child: SizedBox.shrink()),
                MenuCard(
                  index: 2,
                  itemWidth: itemWidth,
                  itemHeight: itemHeight,
                  imageSelected: "assets/images/favorite_filled.svg",
                  imageUnselected: "assets/images/favorite.svg",
                  text: uiTexts.favorites,
                  actionsToDo: menuUseCases.goToFavorites(context),
                ),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
