import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_tft/home/bloc/home_bloc.dart';
import 'package:with_tft/home/bloc/home_event.dart';

Widget buildCategoryButton(String category, HomeEvent event,
    String selectedCategory, BuildContext context) {
  bool isSelected = selectedCategory == category;

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
          fontWeight: FontWeight.bold,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    ),
  );
}
