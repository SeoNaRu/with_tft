import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_tft/home/bloc/home_bloc.dart';
import 'package:with_tft/home/bloc/home_event.dart';
import 'package:with_tft/home/bloc/home_state.dart';
import 'package:with_tft/home/widget/game_type_button.dart';
import 'package:with_tft/home/widget/personnel_check_button.dart';
import 'package:with_tft/home/widget/voice_check_button.dart';
import 'package:with_tft/login/bloc/login_bloc.dart';

class WritingView extends StatefulWidget {
  const WritingView({super.key});

  @override
  State<WritingView> createState() => _WritingViewState();
}

class _WritingViewState extends State<WritingView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      final loginBloc = BlocProvider.of<LoginBloc>(context);
      return Align(
          alignment: Alignment.center,
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 13),
            width: double.infinity,
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
              padding: const EdgeInsets.all(17),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                          width: double.infinity - 4,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          child: Center(
                              child: Text(
                            '게임 종류',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ))),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        gameTypeButton(
                            context,
                            '일반',
                            const SelectedGameType(
                                gameTypesCategory: GameTypes.normal,
                                stringGameTypesStatus: '일반'),
                            state.gameTypesStatus,
                            state.personnelStatus),
                        gameTypeButton(
                            context,
                            '랭크',
                            const SelectedGameType(
                                gameTypesCategory: GameTypes.ranked,
                                stringGameTypesStatus: '랭크'),
                            state.gameTypesStatus,
                            state.personnelStatus),
                      ],
                    ),
                    Row(
                      children: [
                        gameTypeButton(
                            context,
                            '더블업',
                            const SelectedGameType(
                                gameTypesCategory: GameTypes.doubleUp,
                                stringGameTypesStatus: '더블업'),
                            state.gameTypesStatus,
                            state.personnelStatus),
                        gameTypeButton(
                            context,
                            '초고속',
                            const SelectedGameType(
                                gameTypesCategory: GameTypes.turbo,
                                stringGameTypesStatus: '초고속'),
                            state.gameTypesStatus,
                            state.personnelStatus),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                          width: double.infinity - 4,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          child: Center(
                              child: Text(
                            '음성',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ))),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        voiceCheckButton(
                            context,
                            'ON',
                            const SelectedVocieCheck(
                                voiceCheck: VoiceCheck.on,
                                stringVoiceStatus: "ON"),
                            state.voiceStatus),
                        voiceCheckButton(
                            context,
                            'OFF',
                            const SelectedVocieCheck(
                                voiceCheck: VoiceCheck.off,
                                stringVoiceStatus: "OFF"),
                            state.voiceStatus),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                          width: double.infinity - 4,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          child: Center(
                              child: Text(
                            '인원',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ))),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    state.gameTypesStatus == GameTypes.ranked
                        ? Row(
                            children: [
                              personnelCheckButton(
                                  context,
                                  '1',
                                  const SelectedPersonnelCheck(
                                      personnelCheck: PersonnelCheck.one,
                                      stringPersonnelStatus: "1"),
                                  state.personnelStatus),
                              personnelCheckButton(
                                  context,
                                  '2',
                                  const SelectedPersonnelCheck(
                                      personnelCheck: PersonnelCheck.two,
                                      stringPersonnelStatus: "2"),
                                  state.personnelStatus),
                            ],
                          )
                        : Row(
                            children: [
                              personnelCheckButton(
                                  context,
                                  '1',
                                  const SelectedPersonnelCheck(
                                      personnelCheck: PersonnelCheck.one,
                                      stringPersonnelStatus: "1"),
                                  state.personnelStatus),
                              personnelCheckButton(
                                  context,
                                  '2',
                                  const SelectedPersonnelCheck(
                                      personnelCheck: PersonnelCheck.two,
                                      stringPersonnelStatus: "2"),
                                  state.personnelStatus),
                              personnelCheckButton(
                                  context,
                                  '3',
                                  const SelectedPersonnelCheck(
                                      personnelCheck: PersonnelCheck.three,
                                      stringPersonnelStatus: "3"),
                                  state.personnelStatus),
                              personnelCheckButton(
                                  context,
                                  '4',
                                  const SelectedPersonnelCheck(
                                      personnelCheck: PersonnelCheck.four,
                                      stringPersonnelStatus: "4"),
                                  state.personnelStatus),
                              personnelCheckButton(
                                  context,
                                  '5',
                                  const SelectedPersonnelCheck(
                                      personnelCheck: PersonnelCheck.five,
                                      stringPersonnelStatus: "5"),
                                  state.personnelStatus),
                              personnelCheckButton(
                                  context,
                                  '6',
                                  const SelectedPersonnelCheck(
                                      personnelCheck: PersonnelCheck.six,
                                      stringPersonnelStatus: "6"),
                                  state.personnelStatus),
                              personnelCheckButton(
                                  context,
                                  '7',
                                  const SelectedPersonnelCheck(
                                      personnelCheck: PersonnelCheck.seven,
                                      stringPersonnelStatus: "7"),
                                  state.personnelStatus),
                            ],
                          ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<HomeBloc>()
                          ..add(const SelectedCategory(
                              category: HomeCategory.findTeam))
                          ..add(PostWritingBoard(
                              puuid: loginBloc.state.user.puuid,
                              lineTag: loginBloc.state.user.lingTag,
                              nickName: loginBloc.state.user.name,
                              tier: loginBloc.state.tier.tier));
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // 라운드 없애기
                          ),
                        ),
                        // 다른 스타일 속성들도 추가 가능
                      ),
                      child: const SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: Center(
                          child: Text(
                            '등록하기',
                            style: TextStyle(
                              fontWeight: FontWeight.bold, // 볼드체
                              fontSize: 16, // 크기 조정
                              // 다른 스타일 속성들도 추가 가능
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
    });
  }
}
