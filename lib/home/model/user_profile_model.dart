class Profile {
  final String puuid;
  final String nickName;
  final String lineTag;
  final String isUserDetailVisible;
  final String userDescription;
  final String gameTypesStatus;
  final String voiceStatus;
  final String personnelStatus;
  final String ageCategory;
  final String gender;
  final String myVoiceCheck;
  final String playStyle;
  final String duoType;
  final String playTime;

  static const empty = Profile(
    puuid: '',
    nickName: '',
    lineTag: '',
    isUserDetailVisible: '',
    userDescription: '',
    gameTypesStatus: '',
    voiceStatus: '',
    personnelStatus: '',
    ageCategory: '',
    gender: '',
    myVoiceCheck: '',
    playStyle: '',
    duoType: '',
    playTime: '',
  );

  const Profile({
    required this.puuid,
    required this.nickName,
    required this.lineTag,
    required this.isUserDetailVisible,
    required this.userDescription,
    required this.gameTypesStatus,
    required this.voiceStatus,
    required this.personnelStatus,
    required this.ageCategory,
    required this.gender,
    required this.myVoiceCheck,
    required this.playStyle,
    required this.duoType,
    required this.playTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'puuid': puuid,
      'nickName': nickName,
      'lineTag': lineTag,
      'isUserDetailVisible': isUserDetailVisible,
      'userDescription': userDescription,
      'gameTypesStatus': gameTypesStatus,
      'voiceStatus': voiceStatus,
      'personnelStatus': personnelStatus,
      'ageCategory': ageCategory,
      'gender': gender,
      'myVoiceCheck': myVoiceCheck,
      'playStyle': playStyle,
      'duoType': duoType,
      'playTime': playTime,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      puuid: map['puuid'] ?? '',
      nickName: map['nickName'] ?? '',
      lineTag: map['lineTag'] ?? '',
      isUserDetailVisible: map['uservVisible'] ?? '',
      userDescription: map['userDescription'] ?? '',
      gameTypesStatus: map['gameTypesStatus'] ?? '',
      voiceStatus: map['voiceStatus'] ?? '',
      personnelStatus: map['personnelStatus'] ?? '',
      ageCategory: map['ageCategory'] ?? '',
      gender: map['gender'] ?? '',
      myVoiceCheck: map['myVoiceCheck'] ?? '',
      playStyle: map['playStyle'] ?? '',
      duoType: map['duoType'] ?? '',
      playTime: map['playTime'] ?? '',
    );
  }

  Profile copyWith({
    String? puuid,
    String? nickName,
    String? lineTag,
    String? isUserDetailVisible,
    String? userDescription,
    String? gameTypesStatus,
    String? voiceStatus,
    String? personnelStatus,
    String? ageCategory,
    String? gender,
    String? myVoiceCheck,
    String? playStyle,
    String? duoType,
    String? playTime,
  }) {
    return Profile(
      puuid: puuid ?? this.puuid,
      nickName: nickName ?? this.nickName,
      lineTag: lineTag ?? this.lineTag,
      isUserDetailVisible: isUserDetailVisible ?? this.isUserDetailVisible,
      userDescription: userDescription ?? this.userDescription,
      gameTypesStatus: gameTypesStatus ?? this.gameTypesStatus,
      voiceStatus: voiceStatus ?? this.voiceStatus,
      personnelStatus: personnelStatus ?? this.personnelStatus,
      ageCategory: ageCategory ?? this.ageCategory,
      gender: gender ?? this.gender,
      myVoiceCheck: myVoiceCheck ?? this.myVoiceCheck,
      playStyle: playStyle ?? this.playStyle,
      duoType: duoType ?? this.duoType,
      playTime: playTime ?? this.playTime,
    );
  }
}
