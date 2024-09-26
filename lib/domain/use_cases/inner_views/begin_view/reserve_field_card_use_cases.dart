import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_field_scheduler_v2/domain/use_cases/inner_views/begin_view/reserve_field_card_cubit.dart';
import 'package:tennis_field_scheduler_v2/presentation/views/full_page_view/reserve_full_page_view.dart';

import '../../../../app/static_data/static_data.dart';
import '../../../../data/repository.dart';
import '../../../../data/sources/local_data/local_data.dart';
import '../../../../data/sources/weather_api/weather_api.dart';
import '../../../../presentation/common_widgets/custom_dropdown/custom_dropdown_data_cubit.dart';
import '../../../../utils/get_next_available_day.dart';
import '../../../../utils/stamp.dart';
import '../../../entities/base_forecast.dart';
import '../../../entities/tennis_field.dart';
import '../../full_page_view/reserve_full_page_view_cubit.dart';

class ReserveFieldCardUseCases {
  Future<void> Function() initState(
          BuildContext context, TennisField field, String rainProbability) =>
      () async {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          Repository repository = Repository(localData: LocalData(), api: Api());
          BaseForecast forecast =
              await repository.getForecastOfDayWithDateTime(getNextClosestDay(
            DateTime.now(),
            field.availableDates,
          ));

          rainProbability =
              "${forecast.forecast!.forecastday?[0].day!.dailyChanceOfRain}";
          rainProbability = rainProbability.replaceAll(".0", "%");

          // ignore: use_build_context_synchronously
          context.read<ReserveFieldCardCubit>().refresh();
        });
      };

  Future<void> Function() goReserve(
          String tag, BuildContext context, TennisField field) =>
      () async {
        stamp(tag, "Button Pressed: \"goReserve\"",
            decoratorChar: " * ", extraLine: true);

        context.read<CustomDropdownDataCubit>().reset();

        ReserveFullPageViewCubit cubit =
            context.read<ReserveFullPageViewCubit>();

        cubit.reset();
        cubit.setFieldSelected(field);

        viewManager.push(context, ReserveFullPageView.routeName);
      };
}
