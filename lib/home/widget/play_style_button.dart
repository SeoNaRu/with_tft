import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_tft/home/bloc/home_bloc.dart';
import 'package:with_tft/home/bloc/home_event.dart';
import 'package:with_tft/home/bloc/home_state.dart';

Widget playStyleButton(BuildContext context, String category, HomeEvent event,
    PlayStyle playStyle) {
  PlayStyle playStyleEnum;
  switch (category) {
    case '즐겜':
      playStyleEnum = PlayStyle.fun;
      break;
    case '빡겜':
      playStyleEnum = PlayStyle.faceKeeping;
      break;
    case '리롤':
      playStyleEnum = PlayStyle.reroll;
      break;
    case '렙업':
      playStyleEnum = PlayStyle.levelUp;
      break;
    default:
      playStyleEnum = PlayStyle.fun;
  }

  bool isSelected = playStyleEnum == playStyle;
  return GestureDetector(
    onTap: () {
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
