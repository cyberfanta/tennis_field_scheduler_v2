import 'package:flutter/material.dart';

import '../../../app/static_data/static_data.dart';
import '../../../presentation/views/full_page_view/reserve_full_page_view.dart';
import '../../../utils/stamp.dart';

class ReserveFullPageViewUseCases {
  final String _tag = ReserveFullPageView.routeName
      .substring(1, ReserveFullPageView.routeName.length);

  Future<void> Function() initState(BuildContext context) => () async {};

  Future<void> Function() makeReserve(BuildContext context) => () async {
        stamp(_tag, "Button Pressed: \"makeReserve\"",
            decoratorChar: " * ", extraLine: true);
      };

  Future<void> Function() makePayment(BuildContext context) => () async {
        stamp(_tag, "Button Pressed: \"makePayment\"",
            decoratorChar: " * ", extraLine: true);
      };

  Future<void> Function() backActions(BuildContext context) => () async {
        stamp(_tag, "Button Pressed: \"Back\"",
            decoratorChar: " * ", extraLine: true);

        viewManager.pop(context);
      };
}
