import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_tft/home/bloc/home_event.dart';
import 'package:with_tft/home/bloc/home_state.dart';
import 'package:with_tft/home/model/article_model.dart';
import 'package:with_tft/home/model/champion_model.dart';
import 'package:with_tft/home/model/user_profile_model.dart';
import 'package:with_tft/my/my_env.dart';
import 'package:with_tft/repository/authentication_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AuthenticationRepository _authenticationRepository;

  HomeBloc()
      : _authenticationRepository = AuthenticationRepository(),
        super(HomeState.init()) {
    on<SelectedCategory>(_onSelectedCategory);
    on<SelectedCost>(_onSelectedCost);
    on<SelectedGameType>(_onSelectedGameType);
    on<SelectedVocieCheck>(_onSelectedVocieCheck);
    on<SelectedPersonnelCheck>(_onSelectedPersonnelCheck);
    on<PostWritingBoard>(_onPostWritingBoard);
    on<GetArticleList>(_onGetArticleList);
    //profile
    on<SelectedAgeCategory>(_onSelectedAgeCategory);
    on<SelectedGender>(_onSelectedGender);
    on<SelectedMyVocieCheck>(_onSelectedMyVocieCheck);
    on<SelectedPlayStyle>(_onSelectedPlayStyle);
    on<SelectedDuoType>(_onSelectedDuoType);
    on<SelectedPlayTime>(_onSelectedPlayTime);
    on<SaveUserProfile>(_onSaveUserProfile);
    on<SelectedUserVisible>(_onSelectedUserVisible);
    on<GetAllUserList>(_onGetAllUserList);
    //ChampionList
    on<GetChampionList>(_onGetChampionList);
  }
  FutureOr<void> _onSelectedCategory(SelectedCategory event, emit) async {
    emit(state.copyWith(status: event.category));
  }

  FutureOr<void> _onSelectedCost(SelectedCost event, emit) async {
    emit(state.copyWith(championCost: event.championCost));
  }

  FutureOr<void> _onSelectedGameType(SelectedGameType event, emit) async {
    emit(state.copyWith(stringGameTypesStatus: event.stringGameTypesStatus));
    emit(state.copyWith(gameTypesStatus: event.gameTypesCategory));
  }

  FutureOr<void> _onSelectedVocieCheck(SelectedVocieCheck event, emit) async {
    emit(state.copyWith(voice: event.voiceCheck));
    // emit(state.copyWith(voiceStatus: event.voiceCheck));
  }

  FutureOr<void> _onSelectedPersonnelCheck(
      SelectedPersonnelCheck event, emit) async {
    emit(state.copyWith(stringPersonnelStatus: event.stringPersonnelStatus));
    emit(state.copyWith(personnelStatus: event.personnelCheck));
  }

  //profile
  FutureOr<void> _onSelectedAgeCategory(SelectedAgeCategory event, emit) async {
    emit(state.copyWith(stringAgeCategory: event.stringAgeCategory));
    emit(state.copyWith(ageCategory: event.ageCategory));
  }

  FutureOr<void> _onSelectedGender(SelectedGender event, emit) async {
    emit(state.copyWith(stringGender: event.stringGender));
    emit(state.copyWith(gender: event.gender));
  }

  FutureOr<void> _onSelectedMyVocieCheck(
      SelectedMyVocieCheck event, emit) async {
    emit(state.copyWith(myVoiceCheck: event.myVoiceCheck));
  }

  FutureOr<void> _onSelectedPlayStyle(SelectedPlayStyle event, emit) async {
    emit(state.copyWith(stringPlayStyle: event.stringPlayStyle));
    emit(state.copyWith(playStyle: event.playStyle));
  }

  FutureOr<void> _onSelectedDuoType(SelectedDuoType event, emit) async {
    emit(state.copyWith(stringDuoType: event.stringDuoType));
    emit(state.copyWith(duoType: event.duoType));
  }

  FutureOr<void> _onSelectedPlayTime(SelectedPlayTime event, emit) async {
    emit(state.copyWith(stringPlayTime: event.stringPlayTime));
    emit(state.copyWith(playTime: event.playTime));
  }

  FutureOr<void> _onSelectedUserVisible(SelectedUserVisible event, emit) async {
    emit(state.copyWith(isUserDetailVisible: event.userVisible));
  }

  FutureOr<void> _onPostWritingBoard(PostWritingBoard event, emit) async {
    dynamic body = {
      "puuid": event.puuid,
      "nickName": event.nickName,
      "lineTag": event.lineTag,
      "tier": event.tier,
      "gameType": state.stringGameTypesStatus,
      "vocie": state.voice,
      "personel": state.stringPersonnelStatus,
    };
    dynamic response = await _authenticationRepository.testPost(
        MyEnv.testIp, '/articles', body);

    List<ArticleModel> articles =
        response.map<ArticleModel>((e) => ArticleModel.fromMap(e)).toList();

    emit(state.copyWith(articles: articles));
  }

  FutureOr<void> _onGetArticleList(GetArticleList event, emit) async {
    dynamic response =
        await _authenticationRepository.testGet(MyEnv.testIp, '/articles');

    List<ArticleModel> articles =
        response.map<ArticleModel>((e) => ArticleModel.fromMap(e)).toList();

    emit(state.copyWith(articles: articles));
  }

  FutureOr<void> _onSaveUserProfile(SaveUserProfile event, emit) async {
    dynamic body = {
      // "nickName": event.nickName,
      "puuid": event.puuid,
      "nickName": event.nickName,
      "lineTag": event.lineTag,
      "tier": event.tier,
      "age": state.stringAgeCategory,
      "gender": state.stringGender,
      "myVoice": state.myVoiceCheck,
      "playStyle": state.stringPlayStyle,
      "duoType": state.stringDuoType,
      "playTime": state.stringPlayTime,
      "visible": state.isUserDetailVisible,
      "description": event.description,
    };
    dynamic response =
        await _authenticationRepository.testPost(MyEnv.testIp, '/user', body);

    List<Profile> users =
        response.map<Profile>((e) => Profile.fromMap(e)).toList();

    emit(state.copyWith(userProfileList: users));
    emit(state.copyWith(status: HomeCategory.findDuo));
  }

  FutureOr<void> _onGetAllUserList(GetAllUserList event, emit) async {
    dynamic response =
        await _authenticationRepository.testGet(MyEnv.testIp, '/user');

    List<Profile> users =
        response.map<Profile>((e) => Profile.fromMap(e)).toList();

    emit(state.copyWith(userProfileList: users));
  }

  FutureOr<void> _onGetChampionList(GetChampionList event, emit) async {
    try {
      dynamic response = await _authenticationRepository.passGet(
          "ddragon.leagueoflegends.com",
          '/cdn/13.23.1/data/ko_KR/tft-champion.json');
      dynamic tftChampionList = response['data'];

      List<ChampionModel> tftChampion =
          tftChampionList.entries.map<ChampionModel>((entry) {
        Map<String, dynamic> championData = entry.value;

        return ChampionModel.fromMap({
          'id': entry.key,
          'name': championData['name'],
          'tier': championData['tier'],
          'image': championData['image']['full'],
        });
      }).toList();

      emit(state.copyWith(champion: tftChampion));
    } catch (error) {
      print('챔피언 리스트를 가져오는 중 오류 발생: $error');
    }
  }
}
