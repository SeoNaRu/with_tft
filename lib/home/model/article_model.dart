// readonly nickName: string;
//   readonly lineTag: string;
//   readonly tier: string;
//   readonly gameType: string;
//   readonly vocie: string;
//   readonly personel: string;

import 'package:equatable/equatable.dart';

class ArticleModel extends Equatable {
  final String puuid;
  final String nickName;
  final String lineTag;
  final String tier;
  final String gameType;
  final bool vocie;
  final String personel;

  static const empty = ArticleModel(
    puuid: '',
    nickName: '',
    lineTag: '',
    tier: '',
    gameType: '',
    vocie: false,
    personel: '',
  );

  const ArticleModel({
    required this.puuid,
    required this.nickName,
    required this.lineTag,
    required this.tier,
    required this.gameType,
    required this.vocie,
    required this.personel,
  });

  @override
  List<Object?> get props => [
        puuid,
        nickName,
        lineTag,
        tier,
        gameType,
        vocie,
        personel,
      ];

  @override
  String toString() {
    return 'ArticleModel{nickName: $nickName, lineTag: $lineTag, tier:$tier, gameType: $gameType, vocie: $vocie, personel: $personel puuid:$puuid}';
  }

  Map<String, dynamic> toMap() {
    return {
      'puuid': puuid,
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
      puuid: map['puuid'] ?? "",
      nickName: map['nickName'] ?? "",
      lineTag: map['lineTag'] ?? "",
      tier: map['tier'] ?? "",
      gameType: map['gameType'] ?? "",
      vocie: map['vocie'] ?? false,
      personel: map['personel'] ?? "",
    );
  }

  ArticleModel copyWith({
    String? puuid,
    String? nickName,
    String? lineTag,
    String? tier,
    String? gameType,
    bool? vocie,
    String? personel,
  }) {
    return ArticleModel(
      puuid: puuid ?? this.puuid,
      nickName: nickName ?? this.nickName,
      lineTag: lineTag ?? this.lineTag,
      tier: tier ?? this.tier,
      gameType: gameType ?? this.gameType,
      vocie: vocie ?? this.vocie,
      personel: personel ?? this.personel,
    );
  }
}
