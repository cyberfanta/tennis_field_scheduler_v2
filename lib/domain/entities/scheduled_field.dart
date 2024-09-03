import 'package:equatable/equatable.dart';

class ScheduledField extends Equatable {
  final String id;
  final int fieldIndex;
  final String date;
  final String time;
  final int duration;
  final String owner;
  final int teacher;
  final double rainChance;
  final bool isFavorite;

  const ScheduledField(
    this.id,
    this.fieldIndex,
    this.date,
    this.time,
    this.duration,
    this.owner,
    this.teacher,
    this.rainChance,
    this.isFavorite,
  );

  @override
  List<Object?> get props =>
      [id, fieldIndex, date, time, duration, owner, teacher, rainChance, isFavorite];
}
