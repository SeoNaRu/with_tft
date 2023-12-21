import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_tft/combination/view/combination_view.dart';
import 'package:with_tft/home/bloc/home_bloc.dart';
import 'package:with_tft/home/bloc/home_event.dart';
import 'package:with_tft/home/bloc/home_state.dart';

Widget combinationButton(BuildContext context, String category, HomeEvent event,
    HomeCategory currentStatus) {
  HomeCategory categoryEnum;
  switch (category) {
    case '조합':
      categoryEnum = HomeCategory.synergyHelper;
      break;
    case '홈':
      categoryEnum = HomeCategory.findTeam;
      break;
    default:
      categoryEnum = HomeCategory.synergyHelper;
  }

  bool isSelected = categoryEnum == currentStatus;
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
