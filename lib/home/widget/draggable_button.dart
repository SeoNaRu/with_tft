import 'package:flutter/material.dart';

class DraggableButton extends StatefulWidget {
  @override
  _DraggableButtonState createState() => _DraggableButtonState();
}

class _DraggableButtonState extends State<DraggableButton> {
  @override
  Widget build(BuildContext context) {
    return Draggable(
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
        // 드래그가 끝났을 때 수행할 동작
        print('클릭');
      },
    );
  }
}
