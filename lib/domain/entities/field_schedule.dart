import 'package:equatable/equatable.dart';

enum FieldType { a, b, c }

final List<FieldSchedule> fields = [
  const FieldSchedule(
    "Epic Box",
    FieldType.a,
    "assets/images/field_1.png",
    "assets/images/small_field_1.png",
    ['8am', '9am', '10am', '11am', '12pm', '1pm', '2pm', '3pm', '4pm'],
  ),
  const FieldSchedule(
    "Rusty Tennis",
    FieldType.b,
    "assets/images/field_2.png",
    "assets/images/small_field_2.png",
    ['10am', '11am', '12pm', '1pm', '2pm'],
  ),
  const FieldSchedule(
    "Sport Box",
    FieldType.c,
    "assets/images/field_3.png",
    "assets/images/small_field_3.png",
    ['9am', '10am'],
  ),
];

class FieldSchedule extends Equatable {
  final String name;
  final FieldType fieldType;
  final String image;
  final String smallImage;
  final List<String> availableHours;

  const FieldSchedule(
    this.name,
    this.fieldType,
    this.image,
    this.smallImage,
    this.availableHours,
  );

  @override
  List<Object?> get props =>
      [name, fieldType, image, smallImage, availableHours];
}
