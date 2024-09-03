import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_field_scheduler_v2/app/lang/ui_texts.dart';
import 'package:tennis_field_scheduler_v2/domain/use_cases/full_page_view/reserve_full_page_view_cubit.dart';
import 'package:tennis_field_scheduler_v2/presentation/common_widgets/backgrounds/error_message_cubit.dart';
import 'package:uuid/uuid.dart';

import '../../../app/static_data/static_data.dart';
import '../../../presentation/common_widgets/custom_button/custom_button_with_title.dart';
import '../../../presentation/common_widgets/custom_dropdown/custom_dropdown_data_cubit.dart';
import '../../../presentation/views/full_page_view/reserve_full_page_view.dart';
import '../../../utils/get_next_available_day.dart';
import '../../../utils/stamp.dart';
import '../../../utils/turn_timestamp_into_dates.dart';
import '../../entities/field_schedule.dart';
import '../../entities/scheduled_field.dart';

class ReserveFullPageViewUseCases {
  final String _tag = ReserveFullPageView.routeName
      .substring(1, ReserveFullPageView.routeName.length);

  Future<void> Function() initState(BuildContext context) => () async {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          ReserveFullPageViewCubit reserveFullPageViewCubit =
              context.read<ReserveFullPageViewCubit>();

          reserveFullPageViewCubit.getForecast(getNextClosestDay(
            DateTime.now(),
            reserveFullPageViewCubit.state.fieldSelected.availableDates,
          ));

          reserveFullPageViewCubit
              .setDateOfToday(turnDateTimeIntoLatinDate(DateTime.now()));
        });
      };

  Future<void> Function() toggleFavorite(
          BuildContext context, UiTexts uiTexts, String rainChance) =>
      () async {
        stamp(_tag, "Button Pressed: \"toggleFavorite\"",
            decoratorChar: " * ", extraLine: true);

        Uuid uuid = const Uuid();
        String id = uuid.v4();

        TennisField tennisField =
            context.read<ReserveFullPageViewCubit>().state.fieldSelected;

        ScheduledField item = ScheduledField(
          id,
          tennisField.name == fields[0].name
              ? 0
              : tennisField.name == fields[1].name
                  ? 1
                  : 2,
          customButtonWithTitleData[1].value.replaceAll("-", "/"),
          customButtonWithTitleData[2].value,
          int.parse(customButtonWithTitleData[3].value.split(":")[0]) -
              int.parse(customButtonWithTitleData[2].value.split(":")[0]),
          "${currentUser.name}",
          context.read<CustomDropdownDataCubit>().getData(0),
          double.parse(rainChance.replaceAll("%", ".0")) / 100,
          true,
        );

        favoriteList.value.add(item);

        context.read<ErrorMessageCubit>().setValue(uiTexts.addedFavorite);
      };

  Future<void> Function() makeReserve(BuildContext context) => () async {
        stamp(_tag, "Button Pressed: \"makeReserve\"",
            decoratorChar: " * ", extraLine: true);
      };

  Future<void> Function() setDateTime(BuildContext context) => () async {
        stamp(_tag, "Button Pressed: \"setDateTime\"",
            decoratorChar: " * ", extraLine: true);

        context.read<ReserveFullPageViewCubit>().setSchedule(context);
      };

  Future<void> Function() makePayment(
          BuildContext context, UiTexts uiTexts, String rainChance) =>
      () async {
        stamp(_tag, "Button Pressed: \"makePayment\"",
            decoratorChar: " * ", extraLine: true);

        Uuid uuid = const Uuid();
        String id = uuid.v4();

        TennisField tennisField =
            context.read<ReserveFullPageViewCubit>().state.fieldSelected;

        ScheduledField item = ScheduledField(
          id,
          tennisField.name == fields[0].name
              ? 0
              : tennisField.name == fields[1].name
                  ? 1
                  : 2,
          customButtonWithTitleData[1].value.replaceAll("-", "/"),
          customButtonWithTitleData[2].value,
          int.parse(customButtonWithTitleData[3].value.split(":")[0]) -
              int.parse(customButtonWithTitleData[2].value.split(":")[0]),
          "${currentUser.name}",
          context.read<CustomDropdownDataCubit>().getData(0),
          double.parse(rainChance.replaceAll("%", ".0")) / 100,
          false,
        );

        scheduleList.value.add(item);

        context.read<ErrorMessageCubit>().setValue(uiTexts.addedSchedule);

        viewManager.goToControlPoint(context);
      };

  Future<void> Function() backActions(BuildContext context) => () async {
        stamp(_tag, "Button Pressed: \"Back\"",
            decoratorChar: " * ", extraLine: true);

        viewManager.pop(context);
      };
}
