import 'package:equatable/equatable.dart';

class VersionModel extends Equatable {
  late String version;
  late int id;

  VersionModel({
    required this.id,
    required this.version,
  });

  @override
  List<Object?> get props => [id, version];

  static List<VersionModel> versions = [
    VersionModel(
      id: 1,
      version: 'iPhone 14',
    ),
    VersionModel(
      id: 2,
      version: 'iPhone 14 Pro',
    ),
    VersionModel(
      id: 3,
      version: 'iPhone 14 Pro Max',
    ),
  ];
}
