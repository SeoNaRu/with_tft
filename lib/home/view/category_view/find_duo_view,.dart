import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_tft/home/bloc/home_bloc.dart';
import 'package:with_tft/home/bloc/home_state.dart';
import 'package:with_tft/login/bloc/login_bloc.dart';

class FindDuoView extends StatefulWidget {
  const FindDuoView({super.key});

  @override
  State<FindDuoView> createState() => _FindDuoViewState();
}

class _FindDuoViewState extends State<FindDuoView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return Expanded(
        child: ListView.builder(
          controller: _scrollController,
          itemCount: state.userProfileList.length,
          itemBuilder: (context, index) {
            final reversedIndex = state.userProfileList.length - 1 - index;
            // final reversedIndex = index;

            return Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 16),
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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(state.userProfileList[reversedIndex].nickName),
                        Text(
                          ' #${state.userProfileList[reversedIndex].lineTag}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                        width: double.infinity,
                        height: 150.0,
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
                      height: 6,
                    ),
                    Text(state.userProfileList[reversedIndex].userDescription),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  '나이 : ${state.userProfileList[reversedIndex].ageCategory}',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              Text(
                                  '성별 : ${state.userProfileList[reversedIndex].gender}',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              Text(
                                  '음성 : ${state.userProfileList[reversedIndex].myVoiceCheck}',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  '플레이 : ${state.userProfileList[reversedIndex].playStyle}',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              Text(
                                  '플레이 시간: ${state.userProfileList[reversedIndex].playTime}',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              Text(
                                  '듀오 스타일: ${state.userProfileList[reversedIndex].duoType}',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Dispose할 때 컨트롤러도 해제
    super.dispose();
  }
}
