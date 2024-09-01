import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/static_data/static_data.dart';
import '../../../presentation/common_widgets/menu/menu_cubit.dart';
import '../../../presentation/views/inner_view/begin_view.dart';
import '../../../presentation/views/inner_view/favorites_view.dart';
import '../../../presentation/views/inner_view/reservations_view.dart';

class MenuUseCases {
  void Function() goToBegin(BuildContext context) => () {
        if (viewManager.getCurrent() != BeginView.routeName) {
          context.read<MenuCubit>().setData(0);

          viewManager.goToControlPoint(context);
        }
      };

  Future<void> Function() goToReservations(BuildContext context) => () async {
        if (viewManager.getCurrent() != ReservationsView.routeName) {
          context.read<MenuCubit>().setData(1);

          viewManager.goToControlPointAndStay(context);
          viewManager.push(context, ReservationsView.routeName);
        }
      };

  void Function() goToFavorites(BuildContext context) => () {
        if (viewManager.getCurrent() != FavoritesView.routeName) {
          context.read<MenuCubit>().setData(2);

          viewManager.goToControlPointAndStay(context);
          viewManager.push(context, FavoritesView.routeName);
        }
      };
}
