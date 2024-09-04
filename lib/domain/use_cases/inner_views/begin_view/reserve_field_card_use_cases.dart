import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_field_scheduler_v2/presentation/views/full_page_view/reserve_full_page_view.dart';

import '../../../../app/static_data/static_data.dart';
import '../../../../presentation/common_widgets/custom_dropdown/custom_dropdown_data_cubit.dart';
import '../../../../utils/stamp.dart';
import '../../../entities/tennis_field.dart';
import '../../full_page_view/reserve_full_page_view_cubit.dart';

class ReserveFieldCardUseCases {
  Future<void> Function() initState(BuildContext context) => () async {};

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
