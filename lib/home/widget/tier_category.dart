import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_tft/home/bloc/home_bloc.dart';
import 'package:with_tft/home/bloc/home_event.dart';
import 'package:with_tft/home/bloc/home_state.dart';

Widget tierCategoryBtn(BuildContext context, String category, HomeEvent event,
    HomeCategory currentStatus) {
  HomeCategory categoryEnum;
  switch (category) {
    case '1코':
      categoryEnum = HomeCategory.findTeam;
      break;
    case '2코':
      categoryEnum = HomeCategory.findDuo;
      break;
    case '3코':
      categoryEnum = HomeCategory.synergyHelper;
      break;
    case '4코':
      categoryEnum = HomeCategory.profile;
      break;
    case '5코':
      categoryEnum = HomeCategory.profile;
      break;
    default:
      categoryEnum = HomeCategory.findTeam;
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
