import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tennis_field_scheduler_v2/domain/entities/field_schedule.dart';
import 'package:tennis_field_scheduler_v2/presentation/common_widgets/custom_dropdown/custom_dropdown.dart';
import 'package:tennis_field_scheduler_v2/presentation/common_widgets/other_widgets/lower_margin.dart';

import '../../../app/lang/ui_texts.dart';
import '../../../app/theme/ui_colors.dart';
import '../../../app/theme/ui_text_styles.dart';
import '../../../domain/use_cases/full_page_view/reserve_full_page_use_cases.dart';
import '../../../utils/turn_timestamp_into_us_date.dart';
import '../../common_widgets/backgrounds/base_background.dart';
import '../../common_widgets/custom_button/custom_button.dart';
import '../../common_widgets/custom_dropdown/custom_dropdown_with_title.dart';
import '../../common_widgets/custom_input_text/custom_clean_input_text.dart';

class ReserveFullPageView extends StatefulWidget {
  const ReserveFullPageView({super.key});

  static const routeName = '/ReserveFullPageView';

  @override
  State<ReserveFullPageView> createState() => _ReserveFullPageViewState();
}

class _ReserveFullPageViewState extends State<ReserveFullPageView> {
  String tag = ReserveFullPageView.routeName
      .substring(1, ReserveFullPageView.routeName.length);
  ReserveFullPageViewUseCases reserveFullPageViewUseCases =
      ReserveFullPageViewUseCases();

  double rainProbability = 0;
  String availableDate = "";
  bool hasAvailableHours = true;
  String availableHours = "";

  String dateOfToday = "";
  String timeToday = "00:00";

  @override
  void initState() {
    super.initState();
    reserveFullPageViewUseCases.initState(context)();

    rainProbability = .3;
    availableDate = "Next Date";
    hasAvailableHours = true;
    availableHours = "Next Hours";

    dateOfToday = turnDateTimeIntoLatinDate(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    UiTexts uiTexts = Provider.of<UiTexts>(context);
    Size screenSize = MediaQuery.of(context).size;

    return BaseBackground(
      backActions: reserveFullPageViewUseCases.backActions(context),
      hasBackButton: true,
      hasFavoriteButton: true,
      content: buildContent(
        screenSize,
        uiTexts,
      ),
    );
  }

  Widget buildContent(Size screenSize, UiTexts uiTexts) {
    double margin = 32;

    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        Image.asset(
          fieldSelected.imageCropped,
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        const SizedBox(height: 24),
        Container(
          padding: EdgeInsets.symmetric(horizontal: margin),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    fieldSelected.name,
                    style: styleSemiBold(20, cBlack),
                  ),
                  const Expanded(child: SizedBox.shrink()),
                  Text(
                    "\$${fieldSelected.price}",
                    style: styleSemiBold(20, cBlue),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    (fieldSelected.fieldType == FieldType.a)
                        ? uiTexts.fieldA
                        : (fieldSelected.fieldType == FieldType.b)
                            ? uiTexts.fieldB
                            : uiTexts.fieldC,
                    style: styleRegular(12, cBlack),
                  ),
                  const Expanded(child: SizedBox.shrink()),
                  Text(
                    uiTexts.perHour,
                    style: styleRegular(12, cGray2),
                  ),
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
                        Text(
                          availableDate,
                          style: styleRegular(12, cBlack),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
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
              const SizedBox(height: 12),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/images/location.svg",
                    fit: BoxFit.none,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    fieldSelected.address,
                    style: styleRegular(12, cBlack),
                  ),
                  const Expanded(child: SizedBox.shrink()),
                ],
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: 220,
                child: CustomDropdown(
                  index: 0,
                  list: teachers,
                  hint: uiTexts.addTeacher,
                ),
              ),
              const SizedBox(height: 22),
            ],
          ),
        ),
        Container(
          color: cBlueLight,
          padding: EdgeInsets.symmetric(horizontal: margin),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 22),
              Text(
                uiTexts.dateTime,
                style: styleMedium(18, cBlack),
              ),
              const SizedBox(height: 20),
              CustomDropdownWithTitle(
                index: 1,
                list: fieldSelected.availableHours,
                title: uiTexts.date,
                hint: dateOfToday,
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomDropdownWithTitle(
                      index: 2,
                      list: fieldSelected.availableHours,
                      title: uiTexts.initHour,
                      hint: timeToday,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomDropdownWithTitle(
                      index: 3,
                      list: fieldSelected.availableHours,
                      title: uiTexts.endHour,
                      hint: timeToday,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                uiTexts.addComment,
                style: styleMedium(18, cBlack),
              ),
              const SizedBox(height: 16),
              CustomCleanInputText(
                title: "",
                controller: TextEditingController(),
                hint: "${uiTexts.addComment}...",
                keyboard: TextInputType.text,
                textInputAction: TextInputAction.send,
                size: const Size(double.infinity, 112),
              ),
              const SizedBox(height: 40),
              CustomButton(
                context: context,
                text: uiTexts.reserve,
                backgroundColor: cGreenForeground,
                actionsToDo: reserveFullPageViewUseCases.makeReserve(context),
              ),
              const LowerMargin(),
            ],
          ),
        ),
      ],
    );
  }
}
