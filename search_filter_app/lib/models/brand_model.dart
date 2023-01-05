import 'package:equatable/equatable.dart';

class BrandModel extends Equatable {
  late String brand;
  late int id;

  BrandModel({
    required this.id,
    required this.brand,
  });

  @override
  List<Object?> get props => [id, brand];

  static List<BrandModel> brands = [
    BrandModel(
      id: 1,
      brand: 'Case-Mate',
    ),
    BrandModel(
      id: 2,
      brand: 'Coach',
    ),
    BrandModel(
      id: 3,
      brand: 'UAG',
    ),
  ];
}
