import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_tft/home/bloc/home_bloc.dart';
import 'package:with_tft/home/bloc/home_event.dart';
import 'package:with_tft/home/bloc/home_state.dart';
import 'package:with_tft/home/widget/age_category_button.dart';
import 'package:with_tft/home/widget/gender_button.dart';
import 'package:with_tft/home/widget/my_voice_check_button.dart';
import 'package:with_tft/home/widget/play_style_button.dart';
import 'package:with_tft/login/bloc/login_bloc.dart';

class MyProfileView extends StatefulWidget {
  const MyProfileView({super.key});

  @override
  State<MyProfileView> createState() => _MyProfileViewState();
}

class _MyProfileViewState extends State<MyProfileView> {
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                          width: double.infinity - 4,
                          height: 40.0,
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
                            '나이',
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
                        Expanded(
                          child: ageCategoryButton(
                              context,
                              '성인',
                              const SelectedAgeCategory(
                                ageCategory: AgeCategory.minor,
                                stringAgeCategory: '성인',
                              ),
                              state.ageCategory),
                        ),
                        Expanded(
                          child: ageCategoryButton(
                              context,
                              '청소년',
                              const SelectedAgeCategory(
                                ageCategory: AgeCategory.adult,
                                stringAgeCategory: '청소년',
                              ),
                              state.ageCategory),
                        ),
                        Expanded(
                          child: ageCategoryButton(
                              context,
                              '비밀',
                              const SelectedAgeCategory(
                                ageCategory: AgeCategory.secret,
                                stringAgeCategory: '비밀',
                              ),
                              state.ageCategory),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                          width: double.infinity - 4,
                          height: 40.0,
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
                            '성별',
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
                        Expanded(
                          child: genderButton(
                              context,
                              '남성',
                              const SelectedGender(
                                gender: Gender.male,
                                stringGender: '남성',
                              ),
                              state.gender),
                        ),
                        Expanded(
                          child: genderButton(
                              context,
                              '여성',
                              const SelectedGender(
                                gender: Gender.female,
                                stringGender: '여성',
                              ),
                              state.gender),
                        ),
                        Expanded(
                          child: genderButton(
                              context,
                              '비밀',
                              const SelectedGender(
                                gender: Gender.secret,
                                stringGender: '비밀',
                              ),
                              state.gender),
                        ),
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
                        Expanded(
                          child: myVoiceCheckButton(
                              context,
                              'ON',
                              const SelectedMyVocieCheck(
                                  myVoiceCheck: MyVoiceCheck.on,
                                  stringMyVoiceCheck: "ON"),
                              state.myVoiceCheck),
                        ),
                        Expanded(
                          child: myVoiceCheckButton(
                              context,
                              'OFF',
                              const SelectedMyVocieCheck(
                                  myVoiceCheck: MyVoiceCheck.off,
                                  stringMyVoiceCheck: "OFF"),
                              state.myVoiceCheck),
                        ),
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
                            '플레이',
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
                        Expanded(
                          child: playStyleButton(
                              context,
                              '즐겜',
                              const SelectedPlayStyle(
                                  playStyle: PlayStyle.fun,
                                  stringPlayStyle: "즐겜"),
                              state.playStyle),
                        ),
                        Expanded(
                          child: playStyleButton(
                              context,
                              '빡겜',
                              const SelectedPlayStyle(
                                  playStyle: PlayStyle.faceKeeping,
                                  stringPlayStyle: "빡겜"),
                              state.playStyle),
                        ),
                        Expanded(
                          child: playStyleButton(
                              context,
                              '리롤',
                              const SelectedPlayStyle(
                                  playStyle: PlayStyle.reroll,
                                  stringPlayStyle: "리롤"),
                              state.playStyle),
                        ),
                        Expanded(
                          child: playStyleButton(
                              context,
                              '렙업',
                              const SelectedPlayStyle(
                                  playStyle: PlayStyle.levelUp,
                                  stringPlayStyle: "렙업"),
                              state.playStyle),
                        ),
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
                        Expanded(
                          child: myVoiceCheckButton(
                              context,
                              'ON',
                              const SelectedMyVocieCheck(
                                  myVoiceCheck: MyVoiceCheck.on,
                                  stringMyVoiceCheck: "ON"),
                              state.myVoiceCheck),
                        ),
                        Expanded(
                          child: myVoiceCheckButton(
                              context,
                              'OFF',
                              const SelectedMyVocieCheck(
                                  myVoiceCheck: MyVoiceCheck.off,
                                  stringMyVoiceCheck: "OFF"),
                              state.myVoiceCheck),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: myVoiceCheckButton(
                              context,
                              'ON',
                              const SelectedMyVocieCheck(
                                  myVoiceCheck: MyVoiceCheck.on,
                                  stringMyVoiceCheck: "ON"),
                              state.myVoiceCheck),
                        ),
                        Expanded(
                          child: myVoiceCheckButton(
                              context,
                              'OFF',
                              const SelectedMyVocieCheck(
                                  myVoiceCheck: MyVoiceCheck.off,
                                  stringMyVoiceCheck: "OFF"),
                              state.myVoiceCheck),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: myVoiceCheckButton(
                              context,
                              'ON',
                              const SelectedMyVocieCheck(
                                  myVoiceCheck: MyVoiceCheck.on,
                                  stringMyVoiceCheck: "ON"),
                              state.myVoiceCheck),
                        ),
                        Expanded(
                          child: myVoiceCheckButton(
                              context,
                              'OFF',
                              const SelectedMyVocieCheck(
                                  myVoiceCheck: MyVoiceCheck.off,
                                  stringMyVoiceCheck: "OFF"),
                              state.myVoiceCheck),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ));
    });
  }
}
