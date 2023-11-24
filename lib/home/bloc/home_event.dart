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
