import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_tft/home/bloc/home_bloc.dart';
import 'package:with_tft/home/bloc/home_event.dart';
import 'package:with_tft/home/bloc/home_state.dart';

Widget myVoiceCheckButton(BuildContext context, String category,
    HomeEvent event, MyVoiceCheck vocieStatus) {
  MyVoiceCheck vocieCheckEnum;
  switch (category) {
    case 'ON':
      vocieCheckEnum = MyVoiceCheck.on;
      break;
    case 'OFF':
      vocieCheckEnum = MyVoiceCheck.off;
      break;
    default:
      vocieCheckEnum = MyVoiceCheck.off;
  }

  bool isSelected = vocieCheckEnum == vocieStatus;
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
