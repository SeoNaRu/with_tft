import 'package:equatable/equatable.dart';

class Tier extends Equatable {
  final String tier;
  final String rank;

  static const empty = Tier(
    tier: 'unranked',
    rank: '',
  );

  const Tier({
    required this.tier,
    required this.rank,
  });

  @override
  List<Object?> get props => [
        tier,
        rank,
      ];

  @override
  String toString() {
    return 'Tier{tier:$tier, rank: $rank}';
  }

  Map<String, dynamic> toMap() {
    return {
      'tier': tier,
      'rank': rank,
    };
  }

  factory Tier.fromMap(Map<String, dynamic> map) {
    return Tier(
      tier: map['tier'] ?? "",
      rank: map['rank'] ?? "",
    );
  }

  Tier copyWith({
    String? tier,
    String? rank,
  }) {
    return Tier(
      tier: tier ?? this.tier,
      rank: rank ?? this.rank,
    );
  }
}
