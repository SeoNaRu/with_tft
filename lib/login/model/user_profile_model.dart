class Profile {
  final bool isUserDetailVisible;
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
    isUserDetailVisible: false,
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
      isUserDetailVisible: map['isUserDetailVisible'] ?? false,
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
    bool? isUserDetailVisible,
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
