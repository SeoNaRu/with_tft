import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_tft/home/bloc/home_bloc.dart';
import 'package:with_tft/home/bloc/home_event.dart';
import 'package:with_tft/home/bloc/home_state.dart';

Widget gameTypeButton(
  BuildContext context,
  String category,
  HomeEvent event,
  GameTypes gameTypesStatus,
  PersonnelCheck personnelEnum,
) {
  GameTypes gameTypesEnum;
  switch (category) {
    case '일반':
      gameTypesEnum = GameTypes.noaml;
      break;
    case '랭크':
      gameTypesEnum = GameTypes.ranked;
      break;
    case '초고속':
      gameTypesEnum = GameTypes.turbo;
      break;
    case '더블업':
      gameTypesEnum = GameTypes.doubleUp;
      break;
    default:
      gameTypesEnum = GameTypes.noaml;
  }
  bool ispersonnelCheck = personnelEnum != PersonnelCheck.one &&
      personnelEnum != PersonnelCheck.two;
  bool isSelected = gameTypesEnum == gameTypesStatus;
  return GestureDetector(
    onTap: () {
      if (category == '랭크' && ispersonnelCheck) {
        context.read<HomeBloc>().add(const SelectedPersonnelCheck(
            personnelCheck: PersonnelCheck.one, stringPersonnelStatus: "1"));
      }
      context.read<HomeBloc>().add(event);
    },
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 1, horizontal: 1),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
        color: isSelected ? Colors.black : Colors.transparent,
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Center(
        child: Text(
          category,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    ),
  );
}
