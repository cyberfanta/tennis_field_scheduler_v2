import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tennis_field_scheduler_v2/presentation/common_widgets/cards/reserved_field_card_2.dart';
import 'package:tennis_field_scheduler_v2/presentation/common_widgets/custom_button/custom_button.dart';

import '../../../app/lang/ui_texts.dart';
import '../../../app/static_data/static_data.dart';
import '../../../app/theme/ui_colors.dart';
import '../../../app/theme/ui_text_styles.dart';
import '../../../domain/entities/scheduled_field.dart';
import '../../../domain/use_cases/inner_views/reservations_view_use_cases.dart';
import '../../common_widgets/backgrounds/base_background.dart';
import '../../common_widgets/behaviors/dismissable_wrapper.dart';
import '../../common_widgets/other_widgets/lower_margin.dart';
import '../../common_widgets/other_widgets/no_schedule_text.dart';
import '../../common_widgets/other_widgets/upper_margin.dart';

class ReservationsView extends StatefulWidget {
  const ReservationsView({super.key});

  static const routeName = '/ReservationsView';

  @override
  State<ReservationsView> createState() => _ReservationsViewState();
}

class _ReservationsViewState extends State<ReservationsView> {
  String tag = ReservationsView.routeName
      .substring(1, ReservationsView.routeName.length);
  ReservationsViewUseCases reservationsViewUseCases =
      ReservationsViewUseCases();

  @override
  void initState() {
    super.initState();
    reservationsViewUseCases.initState(context)();
  }

  @override
  Widget build(BuildContext context) {
    UiTexts uiTexts = Provider.of<UiTexts>(context);
    Size screenSize = MediaQuery.of(context).size;

    return BaseBackground(
      backActions: reservationsViewUseCases.backActions(tag, context),
      hasAppBar: true,
      hasMenu: true,
      content: buildContent(
        screenSize,
        uiTexts,
      ),
    );
  }

  Widget buildContent(Size screenSize, UiTexts uiTexts) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UpperMargin(),
          const SizedBox(height: 41),
          CustomButton(
            context: context,
            text: uiTexts.scheduleReserve,
            textStyle: styleSemiBold(18, cWhite),
            backgroundColor: cGreenForeground,
            imageIcon: SvgPicture.asset(
              "assets/images/date.svg",
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(
                cWhite,
                BlendMode.srcIn,
              ),
            ),
            actionsToDo: reservationsViewUseCases.goReserve(tag, context),
          ),
          const SizedBox(height: 11),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: [
                const SizedBox(height: 21),
                Text(
                  uiTexts.myReserves,
                  style: styleMedium(18, cBlack),
                ),
                const SizedBox(height: 16),
                ValueListenableBuilder(
                  valueListenable: scheduleList,
                  builder: (context, list, _) {
                    if (list.isEmpty) {
                      return const NoScheduleText();
                    }

                    return ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        ScheduledField item = list[index];

                        return DismissibleWrapper(
                          id: item.id,
                          widgetToWrap: ReservedFieldCard2(
                            scheduledField: list[index],
                          ),
                          actionToDo: (direction) {
                            reservationsViewUseCases.deleteSchedule(
                                tag, index)();
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 8);
                      },
                      itemCount: list.length,
                    );
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          const LowerMargin(),
        ],
      ),
    );
  }
}
