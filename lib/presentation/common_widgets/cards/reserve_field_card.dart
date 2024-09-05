import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tennis_field_scheduler_v2/app/theme/ui_colors.dart';
import 'package:tennis_field_scheduler_v2/data/repository.dart';
import 'package:tennis_field_scheduler_v2/presentation/common_widgets/custom_button/custom_button.dart';

import '../../../app/lang/ui_texts.dart';
import '../../../app/static_data/static_data.dart';
import '../../../app/theme/ui_text_styles.dart';
import '../../../domain/entities/base_forecast.dart';
import '../../../domain/entities/tennis_field.dart';
import '../../../domain/use_cases/inner_views/begin_view/reserve_field_card_use_cases.dart';
import '../../../utils/get_next_available_day.dart';
import '../../views/full_page_view/reserve_full_page_view.dart';

class ReserveFieldCard extends StatefulWidget {
  const ReserveFieldCard({
    super.key,
    required this.field,
  });

  final TennisField field;

  @override
  State<ReserveFieldCard> createState() => _ReserveFieldCardState();
}

class _ReserveFieldCardState extends State<ReserveFieldCard> {
  ReserveFieldCardUseCases reserveFieldCardUseCases =
      ReserveFieldCardUseCases();

  String rainProbability = "";
  String availableDate = "Next Date";
  bool hasAvailableHours = true;
  String availableHours = "Next Hours";

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Repository repository = Repository();
      BaseForecast forecast =
          await repository.getForecastOfDayWithDateTime(getNextClosestDay(
        DateTime.now(),
        widget.field.availableDates,
      ));

      rainProbability =
          "${forecast.forecast!.forecastday?[0].day!.dailyChanceOfRain}";
      rainProbability = rainProbability.replaceAll(".0", "%");

      setState(() {});
    });
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
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            widget.field.image,
            width: double.infinity,
          ),
          const SizedBox(height: 12),
          Container(
            margin: EdgeInsets.symmetric(horizontal: margin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.field.name,
                        style: styleMedium(18, cBlack),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/images/rain.svg",
                      fit: BoxFit.none,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      rainProbability,
                      style: styleRegular(12, cBlack),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  (widget.field.fieldType == FieldType.a)
                      ? uiTexts.fieldA
                      : (widget.field.fieldType == FieldType.b)
                          ? uiTexts.fieldB
                          : uiTexts.fieldC,
                  style: styleRegular(12, cBlack),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/images/date.svg",
                      fit: BoxFit.none,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      buildAvailableDates(
                          availableDate, widget.field.availableDates),
                      style: styleRegular(12, cBlack),
                    ),
                    const Expanded(child: SizedBox.shrink()),
                  ],
                ),
                const SizedBox(height: 12),
                hasAvailableHours
                    ? Row(
                        children: [
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
                              widget.field.availableHours.isEmpty
                                  ? availableHours
                                  : "${widget.field.availableHours[0]} - ${widget.field.availableHours.last}",
                              style: styleRegular(12, cBlack),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      )
                    : Row(
                        children: [
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
                const SizedBox(height: 42),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 34),
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
          ),
        ],
      ),
    );
  }

  String buildAvailableDates(
      String defaultText, List<FieldDays> availableDates) {
    String answer = "";

    if (availableDates.isEmpty) {
      return defaultText;
    }

    if (availableDates.contains(FieldDays.monday)) {
      answer += "Lunes, ";
    }

    if (availableDates.contains(FieldDays.tuesday)) {
      answer += "Martes, ";
    }

    if (availableDates.contains(FieldDays.wednesday)) {
      answer += "Miercole, ";
    }

    if (availableDates.contains(FieldDays.thursday)) {
      answer += "Jueves, ";
    }

    if (availableDates.contains(FieldDays.friday)) {
      answer += "Viernes, ";
    }

    if (availableDates.contains(FieldDays.saturday)) {
      answer += "Sabado, ";
    }

    if (availableDates.contains(FieldDays.sunday)) {
      answer += "Domingo, ";
    }

    return answer.substring(0, answer.length - 2);
  }
}
