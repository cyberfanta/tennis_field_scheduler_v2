import 'package:equatable/equatable.dart';

import '../../app/static_data/static_data.dart';

class TennisField extends Equatable {
  final String id;
  final String name;
  final FieldType fieldType;
  final String image;
  final String imageCropped;
  final String smallImage;
  final double price;
  final String address;
  final List<FieldDays> availableDates;
  final List<String> availableHours;

  const TennisField(
    this.id,
    this.name,
    this.fieldType,
    this.image,
    this.imageCropped,
    this.smallImage,
    this.price,
    this.address,
    this.availableDates,
    this.availableHours,
  );

  @override
  List<Object?> get props => [
        id,
        name,
        fieldType,
        image,
        imageCropped,
        smallImage,
        price,
        address,
        availableDates,
        availableHours,
      ];
}
