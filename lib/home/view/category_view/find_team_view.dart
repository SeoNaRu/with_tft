import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_tft/login/bloc/login_bloc.dart';

class FindTeamView extends StatefulWidget {
  const FindTeamView({super.key});

  @override
  State<FindTeamView> createState() => _FindTeamViewState();
}

class _FindTeamViewState extends State<FindTeamView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 13),
              width: double.infinity,
              height: 200.0,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.8),
                    spreadRadius: 2, // 그림자 크기
                    blurRadius: 0, // 블러
                    offset: Offset(5, 6), // 그림자의 위치 (가로, 세로)
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Container(
                        width: 150,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '닉네임 : 설명1',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text('티어 : 설명1',
                            style: Theme.of(context).textTheme.bodyMedium),
                        Text('게임 종류 : 설명1',
                            style: Theme.of(context).textTheme.bodyMedium),
                        Text('음성 : 설명1',
                            style: Theme.of(context).textTheme.bodyMedium),
                        Text('구하는 인원 : 3 / 8',
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
