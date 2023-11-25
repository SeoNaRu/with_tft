import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_tft/home/bloc/home_bloc.dart';
import 'package:with_tft/home/bloc/home_event.dart';
import 'package:with_tft/home/bloc/home_state.dart';

Widget personnelCheckButton(BuildContext context, String category,
    HomeEvent event, PersonnelCheck personnelStatus) {
  PersonnelCheck personnelEnum;
  switch (category) {
    case '1':
      personnelEnum = PersonnelCheck.one;
      break;
    case '2':
      personnelEnum = PersonnelCheck.two;
      break;
    case '3':
      personnelEnum = PersonnelCheck.three;
      break;
    case '4':
      personnelEnum = PersonnelCheck.four;
      break;
    case '5':
      personnelEnum = PersonnelCheck.five;
      break;
    case '6':
      personnelEnum = PersonnelCheck.six;
      break;
    case '7':
      personnelEnum = PersonnelCheck.seven;
      break;
    default:
      personnelEnum = PersonnelCheck.one;
  }

  bool isSelected = personnelEnum == personnelStatus;
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
