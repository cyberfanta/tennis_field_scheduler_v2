import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_field_scheduler_v2/presentation/views/full_page_view/reserve_full_page_view.dart';

import '../../../../app/static_data/static_data.dart';
import '../../../../utils/stamp.dart';
import '../../../entities/field_schedule.dart';
import '../../full_page_view/reserve_full_page_view_cubit.dart';

class ReserveFieldCardUseCases {
  Future<void> Function() initState(BuildContext context) => () async {};

  Future<void> Function() goReserve(
          String tag, BuildContext context, TennisField field) =>
      () async {
        stamp(tag, "Button Pressed: \"goReserve\"",
            decoratorChar: " * ", extraLine: true);

        context.read<ReserveFullPageViewCubit>().setFieldSelected(
            fields.indexWhere((element) => element.name == field.name));

        viewManager.push(context, ReserveFullPageView.routeName);
      };
}
