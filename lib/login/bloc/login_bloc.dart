import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_tft/login/bloc/login_event.dart';
import 'package:with_tft/login/bloc/login_state.dart';
import 'package:with_tft/login/model/user_model.dart';
import 'package:with_tft/my/my_env.dart';
import 'package:with_tft/repository/authentication_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationRepository _authenticationRepository;

  LoginBloc()
      : _authenticationRepository = AuthenticationRepository(),
        super(LoginState.init()) {
    on<RiotSummonerName>(_onRiotSummonerName);
  }
  FutureOr<void> _onRiotSummonerName(RiotSummonerName event, emit) async {
    try {
      String encodedSummonerName = Uri.encodeComponent(event.nickName);

      dynamic response = await _authenticationRepository.passGet(MyEnv.ipRiot,
          '/tft/summoner/v1/summoners/by-name/$encodedSummonerName?api_key=${MyEnv.riotKey}');

      if (response['status'] != null &&
          response['status']['status_code'] > 400) {
        emit(state.copyWith(status: AuthenticationStatus.unauthenticated));
      } else {
        User user = User.fromMap(response);
        emit(state.copyWith(user: user));
        emit(state.copyWith(status: AuthenticationStatus.authenticated));
      }
    } catch (e) {
      debugPrint("Error occurred: $e");
    }
  }
}
