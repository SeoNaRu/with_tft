class Profile {
  final String puuid;
  final String nickName;
  final String lineTag;
  final String isUserDetailVisible;
  final String userDescription;

  final String tier;
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
    tier: '',
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
    required this.tier,
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
      'tier': tier,
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
      tier: map['tier'] ?? '',
      isUserDetailVisible: map['visible'] ?? '',
      userDescription: map['description'] ?? '',
      ageCategory: map['age'] ?? '',
      gender: map['gender'] ?? '',
      myVoiceCheck: map['myVoice'] ?? '',
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
    String? tier,
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
      tier: tier ?? this.tier,
      ageCategory: ageCategory ?? this.ageCategory,
      gender: gender ?? this.gender,
      myVoiceCheck: myVoiceCheck ?? this.myVoiceCheck,
      playStyle: playStyle ?? this.playStyle,
      duoType: duoType ?? this.duoType,
      playTime: playTime ?? this.playTime,
    );
  }
}
