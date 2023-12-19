import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_tft/home/bloc/home_bloc.dart';
import 'package:with_tft/home/bloc/home_event.dart';
import 'package:with_tft/home/bloc/home_state.dart';

Widget playTimeButton(
    BuildContext context, String category, HomeEvent event, PlayTime playTime) {
  PlayTime playTimeEnum;
  switch (category) {
    case '아침':
      playTimeEnum = PlayTime.morning;
      break;
    case '점심':
      playTimeEnum = PlayTime.lunch;
      break;
    case '저녁':
      playTimeEnum = PlayTime.night;
      break;
    case '평일':
      playTimeEnum = PlayTime.weekday;
      break;
    case '주말':
      playTimeEnum = PlayTime.weekend;
      break;
    case '랜덤':
      playTimeEnum = PlayTime.random;
      break;
    default:
      playTimeEnum = PlayTime.random;
  }

  bool isSelected = playTimeEnum == playTime;
  return Flexible(
    child: GestureDetector(
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
    ),
  );
}
