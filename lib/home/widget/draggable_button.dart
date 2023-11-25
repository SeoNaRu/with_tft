import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_tft/home/bloc/home_bloc.dart';
import 'package:with_tft/home/bloc/home_event.dart';
import 'package:with_tft/home/bloc/home_state.dart';
import 'package:with_tft/home/widget/game_type_button.dart';
import 'package:with_tft/login/bloc/login_bloc.dart';

class DraggableButton extends StatefulWidget {
  @override
  _DraggableButtonState createState() => _DraggableButtonState();
}

class _DraggableButtonState extends State<DraggableButton> {
  @override
  Widget build(BuildContext context) {
    String selectedValue = '일반'; // 초기 선택 값
    final loginBloc = BlocProvider.of<LoginBloc>(context);

    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return Draggable(
        feedback: Container(
          width: 60.0,
          height: 60.0,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.black,
              width: 2.0,
            ),
          ),
          child: Center(
            child: Icon(
              Icons.create,
              color: Colors.black,
            ),
          ),
        ),
        childWhenDragging: Container(),
        onDragEnd: (details) {
          context
              .read<HomeBloc>()
              .add(const SelectedCategory(category: HomeCategory.wriTing));
        },
        child: Container(
          width: 55.0,
          height: 55.0,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.black,
              width: 1.5,
            ),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black.withOpacity(0.6),
            //     spreadRadius: 1,
            //     blurRadius: 0,
            //     offset: Offset(3, 3),
            //   ),
            // ],
          ),
          child: Center(
            child: Icon(
              Icons.create, // 글쓰기 아이콘
              color: Colors.black,
              size: 25,
            ),
          ),
        ),
      );
    });
  }
}
