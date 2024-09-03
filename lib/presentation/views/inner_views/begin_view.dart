import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennis_field_scheduler_v2/app/static_data/static_data.dart';

import '../../../app/lang/ui_texts.dart';
import '../../../app/theme/ui_colors.dart';
import '../../../app/theme/ui_text_styles.dart';
import '../../../domain/entities/scheduled_field.dart';
import '../../../domain/use_cases/inner_views/begin_view/begin_view_use_cases.dart';
import '../../common_widgets/backgrounds/base_background.dart';
import '../../common_widgets/behaviors/dismissable_wrapper.dart';
import '../../common_widgets/cards/reserve_field_card.dart';
import '../../common_widgets/cards/reserved_field_card.dart';
import '../../common_widgets/other_widgets/lower_margin.dart';
import '../../common_widgets/other_widgets/no_schedule_text.dart';
import '../../common_widgets/other_widgets/upper_margin.dart';
import '../../common_widgets/separator/custom_separator.dart';

class BeginView extends StatefulWidget {
  const BeginView({super.key});

  static const routeName = '/BeginView';

  @override
  State<BeginView> createState() => _BeginViewState();
}

class _BeginViewState extends State<BeginView> {
  String tag = BeginView.routeName.substring(1, BeginView.routeName.length);
  BeginViewUseCases beginViewUseCases = BeginViewUseCases();

  @override
  void initState() {
    super.initState();
    beginViewUseCases.initState(context)();
  }

  @override
  Widget build(BuildContext context) {
    UiTexts uiTexts = Provider.of<UiTexts>(context);
    Size screenSize = MediaQuery.of(context).size;

    return BaseBackground(
      backActions: beginViewUseCases.backActions(tag, context),
      hasAppBar: true,
      hasMenu: true,
      content: buildContent(
        screenSize,
        uiTexts,
      ),
    );
  }

  Widget buildContent(Size screenSize, UiTexts uiTexts) {
    double leftMargin = 23;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const UpperMargin(),
        const SizedBox(height: 12),
        Container(
          margin: EdgeInsets.only(left: leftMargin),
          child: Text(
            "${uiTexts.hello} ${currentUser.name}!",
            style: styleSemiBold(20, cBlack),
          ),
        ),
        const SizedBox(height: 10),
        const CustomSeparator(),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: [
              const SizedBox(height: 21),
              Container(
                margin: EdgeInsets.only(left: leftMargin),
                child: Text(
                  uiTexts.fields,
                  style: styleMedium(18, cBlack),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 362,
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  children: [
                    const SizedBox(width: 23),
                    ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return ReserveFieldCard(
                          field: fields[index],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(width: 20);
                      },
                      itemCount: fields.length,
                    ),
                    const SizedBox(width: 23),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const CustomSeparator(),
              const SizedBox(height: 19),
              Container(
                margin: EdgeInsets.only(left: leftMargin),
                child: Text(
                  uiTexts.scheduledReserves,
                  style: styleMedium(18, cBlack),
                ),
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
                        widgetToWrap: ReservedFieldCard(
                          scheduledField: list[index],
                        ),
                        actionToDo: (direction) {
                          beginViewUseCases.deleteSchedule(tag, index);
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
    );
  }
}
