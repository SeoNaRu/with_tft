import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:with_tft/home/bloc/home_state.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class SelectedCategory extends HomeEvent {
  final HomeCategory category;

  const SelectedCategory({
    required this.category,
  });
}

class SelectedGameType extends HomeEvent {
  final GameTypes gameTypesCategory;
  final String stringGameTypesStatus;

  const SelectedGameType({
    required this.gameTypesCategory,
    required this.stringGameTypesStatus,
  });
}

class SelectedVocieCheck extends HomeEvent {
  final VoiceCheck voiceCheck;
  final String stringVoiceStatus;

  const SelectedVocieCheck({
    required this.voiceCheck,
    required this.stringVoiceStatus,
  });
}

class SelectedPersonnelCheck extends HomeEvent {
  final PersonnelCheck personnelCheck;
  final String stringPersonnelStatus;

  const SelectedPersonnelCheck({
    required this.personnelCheck,
    required this.stringPersonnelStatus,
  });
}

class PostWritingBoard extends HomeEvent {
  final String nickName;
  final String lineTag;
  final String tier;

  const PostWritingBoard({
    required this.nickName,
    required this.lineTag,
    required this.tier,
  });
}

class GetArticleList extends HomeEvent {}

//profile

class SelectedAgeCategory extends HomeEvent {
  final AgeCategory ageCategory;
  final String stringAgeCategory;

  const SelectedAgeCategory({
    required this.ageCategory,
    required this.stringAgeCategory,
  });
}

class SelectedGender extends HomeEvent {
  final Gender gender;
  final String stringGender;

  const SelectedGender({
    required this.gender,
    required this.stringGender,
  });
}

class SelectedMyVocieCheck extends HomeEvent {
  final MyVoiceCheck myVoiceCheck;
  final String stringMyVoiceCheck;

  const SelectedMyVocieCheck({
    required this.myVoiceCheck,
    required this.stringMyVoiceCheck,
  });
}

class SelectedPlayStyle extends HomeEvent {
  final PlayStyle playStyle;
  final String stringPlayStyle;

  const SelectedPlayStyle({
    required this.playStyle,
    required this.stringPlayStyle,
  });
}

class SelectedDuoType extends HomeEvent {
  final DuoType duoType;
  final String stringDuoType;

  const SelectedDuoType({
    required this.duoType,
    required this.stringDuoType,
  });
}

class SelectedPlayTime extends HomeEvent {
  final PlayTime playTime;
  final String stringPlayTime;

  const SelectedPlayTime({
    required this.playTime,
    required this.stringPlayTime,
  });
}
