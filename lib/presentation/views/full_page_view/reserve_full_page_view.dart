import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tennis_field_scheduler_v2/presentation/common_widgets/behaviors/ontap_wrapper.dart';
import 'package:tennis_field_scheduler_v2/presentation/common_widgets/custom_dropdown/custom_dropdown.dart';
import 'package:tennis_field_scheduler_v2/presentation/common_widgets/other_widgets/lower_margin.dart';

import '../../../app/lang/ui_texts.dart';
import '../../../app/static_data/static_data.dart';
import '../../../app/theme/ui_colors.dart';
import '../../../app/theme/ui_text_styles.dart';
import '../../../domain/use_cases/full_page_view/reserve_full_page_view_cubit.dart';
import '../../../domain/use_cases/full_page_view/reserve_full_page_view_use_cases.dart';
import '../../common_widgets/backgrounds/base_background.dart';
import '../../common_widgets/custom_button/custom_button.dart';
import '../../common_widgets/custom_button/custom_button_with_title.dart';
import '../../common_widgets/custom_dropdown/custom_dropdown_data_cubit.dart';
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

  List<Widget> slides = List.generate(
    fields.length,
    (index) => Image.asset(
      fields[index].imageCropped,
      width: double.infinity,
      fit: BoxFit.fitWidth,
    ),
  );

  @override
  void initState() {
    super.initState();

    reserveFullPageViewUseCases.initState(context)();
  }

  @override
  Widget build(BuildContext context) {
    UiTexts uiTexts = Provider.of<UiTexts>(context);
    Size screenSize = MediaQuery.of(context).size;

    return BaseBackground(
      backActions: reserveFullPageViewUseCases.backActions(context),
      hasBackButton: true,
      hasFavoriteButton: true,
      favoriteActions: reserveFullPageViewUseCases.toggleFavorite(
          context,
          uiTexts,
          context.read<ReserveFullPageViewCubit>().getRainProbability()),
      content: buildContent(
        screenSize,
        uiTexts,
      ),
    );
  }

  Widget buildContent(Size screenSize, UiTexts uiTexts) {
    double margin = 32;

    return BlocBuilder<ReserveFullPageViewCubit, ReserveFullPageViewData>(
      builder: (context, state) {
        int duration;

        if (customButtonWithTitleData[2].value.isEmpty) {
          duration = 0;
        } else {
          duration =
              int.parse(customButtonWithTitleData[3].value.split(":")[0]);

          if (int.parse(customButtonWithTitleData[2].value.split(":")[0]) >
              int.parse(customButtonWithTitleData[3].value.split(":")[0])) {
            duration += 24;
          }

          duration -=
              int.parse(customButtonWithTitleData[2].value.split(":")[0]);
        }

        return ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: [
            state.isPaying
                ? Image.asset(
                    state.fieldSelected.imageCropped,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  )
                : FlutterCarousel(
                    options: CarouselOptions(
                      height: 236,
                      initialPage: int.parse(state.fieldSelected.id),
                      viewportFraction: 1.0,
                      slideIndicator: CircularWaveSlideIndicator(),
                      floatingIndicator: true,
                      enableInfiniteScroll: true,
                      onPageChanged: (value, _) {
                        reserveFullPageViewUseCases.changeField(
                            context, value)();
                      },
                    ),
                    items: slides,
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
                      Expanded(
                        child: Text(
                          state.fieldSelected.name,
                          style: styleSemiBold(20, cBlack),
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        "\$${state.fieldSelected.price}",
                        style: styleSemiBold(20, cBlue),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          (state.fieldSelected.fieldType == FieldType.a)
                              ? uiTexts.fieldA
                              : (state.fieldSelected.fieldType == FieldType.b)
                                  ? uiTexts.fieldB
                                  : uiTexts.fieldC,
                          style: styleRegular(12, cBlack),
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        uiTexts.perHour,
                        style: styleRegular(12, cGray2),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  (state.hasAvailableHours)
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
                                state.fieldSelected.availableHours.isEmpty
                                    ? state.availableHours
                                    : "${state.fieldSelected.availableHours[0]} - ${state.fieldSelected.availableHours.last}",
                                style: styleRegular(12, cBlack),
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SvgPicture.asset(
                              "assets/images/rain.svg",
                              fit: BoxFit.none,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              state.rainProbability,
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
                      Expanded(
                        child: Text(
                          state.fieldSelected.address,
                          style: styleRegular(12, cBlack),
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  state.isPaying
                      ? const SizedBox.shrink()
                      : const SizedBox(height: 24),
                  state.isPaying
                      ? const SizedBox.shrink()
                      : SizedBox(
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
            (!state.isPaying)
                ? Container(
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
                        CustomButtonWithTitle(
                          index: 1,
                          title: uiTexts.date,
                          hint: state.dateOfToday,
                          actionsToDo:
                              reserveFullPageViewUseCases.setDateTime(context),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: CustomButtonWithTitle(
                                index: 2,
                                title: uiTexts.initHour,
                                hint: state.timeToday,
                                actionsToDo: reserveFullPageViewUseCases
                                    .setDateTime(context),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: CustomButtonWithTitle(
                                index: 3,
                                title: uiTexts.endHour,
                                hint: state.timeToday,
                                actionsToDo: reserveFullPageViewUseCases
                                    .setDateTime(context),
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
                          actionsToDo:
                              reserveFullPageViewUseCases.makeReserve(context, uiTexts),
                        ),
                        const LowerMargin(hasKeyboard: true),
                      ],
                    ),
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: double.infinity,
                        color: cBlueLight,
                        padding: EdgeInsets.symmetric(horizontal: margin),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 22),
                            Text(
                              uiTexts.summarize,
                              style: styleMedium(18, cBlack),
                            ),
                            const SizedBox(height: 12),
                            SizedBox(
                              height: 17,
                              child: Row(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/images/sports_tennis.svg",
                                        height: 17,
                                        colorFilter: const ColorFilter.mode(
                                          cBlack,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        (state.fieldSelected.fieldType ==
                                                FieldType.a)
                                            ? uiTexts.fieldA
                                            : (state.fieldSelected.fieldType ==
                                                    FieldType.b)
                                                ? uiTexts.fieldB
                                                : uiTexts.fieldC,
                                        style: styleRegular(12, cBlack),
                                      ),
                                    ],
                                  ),
                                  const Expanded(
                                    child: SizedBox.shrink(),
                                  ),
                                  customButtonWithTitleData[1].value.isNotEmpty
                                      ? SizedBox(
                                          width: 120,
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                "assets/images/date.svg",
                                                height: 17,
                                                colorFilter:
                                                    const ColorFilter.mode(
                                                  cBlack,
                                                  BlendMode.srcIn,
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                customButtonWithTitleData[1]
                                                    .value,
                                                style: styleRegular(12, cBlack),
                                              ),
                                            ],
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            SizedBox(
                              height: 17,
                              child: Row(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      (context
                                                  .read<
                                                      CustomDropdownDataCubit>()
                                                  .getData(0) <
                                              0)
                                          ? const SizedBox.shrink()
                                          : Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SvgPicture.asset(
                                                  "assets/images/person.svg",
                                                  height: 17,
                                                  colorFilter:
                                                      const ColorFilter.mode(
                                                    cBlack,
                                                    BlendMode.srcIn,
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                Text(
                                                  "${uiTexts.teacher}: ${teachers[context.read<CustomDropdownDataCubit>().getData(0)]}",
                                                  style:
                                                      styleRegular(12, cBlack),
                                                ),
                                              ],
                                            ),
                                    ],
                                  ),
                                  const Expanded(
                                    child: SizedBox.shrink(),
                                  ),
                                  customButtonWithTitleData[2].value.isNotEmpty
                                      ? SizedBox(
                                          width: 120,
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                "assets/images/time.svg",
                                                height: 17,
                                                colorFilter:
                                                    const ColorFilter.mode(
                                                  cBlack,
                                                  BlendMode.srcIn,
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                "$duration ${uiTexts.hours}",
                                                style: styleRegular(12, cBlack),
                                              ),
                                            ],
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: margin),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 27),
                            Row(
                              children: [
                                Text(
                                  uiTexts.totalToPay,
                                  style: styleSemiBold(20, cBlack),
                                ),
                                const Expanded(child: SizedBox.shrink()),
                                Text(
                                  "\$${state.fieldSelected.price * duration}",
                                  style: styleSemiBold(20, cBlue),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Expanded(child: SizedBox.shrink()),
                                Text(
                                  "${uiTexts.per} $duration ${uiTexts.hours}",
                                  style: styleRegular(12, cGray2),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            OnTapWrapper(
                              widgetToWrap: SvgPicture.asset(
                                "assets/images/reschedule.svg",
                              ),
                              actionsToDo: reserveFullPageViewUseCases
                                  .returnScheduling(context),
                            ),
                            const SizedBox(height: 40),
                            CustomButton(
                              context: context,
                              text: uiTexts.pay,
                              backgroundColor: cGreenForeground,
                              actionsToDo:
                                  reserveFullPageViewUseCases.makePayment(
                                      context, uiTexts, state.rainProbability),
                            ),
                            const SizedBox(height: 20),
                            CustomButton(
                              context: context,
                              text: uiTexts.cancel,
                              textColor: cBlack,
                              decoration: BoxDecoration(
                                color: cWhite,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: cBlack),
                              ),
                              actionsToDo: reserveFullPageViewUseCases
                                  .backActions(context),
                            ),
                            const SizedBox(height: 86),
                          ],
                        ),
                      ),
                    ],
                  ),
          ],
        );
      },
    );
  }
}
