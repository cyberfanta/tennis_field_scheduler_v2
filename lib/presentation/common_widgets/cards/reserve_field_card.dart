import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tennis_field_scheduler_v2/app/theme/ui_colors.dart';
import 'package:tennis_field_scheduler_v2/presentation/common_widgets/custom_button/custom_button.dart';

import '../../../app/lang/ui_texts.dart';
import '../../../app/theme/ui_text_styles.dart';
import '../../../domain/entities/field_schedule.dart';
import '../../../domain/use_cases/inner_views/begin_view/reserve_field_card_use_cases.dart';
import '../../views/full_page_view/reserve_full_page_view.dart';

class ReserveFieldCard extends StatefulWidget {
  const ReserveFieldCard({
    super.key,
    required this.field,
  });

  final FieldSchedule field;

  @override
  State<ReserveFieldCard> createState() => _ReserveFieldCardState();
}

class _ReserveFieldCardState extends State<ReserveFieldCard> {
  ReserveFieldCardUseCases reserveFieldCardUseCases =
      ReserveFieldCardUseCases();

  double rainProbability = 0;
  String availableDate = "";
  bool hasAvailableHours = true;
  String availableHours = "";

  @override
  void initState() {
    super.initState();

    rainProbability = .3;
    availableDate = "Next Date";
    hasAvailableHours = true;
    availableHours = "Next Hours";
  }

  @override
  Widget build(BuildContext context) {
    String tag = ReserveFullPageView.routeName
        .substring(1, ReserveFullPageView.routeName.length);
    UiTexts uiTexts = Provider.of<UiTexts>(context);
    double margin = 16;

    return Container(
      width: 245,
      height: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: cCardBorder),
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            widget.field.image,
            width: double.infinity,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              SizedBox(width: margin),
              Text(
                widget.field.name,
                style: styleMedium(18, cBlack),
              ),
              const Expanded(child: SizedBox.shrink()),
              SvgPicture.asset(
                "assets/images/rain.svg",
                fit: BoxFit.none,
              ),
              const SizedBox(width: 4),
              Text(
                "${(rainProbability * 100).toInt()}%",
                style: styleRegular(12, cBlack),
              ),
              SizedBox(width: margin),
            ],
          ),
          const SizedBox(height: 4),
          Container(
            padding: EdgeInsets.only(left: margin),
            child: Text(
              (widget.field.fieldType == FieldType.a)
                  ? uiTexts.fieldA
                  : (widget.field.fieldType == FieldType.b)
                      ? uiTexts.fieldB
                      : uiTexts.fieldC,
              style: styleRegular(12, cBlack),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              SizedBox(width: margin),
              SvgPicture.asset(
                "assets/images/date.svg",
                fit: BoxFit.none,
              ),
              const SizedBox(width: 8),
              Text(
                availableDate,
                style: styleRegular(12, cBlack),
              ),
              const Expanded(child: SizedBox.shrink()),
            ],
          ),
          const SizedBox(height: 12),
          hasAvailableHours
              ? Row(
                  children: [
                    SizedBox(width: margin),
                    Text(
                      uiTexts.available,
                      style: styleRegular(12, cBlack),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: cBlue,
                        borderRadius: BorderRadius.circular(1000),
                      ),
                    ),
                    const SizedBox(width: 8),
                    SvgPicture.asset(
                      "assets/images/time.svg",
                      fit: BoxFit.none,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        availableDate,
                        style: styleRegular(12, cBlack),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: margin),
                  ],
                )
              : Row(
                  children: [
                    SizedBox(width: margin),
                    Text(
                      uiTexts.notAvailable,
                      style: styleRegular(12, cBlack),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: cRed,
                        borderRadius: BorderRadius.circular(1000),
                      ),
                    ),
                    const Expanded(child: SizedBox.shrink()),
                  ],
                ),
          const Expanded(child: SizedBox.shrink()),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: CustomButton(
              context: context,
              text: uiTexts.reserve,
              backgroundColor: cGreenForeground,
              actionsToDo: reserveFieldCardUseCases.goReserve(
                  tag, context, widget.field),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
