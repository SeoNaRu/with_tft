import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_tft/home/bloc/home_event.dart';
import 'package:with_tft/home/bloc/home_state.dart';
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
  }
  FutureOr<void> _onSelectedCategory(SelectedCategory event, emit) async {
    emit(state.copyWith(status: event.category));
  }

  FutureOr<void> _onSelectedGameType(SelectedGameType event, emit) async {
    emit(state.copyWith(stringGameTypesStatus: event.stringGameTypesStatus));
    emit(state.copyWith(gameTypesStatus: event.gameTypesCategory));
  }

  FutureOr<void> _onSelectedVocieCheck(SelectedVocieCheck event, emit) async {
    emit(state.copyWith(stringVocieStatus: event.stringVocieStatus));
    emit(state.copyWith(vocieStatus: event.vocieCheck));
  }

  FutureOr<void> _onSelectedPersonnelCheck(
      SelectedPersonnelCheck event, emit) async {
    emit(state.copyWith(stringPersonnelStatus: event.stringPersonnelStatus));
    emit(state.copyWith(personnelStatus: event.personnelCheck));
  }

  FutureOr<void> _onPostWritingBoard(PostWritingBoard event, emit) async {
    dynamic body = {
      "nickName": event.nickName,
      "lineTag": event.lineTag,
      "tier": event.tier,
      "gameType": state.stringGameTypesStatus,
      "vocie": state.stringVocieStatus,
      "personel": state.stringPersonnelStatus,
    };
    print('등록하기 $body');
  }
}
