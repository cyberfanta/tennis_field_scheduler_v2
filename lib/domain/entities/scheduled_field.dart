import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

ValueNotifier<List<ScheduledField>> scheduleList = ValueNotifier([]);

const List<ScheduledField> defaultScheduled = [
  ScheduledField("0", 0, "06/07/2024", "5pm", 2, "Julio leon", 0, .3),
  ScheduledField("1", 1, "06/07/2024", "3pm", 1, "Julio leon", 1, .6),
  ScheduledField("2", 2, "06/07/2024", "4pm", 3, "Julio leon", 2, .1),
];

class ScheduledField extends Equatable {
  final String id;
  final int fieldIndex;
  final String date;
  final String time;
  final int duration;
  final String owner;
  final int teacher;
  final double rainChance;

  const ScheduledField(
    this.id,
    this.fieldIndex,
    this.date,
    this.time,
    this.duration,
    this.owner,
    this.teacher,
    this.rainChance,
  );

  @override
  List<Object?> get props =>
      [id, fieldIndex, date, time, duration, owner, teacher, rainChance];
}
