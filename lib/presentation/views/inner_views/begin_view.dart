import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennis_field_scheduler_v2/app/static_data/static_data.dart';

import '../../../app/lang/ui_texts.dart';
import '../../../app/theme/ui_colors.dart';
import '../../../app/theme/ui_text_styles.dart';
import '../../../domain/use_cases/inner_views/begin_view_use_cases.dart';
import '../../common_widgets/backgrounds/base_background.dart';
import '../../common_widgets/other_widgets/lower_margin.dart';
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
                height: 337,
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  children: const [
                    SizedBox(width: 23),
                    SizedBox(
                      width: 245,
                      height: double.infinity,
                      child: Placeholder(),
                    ),
                    SizedBox(width: 20),
                    SizedBox(
                      width: 245,
                      height: double.infinity,
                      child: Placeholder(),
                    ),
                    SizedBox(width: 20),
                    SizedBox(
                      width: 245,
                      height: double.infinity,
                      child: Placeholder(),
                    ),
                    SizedBox(width: 23),
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
              ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return const SizedBox(
                    width: double.infinity,
                    height: 120,
                    child: Placeholder(),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 8);
                },
                itemCount: 3,
              ),
              const SizedBox(height: 20),
              const LowerMargin(),
            ],
          ),
        ),
      ],
    );
  }
}
