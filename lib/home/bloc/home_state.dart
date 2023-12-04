import 'package:equatable/equatable.dart';
import 'package:with_tft/home/model/article_model.dart';
import 'package:with_tft/home/model/user_profile_model.dart';

enum HomeCategory { findTeam, findDuo, synergyHelper, profile, writing }

enum GameTypes { normal, ranked, turbo, doubleUp }

enum PersonnelCheck { one, two, three, four, five, six, seven }

enum AgeCategory { adult, minor, secret }

enum Gender { male, female, secret }

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
  final List<Profile> userProfileList;
  final GameTypes gameTypesStatus;
  final String stringGameTypesStatus;
  final bool voice;
  final PersonnelCheck personnelStatus;
  final String stringPersonnelStatus;
  final AgeCategory ageCategory;
  final String stringAgeCategory;
  final Gender gender;
  final String stringGender;
  final bool myVoiceCheck;
  final PlayStyle playStyle;
  final String stringPlayStyle;
  final DuoType duoType;
  final String stringDuoType;
  final PlayTime playTime;
  final String stringPlayTime;
  final Interest interest;
  final String userDescription;
  final bool isUserDetailVisible;
  final List<ArticleModel> articles;

  const HomeState({
    required this.status,
    required this.gameTypesStatus,
    required this.userProfileList,
    required this.voice,
    required this.personnelStatus,
    required this.stringGameTypesStatus,
    required this.stringPersonnelStatus,
    required this.ageCategory,
    required this.stringAgeCategory,
    required this.gender,
    required this.stringGender,
    required this.myVoiceCheck,
    required this.playStyle,
    required this.stringPlayStyle,
    required this.duoType,
    required this.stringDuoType,
    required this.playTime,
    required this.stringPlayTime,
    required this.interest,
    required this.userDescription,
    required this.isUserDetailVisible,
    required this.articles,
  });

  factory HomeState.init() {
    return const HomeState(
      status: HomeCategory.findTeam,
      userProfileList: [],
      gameTypesStatus: GameTypes.normal,
      voice: false,
      personnelStatus: PersonnelCheck.one,
      stringGameTypesStatus: '비밀',
      stringPersonnelStatus: '1',
      ageCategory: AgeCategory.secret,
      stringAgeCategory: '비밀',
      gender: Gender.secret,
      stringGender: '비밀',
      myVoiceCheck: false,
      playStyle: PlayStyle.fun,
      stringPlayStyle: '즐겜',
      duoType: DuoType.gamingParty,
      stringDuoType: '일반 파티',
      playTime: PlayTime.random,
      stringPlayTime: '랜덤',
      interest: Interest.skillStudy,
      userDescription: '',
      isUserDetailVisible: false,
      articles: [],
    );
  }

  @override
  String toString() {
    return 'HomeState{status: $status gameTypesStatus:$gameTypesStatus  personnelStatus:$personnelStatus stringGameTypesStatus:$stringGameTypesStatus  stringPersonnelStatus:$stringPersonnelStatus ageCategory:$ageCategory gender:$gender playStyle:$playStyle duoType:$duoType playTime:$playTime interest:$interest articles:$articles ageCategory:$ageCategory userProfileList:$userProfileList}';
  }

  @override
  List<Object?> get props => [
        status,
        userProfileList,
        gameTypesStatus,
        voice,
        personnelStatus,
        stringGameTypesStatus,
        stringPersonnelStatus,
        ageCategory,
        stringAgeCategory,
        gender,
        stringGender,
        myVoiceCheck,
        playStyle,
        stringPlayStyle,
        duoType,
        stringDuoType,
        playTime,
        stringPlayTime,
        interest,
        userDescription,
        isUserDetailVisible,
        articles,
      ];

  HomeState copyWith({
    HomeCategory? status,
    List<Profile>? userProfileList,
    GameTypes? gameTypesStatus,
    bool? voice,
    PersonnelCheck? personnelStatus,
    String? stringGameTypesStatus,
    String? stringPersonnelStatus,
    AgeCategory? ageCategory,
    String? stringAgeCategory,
    Gender? gender,
    String? stringGender,
    bool? myVoiceCheck,
    PlayStyle? playStyle,
    String? stringPlayStyle,
    DuoType? duoType,
    String? stringDuoType,
    PlayTime? playTime,
    String? stringPlayTime,
    Interest? interest,
    String? userDescription,
    bool? isUserDetailVisible,
    List<ArticleModel>? articles,
  }) {
    return HomeState(
      status: status ?? this.status,
      gameTypesStatus: gameTypesStatus ?? this.gameTypesStatus,
      userProfileList: userProfileList ?? this.userProfileList,
      voice: voice ?? this.voice,
      personnelStatus: personnelStatus ?? this.personnelStatus,
      stringGameTypesStatus:
          stringGameTypesStatus ?? this.stringGameTypesStatus,
      stringPersonnelStatus:
          stringPersonnelStatus ?? this.stringPersonnelStatus,
      ageCategory: ageCategory ?? this.ageCategory,
      stringAgeCategory: stringAgeCategory ?? this.stringAgeCategory,
      gender: gender ?? this.gender,
      stringGender: stringGender ?? this.stringGender,
      myVoiceCheck: myVoiceCheck ?? this.myVoiceCheck,
      playStyle: playStyle ?? this.playStyle,
      stringPlayStyle: stringPlayStyle ?? this.stringPlayStyle,
      duoType: duoType ?? this.duoType,
      stringDuoType: stringDuoType ?? this.stringDuoType,
      playTime: playTime ?? this.playTime,
      stringPlayTime: stringPlayTime ?? this.stringPlayTime,
      interest: interest ?? this.interest,
      userDescription: userDescription ?? this.userDescription,
      isUserDetailVisible: isUserDetailVisible ?? this.isUserDetailVisible,
      articles: articles ?? this.articles,
    );
  }
}
