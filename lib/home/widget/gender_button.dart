import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_tft/home/bloc/home_bloc.dart';
import 'package:with_tft/home/bloc/home_event.dart';
import 'package:with_tft/home/bloc/home_state.dart';

Widget genderButton(
    BuildContext context, String category, HomeEvent event, Gender gender) {
  Gender genderEnum;
  switch (category) {
    case '남성':
      genderEnum = Gender.male;
      break;
    case '여성':
      genderEnum = Gender.female;
      break;
    case '비밀':
      genderEnum = Gender.secret;
      break;
    default:
      genderEnum = Gender.secret;
  }

  bool isSelected = genderEnum == gender;
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
