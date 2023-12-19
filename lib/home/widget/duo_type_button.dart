import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_tft/home/bloc/home_bloc.dart';
import 'package:with_tft/home/bloc/home_event.dart';
import 'package:with_tft/home/bloc/home_state.dart';

Widget duoTypeButton(
    BuildContext context, String category, HomeEvent event, DuoType duoType) {
  DuoType duoTypeEnum;
  switch (category) {
    case '랭크 듀오':
      duoTypeEnum = DuoType.rankDuo;
      break;
    case '일반 파티':
      duoTypeEnum = DuoType.gamingParty;
      break;
    case '여성 구함':
      duoTypeEnum = DuoType.femaleSeeking;
      break;
    case '남성 구함':
      duoTypeEnum = DuoType.maleSeeking;
      break;
    case '스승 찾기':
      duoTypeEnum = DuoType.mentorSeeking;
      break;
    case '제자 찾기':
      duoTypeEnum = DuoType.studentSeeking;
      break;
    default:
      duoTypeEnum = DuoType.gamingParty;
  }

  bool isSelected = duoTypeEnum == duoType;
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
