import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/static_data/static_data.dart';
import '../../../presentation/common_widgets/menu/menu_cubit.dart';
import '../../../presentation/views/full_page_view/reserve_full_page_view.dart';
import '../../../utils/stamp.dart';
import '../../entities/scheduled_field.dart';
import '../full_page_view/reserve_full_page_use_cases.dart';

class ReservationsViewUseCases {
  Future<void> Function() initState(BuildContext context) => () async {
        context.read<MenuCubit>().setData(1);
      };

  Future<void> Function() goReserve(String tag, BuildContext context) => () async {
    stamp(tag, "Button Pressed: \"goReserve\"",
        decoratorChar: " * ", extraLine: true);

    fieldSelected = fields[0];

    viewManager.push(context, ReserveFullPageView.routeName);

  };

  Future<void> Function() deleteSchedule(String tag, int index) =>
          () async {
        stamp(tag, "Gesture Used: \"deleteSchedule\"",
            decoratorChar: " * ", extraLine: true);

        final List<ScheduledField> newList = List<ScheduledField>.from(scheduleList.value);
        newList.removeAt(index);
        scheduleList.value = newList;
      };

  Future<void> Function() backActions(String tag, BuildContext context) =>
      () async {
        stamp(tag, "Button Pressed: \"Back\"",
            decoratorChar: " * ", extraLine: true);

        viewManager.pop(context);
      };
}
