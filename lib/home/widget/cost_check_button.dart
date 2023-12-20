import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_tft/home/bloc/home_bloc.dart';
import 'package:with_tft/home/bloc/home_event.dart';
import 'package:with_tft/home/bloc/home_state.dart';

// ChampionCost

Widget costCheckButton(BuildContext context, String category, HomeEvent event,
    ChampionCost championCostStatus) {
  ChampionCost championCostEnum;
  switch (category) {
    case '1코':
      championCostEnum = ChampionCost.one;
      break;
    case '2코':
      championCostEnum = ChampionCost.two;
      break;
    case '3코':
      championCostEnum = ChampionCost.three;
      break;
    case '4코':
      championCostEnum = ChampionCost.four;
      break;
    case '5코':
      championCostEnum = ChampionCost.five;
      break;
    default:
      championCostEnum = ChampionCost.one;
  }

  bool isSelected = championCostEnum == championCostStatus;
  return GestureDetector(
    onTap: () {
      context.read<HomeBloc>().add(event);
    },
    child: Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.transparent,
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Text(
        category,
        style: TextStyle(
          fontFamily: 'BeaufortforLOL',
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    ),
  );
}
