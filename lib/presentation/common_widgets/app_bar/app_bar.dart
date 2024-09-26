import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tennis_field_scheduler_v2/app/static_data/static_data.dart';
import 'package:tennis_field_scheduler_v2/presentation/common_widgets/behaviors/ontap_wrapper.dart';
import 'package:tennis_field_scheduler_v2/presentation/views/inner_views/begin_view.dart';

import '../../../app/lang/ui_texts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.safeAreaTop,
    required this.appBarHeight,
    required this.uiTexts,
  });

  final double safeAreaTop;
  final double appBarHeight;
  final UiTexts uiTexts;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF051F44),
            Color(0xFF82BC00),
          ],
          stops: [0.0, 1.0],
          transform: GradientRotation(150),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: safeAreaTop),
          SizedBox(
            height: appBarHeight,
            child: Row(
              children: [
                const SizedBox(width: 20),
                Image.asset(
                  "assets/images/app_logo.png",
                  height: 26,
                  fit: BoxFit.fitHeight,
                ),
                const Expanded(child: SizedBox.shrink()),
                OnTapWrapper(
                  widgetToWrap: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/avatar.png",
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 10),
                      SvgPicture.asset(
                        "assets/images/notifications.svg",
                      ),
                      const SizedBox(width: 6),
                      SvgPicture.asset(
                        "assets/images/menu.svg",
                      ),
                      const SizedBox(width: 20),
                    ],
                  ),
                  actionsToDo: () {
                    if (viewManager.getCurrent() != BeginView.routeName) {
                      viewManager.goToControlPointAndStay(context);
                    }

                    viewManager.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
