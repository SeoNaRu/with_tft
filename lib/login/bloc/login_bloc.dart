import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_tft/login/bloc/login_event.dart';
import 'package:with_tft/login/bloc/login_state.dart';
import 'package:with_tft/login/model/tire_model.dart';
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
      String encodedLineTag = Uri.encodeComponent(event.lineTag);
      dynamic response = await _authenticationRepository.passGet(MyEnv.ipRiot,
          '/riot/account/v1/accounts/by-riot-id/$encodedSummonerName/$encodedLineTag?api_key=${MyEnv.riotKey}');

      if (response['puuid'] == null) {
        emit(state.copyWith(status: AuthenticationStatus.unauthenticated));
      } else {
        // 유저 기본 정보 받기
        String puuid = response['puuid'];
        String lineTag = response['tagLine'];
        dynamic puuidResponse = await _authenticationRepository.passGet(
            MyEnv.ipTft,
            '/tft/summoner/v1/summoners/by-puuid/$puuid?api_key=${MyEnv.riotKey}');

        // User user = User.fromMap(puuidResponse);
        User user = User.fromMap(puuidResponse).copyWith(lingTag: lineTag);

        emit(state.copyWith(user: user));
        print('유저 정보 잘 받아오고 있니? ${state.user}');
        //tier 정보 받기
        String id = puuidResponse['id'];
        dynamic tierResponse = await _authenticationRepository.passGet(
            MyEnv.ipTft,
            '/tft/league/v1/entries/by-summoner/$id?api_key=${MyEnv.riotKey}');
        print('tierResponse:$tierResponse');

        if (tierResponse.isNotEmpty) {
          Tier tier = Tier.fromMap(tierResponse[0]);
          emit(state.copyWith(tier: tier));
        }

        emit(state.copyWith(status: AuthenticationStatus.authenticated));
      }
    } catch (e) {
      debugPrint("Error occurred: $e");
    }
  }
}
