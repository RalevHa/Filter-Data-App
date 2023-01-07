import 'package:equatable/equatable.dart';

class ColorModel extends Equatable {
  late String color;
  late int id;

  ColorModel({
    required this.id,
    required this.color,
  });

  @override
  List<Object?> get props => [id, color];

  static List<ColorModel> colors = [
    ColorModel(
      id: 1,
      color: 'Colorful',
    ),
    ColorModel(
      id: 2,
      color: 'White',
    ),
    ColorModel(
      id: 3,
      color: 'Black',
    ),
  ];
}
