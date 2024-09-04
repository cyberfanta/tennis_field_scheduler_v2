import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

import '../../../app/static_data/static_data.dart';
import '../../../app/theme/ui_colors.dart';
import '../../../data/repository.dart';
import '../../../presentation/common_widgets/custom_button/custom_button_with_title.dart';
import '../../../presentation/common_widgets/dialog/wrong_dates_dialog.dart';
import '../../../presentation/common_widgets/other_widgets/date_picker_title.dart';
import '../../../utils/turn_timestamp_into_dates.dart';
import '../../entities/base_forecast.dart';
import '../../entities/field_schedule.dart';

class ReserveFullPageViewData {
  final TennisField fieldSelected;

  final bool isGettingRainChance;
  final String rainProbability;
  final int selectedTeacher;

  final DateTime today;
  final String dateOfToday;
  final String timeToday;

  final bool hasAvailableHours;
  final String availableDate;
  final String availableHours;

  final String comments;

  final bool isPaying;

  ReserveFullPageViewData({
    required this.fieldSelected,
    required this.isGettingRainChance,
    required this.rainProbability,
    required this.selectedTeacher,
    required this.today,
    required this.dateOfToday,
    required this.timeToday,
    required this.hasAvailableHours,
    required this.availableDate,
    required this.availableHours,
    required this.comments,
    required this.isPaying,
  });

  @override
  String toString() {
    return "ReserveFullPageViewData ("
        "fieldSelected: $fieldSelected,"
        " isGettingRainChance: $isGettingRainChance,"
        " rainProbability: \"$rainProbability\","
        " selectedTeacher: $selectedTeacher,"
        " today: $today,"
        " dateOfToday: $dateOfToday,"
        " timeToday: $timeToday,"
        " hasAvailableHours: $hasAvailableHours,"
        " availableDate: \"$availableDate\","
        " availableHours: \"$availableHours\","
        " comments: \"$comments\","
        " isPaying: $isPaying"
        ")";
  }
}

ReserveFullPageViewData _default = ReserveFullPageViewData(
  fieldSelected: fields[0],
  isGettingRainChance: false,
  rainProbability: "",
  selectedTeacher: -1,
  today: DateTime.now(),
  dateOfToday: "09/07/2024",
  timeToday: "00:00",
  hasAvailableHours: true,
  availableDate: "",
  availableHours: "",
  comments: "",
  isPaying: false,
);

class ReserveFullPageViewCubit extends Cubit<ReserveFullPageViewData> {
  ReserveFullPageViewCubit() : super(_default);

  void setPaying() {
    emit(ReserveFullPageViewData(
      fieldSelected: state.fieldSelected,
      isGettingRainChance: state.isGettingRainChance,
      rainProbability: state.rainProbability,
      selectedTeacher: state.selectedTeacher,
      today: state.today,
      dateOfToday: state.dateOfToday,
      timeToday: state.timeToday,
      hasAvailableHours: state.hasAvailableHours,
      availableDate: state.availableDate,
      availableHours: state.availableHours,
      comments: state.comments,
      isPaying: true,
    ));
  }

  void setScheduling() {
    emit(ReserveFullPageViewData(
      fieldSelected: state.fieldSelected,
      isGettingRainChance: state.isGettingRainChance,
      rainProbability: state.rainProbability,
      selectedTeacher: state.selectedTeacher,
      today: state.today,
      dateOfToday: state.dateOfToday,
      timeToday: state.timeToday,
      hasAvailableHours: state.hasAvailableHours,
      availableDate: state.availableDate,
      availableHours: state.availableHours,
      comments: state.comments,
      isPaying: false,
    ));
  }

  void setFieldSelected(int index) {
    emit(ReserveFullPageViewData(
      fieldSelected: fields[index],
      isGettingRainChance: state.isGettingRainChance,
      rainProbability: state.rainProbability,
      selectedTeacher: state.selectedTeacher,
      today: state.today,
      dateOfToday: state.dateOfToday,
      timeToday: state.timeToday,
      hasAvailableHours: state.hasAvailableHours,
      availableDate: state.availableDate,
      availableHours: state.availableHours,
      comments: state.comments,
      isPaying: state.isPaying,
    ));
  }

  TennisField getFieldSelected() {
    return state.fieldSelected;
  }

  String getRainProbability() {
    return state.rainProbability;
  }

  void setSelectedTeacher(int value) {
    emit(ReserveFullPageViewData(
      fieldSelected: state.fieldSelected,
      isGettingRainChance: state.isGettingRainChance,
      rainProbability: state.rainProbability,
      selectedTeacher: value,
      today: state.today,
      dateOfToday: state.dateOfToday,
      timeToday: state.timeToday,
      hasAvailableHours: state.hasAvailableHours,
      availableDate: state.availableDate,
      availableHours: state.availableHours,
      comments: state.comments,
      isPaying: state.isPaying,
    ));
  }

  void setToday(DateTime value) {
    emit(ReserveFullPageViewData(
      fieldSelected: state.fieldSelected,
      isGettingRainChance: state.isGettingRainChance,
      rainProbability: state.rainProbability,
      selectedTeacher: state.selectedTeacher,
      today: value,
      dateOfToday: state.dateOfToday,
      timeToday: state.timeToday,
      hasAvailableHours: state.hasAvailableHours,
      availableDate: state.availableDate,
      availableHours: state.availableHours,
      comments: state.comments,
      isPaying: state.isPaying,
    ));
  }

  void setDateOfToday(String value) {
    emit(ReserveFullPageViewData(
      fieldSelected: state.fieldSelected,
      isGettingRainChance: state.isGettingRainChance,
      rainProbability: state.rainProbability,
      selectedTeacher: state.selectedTeacher,
      today: state.today,
      dateOfToday: value,
      timeToday: state.timeToday,
      hasAvailableHours: state.hasAvailableHours,
      availableDate: state.availableDate,
      availableHours: state.availableHours,
      comments: state.comments,
      isPaying: state.isPaying,
    ));
  }

  void setTimeToday(String value) {
    emit(ReserveFullPageViewData(
      fieldSelected: state.fieldSelected,
      isGettingRainChance: state.isGettingRainChance,
      rainProbability: state.rainProbability,
      selectedTeacher: state.selectedTeacher,
      today: state.today,
      dateOfToday: state.dateOfToday,
      timeToday: value,
      hasAvailableHours: state.hasAvailableHours,
      availableDate: state.availableDate,
      availableHours: state.availableHours,
      comments: state.comments,
      isPaying: state.isPaying,
    ));
  }

  Future<void> setSchedule(BuildContext context) async {
    List<DateTime>? datePicked = await _getDateTimeFromPicker(context);

    if (datePicked == null || datePicked.isEmpty) {
      return;
    }

    if (datePicked[0] == datePicked[1]) {
      datePicked[1] = datePicked[1].add(const Duration(hours: 1));
    }

    customButtonWithTitleData[1].value =
        turnDateTimeIntoLatinDate(datePicked[0]);
    customButtonWithTitleData[2].value = "${datePicked[0].hour}:00";
    customButtonWithTitleData[3].value = "${datePicked[1].hour}:00";

    await getForecast(datePicked[0]);
  }

  Future<void> getForecast(DateTime date) async {
    Repository repository = Repository();
    BaseForecast forecast = await repository.getForecastOfDayWithDateTime(date);

    String rainProbability =
        "${forecast.forecast!.forecastday?[0].day!.dailyChanceOfRain}";
    rainProbability = rainProbability.replaceAll(".0", "%");

    emit(ReserveFullPageViewData(
      fieldSelected: state.fieldSelected,
      isGettingRainChance: state.isGettingRainChance,
      rainProbability: rainProbability,
      selectedTeacher: state.selectedTeacher,
      today: state.today,
      dateOfToday: state.dateOfToday,
      timeToday: state.timeToday,
      hasAvailableHours: state.hasAvailableHours,
      availableDate: state.availableDate,
      availableHours: state.availableHours,
      comments: state.comments,
      isPaying: state.isPaying,
    ));
  }

  Future<List<DateTime>?> _getDateTimeFromPicker(BuildContext context) async {
    DateTime todayHourZero =
        DateTime(state.today.year, state.today.month, state.today.day);
    DateTime twoWeeksLater = state.today.add(const Duration(days: 14));
    DateTime twoWeeksLaterMinusHour =
        twoWeeksLater.subtract(const Duration(hours: 1));

    List<DateTime>? datePicked = await showOmniDateTimeRangePicker(
      context: context,
      title: const DatePickerTitle(),
      titleSeparator: Container(
        width: 160,
        height: 1,
        color: cGray2,
        margin: const EdgeInsets.symmetric(vertical: 4),
      ),
      startInitialDate:
          _getNextDay(state.today, state.fieldSelected.availableDates),
      endInitialDate:
          _getNextDay(state.today, state.fieldSelected.availableDates),
      startFirstDate: todayHourZero,
      endFirstDate: todayHourZero,
      startLastDate: twoWeeksLaterMinusHour,
      endLastDate: twoWeeksLater,
      isForceEndDateAfterStartDate: true,
      minutesInterval: 60,
      onStartDateAfterEndDateError: () {
        showDialog(
          context: context,
          barrierColor: cBlackOpacity50,
          useSafeArea: false,
          builder: (BuildContext context) {
            return const WrongDatesDialog();
          },
        );
      },
      borderRadius: BorderRadius.circular(4),
      startSelectableDayPredicate: _allowedDates,
      endSelectableDayPredicate: _allowedDates,
    );

    return datePicked;
  }

  DateTime _getNextDay(DateTime dateTime, List<FieldDays> daysList) {
    final currentDay = dateTime.weekday;
    final targetDay = daysList[0].index + 1;

    int daysToAdd = targetDay - currentDay;
    if (daysToAdd <= 0) {
      daysToAdd += 7;
    }

    return dateTime.add(Duration(days: daysToAdd));
  }

  bool _allowedDates(dateTime) {
    if (dateTime.weekday == 1 &&
        state.fieldSelected.availableDates
                .indexWhere((element) => element == FieldDays.monday) >
            -1) {
      return true;
    }

    if (dateTime.weekday == 2 &&
        state.fieldSelected.availableDates
                .indexWhere((element) => element == FieldDays.tuesday) >
            -1) {
      return true;
    }

    if (dateTime.weekday == 3 &&
        state.fieldSelected.availableDates
                .indexWhere((element) => element == FieldDays.wednesday) >
            -1) {
      return true;
    }

    if (dateTime.weekday == 4 &&
        state.fieldSelected.availableDates
                .indexWhere((element) => element == FieldDays.thursday) >
            -1) {
      return true;
    }

    if (dateTime.weekday == 5 &&
        state.fieldSelected.availableDates
                .indexWhere((element) => element == FieldDays.friday) >
            -1) {
      return true;
    }

    if (dateTime.weekday == 6 &&
        state.fieldSelected.availableDates
                .indexWhere((element) => element == FieldDays.saturday) >
            -1) {
      return true;
    }

    if (dateTime.weekday == 7 &&
        state.fieldSelected.availableDates
                .indexWhere((element) => element == FieldDays.sunday) >
            -1) {
      return true;
    }

    return false;
  }

  void reset() {
    emit(_default);

    customButtonWithTitleData[1].value = "";
    customButtonWithTitleData[2].value = "";
    customButtonWithTitleData[3].value = "";
  }
}
