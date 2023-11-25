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
  final VocieCheck vocieCheck;
  final String stringVocieStatus;

  const SelectedVocieCheck({
    required this.vocieCheck,
    required this.stringVocieStatus,
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
