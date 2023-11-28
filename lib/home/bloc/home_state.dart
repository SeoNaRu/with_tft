import 'package:equatable/equatable.dart';
import 'package:with_tft/home/model/article_model.dart';

enum HomeCategory { findTeam, synergyHelper, profile, writing }

enum GameTypes { normal, ranked, turbo, doubleUp }

enum VoiceCheck { on, off }

enum PersonnelCheck { one, two, three, four, five, six, seven }

enum AgeCategory { adult, minor, secret }

enum Gender { male, female, secret }

enum MyVoiceCheck { on, off }

enum PlayStyle { fun, faceKeeping, reroll, levelUp }

enum DuoType {
  rankDuo,
  maleSeeking,
  femaleSeeking,
  gamingParty,
  mentorSeeking,
  studentSeeking,
}

enum PlayTime { morning, lunch, night, weekday, weekend, random }

enum Interest { skillStudy, casualChat, streamer, tournamentWatch }

class HomeState extends Equatable {
  final HomeCategory status;
  final GameTypes gameTypesStatus;
  final String stringGameTypesStatus;
  final VoiceCheck voiceStatus;
  final String stringVoiceStatus;
  final PersonnelCheck personnelStatus;
  final String stringPersonnelStatus;
  final AgeCategory ageCategory;
  final String stringAgeCategory;
  final Gender gender;
  final String stringGender;
  final MyVoiceCheck myVoiceCheck;
  final String stringMyVoiceCheck;
  final PlayStyle playStyle;
  final String stringPlayStyle;
  final DuoType duoType;
  final String stringDuoType;
  final PlayTime playTime;
  final String stringPlayTime;
  final Interest interest;
  final List<ArticleModel> articles;

  const HomeState({
    required this.status,
    required this.gameTypesStatus,
    required this.voiceStatus,
    required this.personnelStatus,
    required this.stringGameTypesStatus,
    required this.stringVoiceStatus,
    required this.stringPersonnelStatus,
    required this.ageCategory,
    required this.stringAgeCategory,
    required this.gender,
    required this.stringGender,
    required this.myVoiceCheck,
    required this.stringMyVoiceCheck,
    required this.playStyle,
    required this.stringPlayStyle,
    required this.duoType,
    required this.stringDuoType,
    required this.playTime,
    required this.stringPlayTime,
    required this.interest,
    required this.articles,
  });

  factory HomeState.init() {
    return const HomeState(
      status: HomeCategory.findTeam,
      gameTypesStatus: GameTypes.normal,
      voiceStatus: VoiceCheck.off,
      personnelStatus: PersonnelCheck.one,
      stringGameTypesStatus: '비밀',
      stringVoiceStatus: 'OFF',
      stringPersonnelStatus: '1',
      ageCategory: AgeCategory.secret,
      stringAgeCategory: '비밀',
      gender: Gender.secret,
      stringGender: '비밀',
      myVoiceCheck: MyVoiceCheck.off,
      stringMyVoiceCheck: 'OFF',
      playStyle: PlayStyle.fun,
      stringPlayStyle: '즐겜',
      duoType: DuoType.gamingParty,
      stringDuoType: '일반 파티',
      playTime: PlayTime.random,
      stringPlayTime: '랜덤',
      interest: Interest.skillStudy,
      articles: [],
    );
  }

  @override
  String toString() {
    return 'HomeState{status: $status gameTypesStatus:$gameTypesStatus voiceStatus:$voiceStatus personnelStatus:$personnelStatus stringGameTypesStatus:$stringGameTypesStatus stringVoiceStatus:$stringVoiceStatus stringPersonnelStatus:$stringPersonnelStatus ageCategory:$ageCategory gender:$gender playStyle:$playStyle duoType:$duoType playTime:$playTime interest:$interest articles:$articles ageCategory:$ageCategory}';
  }

  @override
  List<Object?> get props => [
        status,
        gameTypesStatus,
        voiceStatus,
        personnelStatus,
        stringGameTypesStatus,
        stringVoiceStatus,
        stringPersonnelStatus,
        ageCategory,
        stringAgeCategory,
        gender,
        stringGender,
        myVoiceCheck,
        stringMyVoiceCheck,
        playStyle,
        stringPlayStyle,
        duoType,
        stringDuoType,
        playTime,
        stringPlayTime,
        interest,
        articles,
      ];

  HomeState copyWith({
    HomeCategory? status,
    GameTypes? gameTypesStatus,
    VoiceCheck? voiceStatus,
    PersonnelCheck? personnelStatus,
    String? stringGameTypesStatus,
    String? stringVoiceStatus,
    String? stringPersonnelStatus,
    AgeCategory? ageCategory,
    String? stringAgeCategory,
    Gender? gender,
    String? stringGender,
    MyVoiceCheck? myVoiceCheck,
    String? stringMyVoiceCheck,
    PlayStyle? playStyle,
    String? stringPlayStyle,
    DuoType? duoType,
    String? stringDuoType,
    PlayTime? playTime,
    String? stringPlayTime,
    Interest? interest,
    List<ArticleModel>? articles,
  }) {
    return HomeState(
      status: status ?? this.status,
      gameTypesStatus: gameTypesStatus ?? this.gameTypesStatus,
      voiceStatus: voiceStatus ?? this.voiceStatus,
      personnelStatus: personnelStatus ?? this.personnelStatus,
      stringGameTypesStatus:
          stringGameTypesStatus ?? this.stringGameTypesStatus,
      stringVoiceStatus: stringVoiceStatus ?? this.stringVoiceStatus,
      stringPersonnelStatus:
          stringPersonnelStatus ?? this.stringPersonnelStatus,
      ageCategory: ageCategory ?? this.ageCategory,
      stringAgeCategory: stringAgeCategory ?? this.stringAgeCategory,
      gender: gender ?? this.gender,
      stringGender: stringGender ?? this.stringGender,
      myVoiceCheck: myVoiceCheck ?? this.myVoiceCheck,
      stringMyVoiceCheck: stringMyVoiceCheck ?? this.stringMyVoiceCheck,
      playStyle: playStyle ?? this.playStyle,
      stringPlayStyle: stringPlayStyle ?? this.stringPlayStyle,
      duoType: duoType ?? this.duoType,
      stringDuoType: stringDuoType ?? this.stringDuoType,
      playTime: playTime ?? this.playTime,
      stringPlayTime: stringPlayTime ?? this.stringPlayTime,
      interest: interest ?? this.interest,
      articles: articles ?? this.articles,
    );
  }
}
