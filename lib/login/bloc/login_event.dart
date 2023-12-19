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
  final String lineTag;

  const RiotSummonerName({
    required this.nickName,
    required this.lineTag,
  });
}
