import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_tft/home/bloc/home_bloc.dart';
import 'package:with_tft/home/bloc/home_event.dart';
import 'package:with_tft/home/bloc/home_state.dart';

Widget ageCategoryButton(BuildContext context, String category, HomeEvent event,
    AgeCategory ageCategory) {
  AgeCategory ageCategoryEnum;
  switch (category) {
    case '성인':
      ageCategoryEnum = AgeCategory.minor;
      break;
    case '청소년':
      ageCategoryEnum = AgeCategory.adult;
      break;
    case '비밀':
      ageCategoryEnum = AgeCategory.secret;
      break;
    default:
      ageCategoryEnum = AgeCategory.secret;
  }

  bool isSelected = ageCategoryEnum == ageCategory;
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
