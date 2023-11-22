import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String accountId;
  final String puuid;
  final String name;
  final int profileIconId;
  final int revisionDate;
  final int summonerLevel;

  static const empty = User(
    id: '',
    accountId: '',
    puuid: '',
    name: '',
    profileIconId: 0,
    revisionDate: 0,
    summonerLevel: 0,
  );

  const User({
    required this.id,
    required this.accountId,
    required this.puuid,
    required this.name,
    required this.profileIconId,
    required this.revisionDate,
    required this.summonerLevel,
    // required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        accountId,
        puuid,
        name,
        profileIconId,
        revisionDate,
        summonerLevel,
      ];

  @override
  String toString() {
    return 'User{id: $id, accountId: $accountId,puuid:$puuid, name: $name, profileIconId: $profileIconId, revisionDate: $revisionDate,summonerLevel: $summonerLevel,  }';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'accountId': accountId,
      'puuid': puuid,
      'name': name,
      'profileIconId': profileIconId,
      'revisionDate': revisionDate,
      'summonerLevel': summonerLevel,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? "",
      accountId: map['accountId'] ?? "",
      puuid: map['puuid'] ?? "",
      name: map['name'] ?? "",
      profileIconId: map['profileIconId'] ?? "" as int,

      revisionDate: map['revisionDate'] ?? "" as int,
      summonerLevel: map['summonerLevel'] ?? "" as int,
      // createdAt: map['createdAt'] ?? "" as int,
    );
  }

  User copyWith({
    String? id,
    String? accountId,
    String? puuid,
    String? name,
    int? profileIconId,
    int? revisionDate,
    int? summonerLevel,
  }) {
    return User(
      id: id ?? this.id,
      accountId: accountId ?? this.accountId,
      puuid: puuid ?? this.puuid,
      name: name ?? this.name,
      profileIconId: profileIconId ?? this.profileIconId,
      revisionDate: revisionDate ?? this.revisionDate,
      summonerLevel: summonerLevel ?? this.summonerLevel,
    );
  }
}
