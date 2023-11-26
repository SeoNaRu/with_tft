import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_tft/home/bloc/home_event.dart';
import 'package:with_tft/home/bloc/home_state.dart';
import 'package:with_tft/home/model/article_model.dart';
import 'package:with_tft/my/my_env.dart';
import 'package:with_tft/repository/authentication_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AuthenticationRepository _authenticationRepository;

  HomeBloc()
      : _authenticationRepository = AuthenticationRepository(),
        super(HomeState.init()) {
    on<SelectedCategory>(_onSelectedCategory);
    on<SelectedGameType>(_onSelectedGameType);
    on<SelectedVocieCheck>(_onSelectedVocieCheck);
    on<SelectedPersonnelCheck>(_onSelectedPersonnelCheck);
    on<PostWritingBoard>(_onPostWritingBoard);
    on<GetArticleList>(_onGetArticleList);
    //profile
    on<SelectedAgeCategory>(_onSelectedAgeCategory);
    on<SelectedGender>(_onSelectedGender);
    on<SelectedMyVocieCheck>(_onSelectedMyVocieCheck);
  }
  FutureOr<void> _onSelectedCategory(SelectedCategory event, emit) async {
    emit(state.copyWith(status: event.category));
  }

  FutureOr<void> _onSelectedGameType(SelectedGameType event, emit) async {
    emit(state.copyWith(stringGameTypesStatus: event.stringGameTypesStatus));
    emit(state.copyWith(gameTypesStatus: event.gameTypesCategory));
  }

  FutureOr<void> _onSelectedVocieCheck(SelectedVocieCheck event, emit) async {
    emit(state.copyWith(stringVoiceStatus: event.stringVoiceStatus));
    emit(state.copyWith(voiceStatus: event.voiceCheck));
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
    emit(state.copyWith(stringGameTypesStatus: event.stringMyVoiceCheck));
    emit(state.copyWith(myVoiceCheck: event.myVoiceCheck));
  }

  FutureOr<void> _onPostWritingBoard(PostWritingBoard event, emit) async {
    dynamic body = {
      "nickName": event.nickName,
      "lineTag": event.lineTag,
      "tier": event.tier,
      "gameType": state.stringGameTypesStatus,
      "vocie": state.stringVoiceStatus,
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
}
