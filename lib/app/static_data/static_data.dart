import 'package:flutter/material.dart';
import 'package:tennis_field_scheduler_v2/domain/entities/base_user.dart';

import '../../domain/entities/field_schedule.dart';
import '../../domain/entities/scheduled_field.dart';
import '../../utils/view_manager.dart';

ViewManager viewManager = ViewManager();

late BaseUser currentUser;

List<String> teachers = ["Mark Gonzales", "Julio León", "Solange García"];

enum FieldType { a, b, c }

enum FieldDays {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

final List<TennisField> fields = [
  const TennisField(
    "Epic Box",
    FieldType.a,
    "assets/images/field_1.png",
    "assets/images/field_1_cropped.png",
    "assets/images/small_field_1.png",
    25,
    "Vía Av. Caracas y Av. P.º Caroni",
    [FieldDays.monday, FieldDays.tuesday],
    ['8am', '9am', '10am', '11am', '12pm', '1pm', '2pm', '3pm', '4pm'],
  ),
  const TennisField(
    "Rusty Tennis",
    FieldType.b,
    "assets/images/field_2.png",
    "assets/images/field_2_cropped.png",
    "assets/images/small_field_2.png",
    30,
    "Av. Páez, El Paraiso",
    [FieldDays.wednesday, FieldDays.thursday],
    ['10am', '11am', '12pm', '1pm', '2pm'],
  ),
  const TennisField(
    "Sport Box",
    FieldType.c,
    "assets/images/field_3.png",
    "assets/images/field_3_cropped.png",
    "assets/images/small_field_3.png",
    45,
    "Country Club",
    [FieldDays.friday, FieldDays.saturday],
    ['9am', '10am'],
  ),
];

ValueNotifier<List<ScheduledField>> scheduleList = ValueNotifier([]);
ValueNotifier<List<ScheduledField>> favoriteList = ValueNotifier([]);

const List<ScheduledField> defaultScheduled = [
  ScheduledField("0", 0, "06/07/2024", "5pm", 2, "Julio leon", 0, .3, true),
  ScheduledField("1", 1, "06/07/2024", "3pm", 1, "Julio leon", 1, .6, true),
  ScheduledField("2", 2, "06/07/2024", "4pm", 3, "Julio leon", 2, .1, false),
];

