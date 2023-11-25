import 'package:equatable/equatable.dart';
import 'package:with_tft/login/model/tire_model.dart';
import 'package:with_tft/login/model/user_model.dart';

enum HomeCategory { findTeam, synergyHelper, profile, wriTing }

enum GameTypes { noaml, ranked, turbo, doubleUp }

enum VocieCheck { on, off }

enum PersonnelCheck { one, two, three, four, five, six, seven }

class HomeState extends Equatable {
  final HomeCategory status;
  final GameTypes gameTypesStatus;
  final String stringGameTypesStatus;
  final VocieCheck vocieStatus;
  final String stringVocieStatus;
  final PersonnelCheck personnelStatus;
  final String stringPersonnelStatus;

  const HomeState({
    required this.status,
    required this.gameTypesStatus,
    required this.vocieStatus,
    required this.personnelStatus,
    required this.stringGameTypesStatus,
    required this.stringVocieStatus,
    required this.stringPersonnelStatus,
  });

  factory HomeState.init() {
    return const HomeState(
      status: HomeCategory.findTeam,
      gameTypesStatus: GameTypes.noaml,
      vocieStatus: VocieCheck.off,
      personnelStatus: PersonnelCheck.one,
      stringGameTypesStatus: '일반',
      stringVocieStatus: 'OFF',
      stringPersonnelStatus: '1',
    );
  }

  @override
  String toString() {
    return 'HomeState{status: $status gameTypesStatus:$gameTypesStatus vocieStatus:$vocieStatus personnelStatus:$personnelStatus stringGameTypesStatus:$stringGameTypesStatus stringVocieStatus:$stringVocieStatus stringPersonnelStatus:$stringPersonnelStatus}';
  }

  @override
  List<Object?> get props => [
        status,
        gameTypesStatus,
        vocieStatus,
        personnelStatus,
        stringGameTypesStatus,
        stringVocieStatus,
        stringPersonnelStatus,
      ];

  HomeState copyWith({
    HomeCategory? status,
    GameTypes? gameTypesStatus,
    VocieCheck? vocieStatus,
    PersonnelCheck? personnelStatus,
    String? stringGameTypesStatus,
    String? stringVocieStatus,
    String? stringPersonnelStatus,
  }) {
    return HomeState(
      status: status ?? this.status,
      gameTypesStatus: gameTypesStatus ?? this.gameTypesStatus,
      vocieStatus: vocieStatus ?? this.vocieStatus,
      personnelStatus: personnelStatus ?? this.personnelStatus,
      stringGameTypesStatus:
          stringGameTypesStatus ?? this.stringGameTypesStatus,
      stringVocieStatus: stringVocieStatus ?? this.stringVocieStatus,
      stringPersonnelStatus:
          stringPersonnelStatus ?? this.stringPersonnelStatus,
    );
  }
}
