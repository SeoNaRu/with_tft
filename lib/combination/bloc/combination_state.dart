part of 'combination_bloc.dart';

sealed class CombinationState extends Equatable {
  const CombinationState();
  
  @override
  List<Object> get props => [];
}

final class CombinationInitial extends CombinationState {}
