import 'package:equatable/equatable.dart';

enum FieldType { a, b, c }

final List<FieldSchedule> fields = [
  const FieldSchedule(
    "Epic Box",
    FieldType.a,
    "assets/images/field_1.png",
    "assets/images/field_1_cropped.png",
    "assets/images/small_field_1.png",
    25,
    "Vía Av. Caracas y Av. P.º Caroni",
    ['8am', '9am', '10am', '11am', '12pm', '1pm', '2pm', '3pm', '4pm'],
  ),
  const FieldSchedule(
    "Rusty Tennis",
    FieldType.b,
    "assets/images/field_2.png",
    "assets/images/field_2_cropped.png",
    "assets/images/small_field_2.png",
    30,
    "Av. Páez, El Paraiso",
    ['10am', '11am', '12pm', '1pm', '2pm'],
  ),
  const FieldSchedule(
    "Sport Box",
    FieldType.c,
    "assets/images/field_3.png",
    "assets/images/field_3_cropped.png",
    "assets/images/small_field_3.png",
    45,
    "Country Club",
    ['9am', '10am'],
  ),
];

class FieldSchedule extends Equatable {
  final String name;
  final FieldType fieldType;
  final String image;
  final String imageCropped;
  final String smallImage;
  final double price;
  final String address;
  final List<String> availableHours;

  const FieldSchedule(
    this.name,
    this.fieldType,
    this.image,
    this.imageCropped,
    this.smallImage,
    this.price,
    this.address,
    this.availableHours,
  );

  @override
  List<Object?> get props =>
      [name, fieldType, image, imageCropped, smallImage, price, address, availableHours];
}
