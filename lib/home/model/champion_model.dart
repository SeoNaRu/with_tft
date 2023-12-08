// readonly name: string;

//   readonly tier: string;

import 'package:equatable/equatable.dart';

class ChampionModel extends Equatable {
  final String id;
  final String name;
  final int tier;

  static const empty = ChampionModel(
    id: '',
    name: '',
    tier: 0,
  );

  const ChampionModel({
    required this.id,
    required this.name,
    required this.tier,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        tier,
      ];

  @override
  String toString() {
    return 'ChampionModel{name: $name, tier:$tier,  id:$id}';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'tier': tier,
    };
  }

  factory ChampionModel.fromMap(Map<String, dynamic> map) {
    return ChampionModel(
      id: map['id'] ?? "",
      name: map['name'] ?? "",
      tier: map['tier'] ?? 0,
    );
  }

  ChampionModel copyWith({
    String? id,
    String? name,
    int? tier,
  }) {
    return ChampionModel(
      id: id ?? this.id,
      name: name ?? this.name,
      tier: tier ?? this.tier,
    );
  }
}
