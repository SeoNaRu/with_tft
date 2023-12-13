// readonly name: string;

//   readonly tier: string;

import 'package:equatable/equatable.dart';

class ChampionModel extends Equatable {
  final String id;
  final String name;
  final String image;

  final int tier;

  static const empty = ChampionModel(
    id: '',
    name: '',
    image: '',
    tier: 0,
  );

  const ChampionModel({
    required this.id,
    required this.name,
    required this.image,
    required this.tier,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        tier,
      ];

  @override
  String toString() {
    return 'ChampionModel{name: $name, tier:$tier,  id:$id image:$image}';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'tier': tier,
    };
  }

  factory ChampionModel.fromMap(Map<String, dynamic> map) {
    return ChampionModel(
      id: map['id'] ?? "",
      name: map['name'] ?? "",
      image: map['image'] ?? "",
      tier: map['tier'] ?? 0,
    );
  }

  ChampionModel copyWith({
    String? id,
    String? name,
    String? image,
    int? tier,
  }) {
    return ChampionModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      tier: tier ?? this.tier,
    );
  }
}
