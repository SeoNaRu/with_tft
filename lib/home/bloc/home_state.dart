import 'package:equatable/equatable.dart';
import 'package:with_tft/login/model/tire_model.dart';
import 'package:with_tft/login/model/user_model.dart';

enum HomeCategory { findTeam, synergyHelper, profile }

class HomeState extends Equatable {
  final HomeCategory status;

  const HomeState({
    required this.status,
  });

  factory HomeState.init() {
    return const HomeState(
      status: HomeCategory.findTeam,
    );
  }

  @override
  String toString() {
    return 'HomeState{status: $status}';
  }

  @override
  List<Object?> get props => [
        status,
      ];

  HomeState copyWith({
    HomeCategory? status,
  }) {
    return HomeState(
      status: status ?? this.status,
    );
  }
}
