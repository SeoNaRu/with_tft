import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_tft/home/bloc/home_bloc.dart';
import 'package:with_tft/home/bloc/home_event.dart';
import 'package:with_tft/home/bloc/home_state.dart';

Widget userVisibleButton(BuildContext context, String category, HomeEvent event,
    UserDetailVisible userDetailVisible) {
  UserDetailVisible userDetailVisibleEnum;
  switch (category) {
    case 'ON':
      userDetailVisibleEnum = UserDetailVisible.on;
      break;
    case 'OFF':
      userDetailVisibleEnum = UserDetailVisible.off;
      break;
    default:
      userDetailVisibleEnum = UserDetailVisible.off;
  }

  bool isSelected = userDetailVisibleEnum == userDetailVisible;
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
