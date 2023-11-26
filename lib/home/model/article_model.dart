// readonly nickName: string;
//   readonly lineTag: string;
//   readonly tier: string;
//   readonly gameType: string;
//   readonly vocie: string;
//   readonly personel: string;

import 'package:equatable/equatable.dart';

class ArticleModel extends Equatable {
  final String nickName;
  final String lineTag;
  final String tier;
  final String gameType;
  final String vocie;
  final String personel;

  static const empty = ArticleModel(
    nickName: '',
    lineTag: '',
    tier: '',
    gameType: '',
    vocie: '',
    personel: '',
  );

  const ArticleModel({
    required this.nickName,
    required this.lineTag,
    required this.tier,
    required this.gameType,
    required this.vocie,
    required this.personel,
  });

  @override
  List<Object?> get props => [
        nickName,
        lineTag,
        tier,
        gameType,
        vocie,
        personel,
      ];

  @override
  String toString() {
    return 'ArticleModel{nickName: $nickName, lineTag: $lineTag, tier:$tier, gameType: $gameType, vocie: $vocie, personel: $personel}';
  }

  Map<String, dynamic> toMap() {
    return {
      'nickName': nickName,
      'lineTag': lineTag,
      'tier': tier,
      'gameType': gameType,
      'vocie': vocie,
      'personel': personel,
    };
  }

  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
      nickName: map['nickName'] ?? "",
      lineTag: map['lineTag'] ?? "",
      tier: map['tier'] ?? "",
      gameType: map['gameType'] ?? "",
      vocie: map['vocie'] ?? "",
      personel: map['personel'] ?? "",
    );
  }

  ArticleModel copyWith({
    String? nickName,
    String? lineTag,
    String? tier,
    String? gameType,
    String? vocie,
    String? personel,
  }) {
    return ArticleModel(
      nickName: nickName ?? this.nickName,
      lineTag: lineTag ?? this.lineTag,
      tier: tier ?? this.tier,
      gameType: gameType ?? this.gameType,
      vocie: vocie ?? this.vocie,
      personel: personel ?? this.personel,
    );
  }
}
