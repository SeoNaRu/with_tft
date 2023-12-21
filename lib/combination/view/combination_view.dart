import 'package:flutter/material.dart';

class CombinationView extends StatefulWidget {
  const CombinationView({super.key});

  @override
  State<CombinationView> createState() => CcombinationViewState();
}

class CcombinationViewState extends State<CombinationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: InkWell(
            onTap: (() {
              Navigator.of(context).pop();
            }),
            child: Row(
              children: [
                Icon(
                  Icons.keyboard_arrow_left,
                  color: Colors.black,
                  size: 30.0,
                ),
                Text(
                  '조합',
                  style: TextStyle(
                    fontFamily: 'BeaufortforLOL',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Container());
  }
}
