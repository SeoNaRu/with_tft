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
  }
  FutureOr<void> _onSelectedCategory(SelectedCategory event, emit) async {
    emit(state.copyWith(status: event.category));
  }
}
