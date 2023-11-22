import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class RiotSummonerName extends LoginEvent {
  final String nickName;

  const RiotSummonerName({
    required this.nickName,
  });
}
