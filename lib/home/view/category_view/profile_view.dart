import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_tft/home/bloc/home_bloc.dart';
import 'package:with_tft/home/bloc/home_event.dart';
import 'package:with_tft/home/bloc/home_state.dart';
import 'package:with_tft/home/widget/age_category_button.dart';
import 'package:with_tft/home/widget/duo_type_button.dart';
import 'package:with_tft/home/widget/gender_button.dart';
import 'package:with_tft/home/widget/my_voice_check_button.dart';
import 'package:with_tft/home/widget/play_style_button.dart';
import 'package:with_tft/home/widget/play_time_button.dart';
import 'package:with_tft/home/widget/user_visible_button.dart';
import 'package:with_tft/login/bloc/login_bloc.dart';
import 'package:with_tft/login/view/login_view.dart';

class MyProfileView extends StatefulWidget {
  const MyProfileView({super.key});

  @override
  State<MyProfileView> createState() => _MyProfileViewState();
}

class _MyProfileViewState extends State<MyProfileView> {
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      final loginBloc = BlocProvider.of<LoginBloc>(context);
      return Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 프로필 사진

              Container(
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
                      spreadRadius: 2,
                      blurRadius: 0,
                      offset: Offset(5, 6),
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
                          Text(loginBloc.state.user.name),
                          Text(
                            ' #${loginBloc.state.user.lingTag}',
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
                      TextField(
                        controller: descriptionController,
                        maxLength: 20,
                        decoration: const InputDecoration(
                          // labelText: '한줄 소개',
                          hintText: '한줄 소개 해주세요.!(20 글자) ',
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(width: 2, color: Colors.black),
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
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
                                Text('나이 : ${state.stringAgeCategory}',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium),
                                Text('성별 : ${state.stringGender}',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium),
                                state.myVoiceCheck
                                    ? Text('음성 : ON',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium)
                                    : Text('음성 : OFF',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('플레이 : ${state.stringPlayStyle}',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium),
                                Text('플레이 시간: ${state.stringPlayTime}',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium),
                                Text('듀오 스타일: ${state.stringDuoType}',
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
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 40),
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
                            ageCategoryButton(
                                context,
                                '성인',
                                const SelectedAgeCategory(
                                  ageCategory: AgeCategory.minor,
                                  stringAgeCategory: '성인',
                                ),
                                state.ageCategory),
                            ageCategoryButton(
                                context,
                                '청소년',
                                const SelectedAgeCategory(
                                  ageCategory: AgeCategory.adult,
                                  stringAgeCategory: '청소년',
                                ),
                                state.ageCategory),
                            ageCategoryButton(
                                context,
                                '비밀',
                                const SelectedAgeCategory(
                                  ageCategory: AgeCategory.secret,
                                  stringAgeCategory: '비밀',
                                ),
                                state.ageCategory),
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
                            genderButton(
                                context,
                                '남성',
                                const SelectedGender(
                                  gender: Gender.male,
                                  stringGender: '남성',
                                ),
                                state.gender),
                            genderButton(
                                context,
                                '여성',
                                const SelectedGender(
                                  gender: Gender.female,
                                  stringGender: '여성',
                                ),
                                state.gender),
                            genderButton(
                                context,
                                '비밀',
                                const SelectedGender(
                                  gender: Gender.secret,
                                  stringGender: '비밀',
                                ),
                                state.gender),
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
                            myVoiceCheckButton(
                                context,
                                'ON',
                                const SelectedMyVocieCheck(
                                  myVoiceCheck: true,
                                ),
                                state.myVoiceCheck),
                            myVoiceCheckButton(
                                context,
                                'OFF',
                                const SelectedMyVocieCheck(
                                  myVoiceCheck: false,
                                ),
                                !state.myVoiceCheck),
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
                            playStyleButton(
                                context,
                                '즐겜',
                                const SelectedPlayStyle(
                                    playStyle: PlayStyle.fun,
                                    stringPlayStyle: "즐겜"),
                                state.playStyle),
                            playStyleButton(
                                context,
                                '빡겜',
                                const SelectedPlayStyle(
                                    playStyle: PlayStyle.faceKeeping,
                                    stringPlayStyle: "빡겜"),
                                state.playStyle),
                            playStyleButton(
                                context,
                                '리롤',
                                const SelectedPlayStyle(
                                    playStyle: PlayStyle.reroll,
                                    stringPlayStyle: "리롤"),
                                state.playStyle),
                            playStyleButton(
                                context,
                                '렙업',
                                const SelectedPlayStyle(
                                    playStyle: PlayStyle.levelUp,
                                    stringPlayStyle: "렙업"),
                                state.playStyle),
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
                                '플레이 시간',
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
                            playTimeButton(
                                context,
                                '아침',
                                const SelectedPlayTime(
                                  playTime: PlayTime.morning,
                                  stringPlayTime: '아침',
                                ),
                                state.playTime),
                            playTimeButton(
                                context,
                                '점심',
                                const SelectedPlayTime(
                                  playTime: PlayTime.lunch,
                                  stringPlayTime: '점심',
                                ),
                                state.playTime),
                            playTimeButton(
                                context,
                                '저녁',
                                const SelectedPlayTime(
                                  playTime: PlayTime.night,
                                  stringPlayTime: '저녁',
                                ),
                                state.playTime),
                          ],
                        ),
                        Row(
                          children: [
                            playTimeButton(
                                context,
                                '평일',
                                const SelectedPlayTime(
                                  playTime: PlayTime.weekday,
                                  stringPlayTime: '평일',
                                ),
                                state.playTime),
                            playTimeButton(
                                context,
                                '주말',
                                const SelectedPlayTime(
                                  playTime: PlayTime.weekend,
                                  stringPlayTime: '주말',
                                ),
                                state.playTime),
                            playTimeButton(
                                context,
                                '랜덤',
                                const SelectedPlayTime(
                                  playTime: PlayTime.random,
                                  stringPlayTime: '랜덤',
                                ),
                                state.playTime),
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
                                '듀오 스타일',
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
                            duoTypeButton(
                                context,
                                '랭크 듀오',
                                const SelectedDuoType(
                                    duoType: DuoType.rankDuo,
                                    stringDuoType: "랭크 듀오"),
                                state.duoType),
                            duoTypeButton(
                                context,
                                '일반 파티',
                                const SelectedDuoType(
                                    duoType: DuoType.gamingParty,
                                    stringDuoType: "일반 파티"),
                                state.duoType),
                          ],
                        ),
                        Row(
                          children: [
                            duoTypeButton(
                                context,
                                '여성 구함',
                                const SelectedDuoType(
                                    duoType: DuoType.femaleSeeking,
                                    stringDuoType: "여성 구함"),
                                state.duoType),
                            duoTypeButton(
                                context,
                                '남성 구함',
                                const SelectedDuoType(
                                    duoType: DuoType.maleSeeking,
                                    stringDuoType: "남성 구함"),
                                state.duoType),
                          ],
                        ),
                        Row(
                          children: [
                            duoTypeButton(
                                context,
                                '스승 찾기',
                                const SelectedDuoType(
                                    duoType: DuoType.mentorSeeking,
                                    stringDuoType: "스승 찾기"),
                                state.duoType),
                            duoTypeButton(
                                context,
                                '제자 찾기',
                                const SelectedDuoType(
                                    duoType: DuoType.studentSeeking,
                                    stringDuoType: "제자 찾기"),
                                state.duoType),
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
                                '공개 설정',
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
                            userVisibleButton(
                                context,
                                'ON',
                                const SelectedUserVisible(
                                  userVisible: true,
                                ),
                                state.isUserDetailVisible),
                            userVisibleButton(
                                context,
                                'OFF',
                                const SelectedUserVisible(
                                  userVisible: false,
                                ),
                                !state.isUserDetailVisible),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (descriptionController.text == '') {
                              const snackBar = SnackBar(
                                content: Text(
                                  '한줄 소개 작성해주세요!',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                                backgroundColor: Color(0xFF1b1b23),
                                behavior: SnackBarBehavior.floating,
                              );
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              context.read<HomeBloc>().add((SaveUserProfile(
                                    nickName: loginBloc.state.user.name,
                                    lineTag: loginBloc.state.user.lingTag,
                                    puuid: loginBloc.state.user.puuid,
                                    description: descriptionController.text,
                                    tier: loginBloc.state.tier.tier,
                                  )));
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(20), // 라운드 없애기
                              ),
                            ),
                            // 다른 스타일 속성들도 추가 가능
                          ),
                          child: const SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: Center(
                              child: Text(
                                '저장 하기',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold, // 볼드체
                                  fontSize: 16, // 크기 조정
                                  // 다른 스타일 속성들도 추가 가능
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginView()),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.grey;
                                }
                                return Color(0xFF800000);
                              },
                            ),

                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            // 다른 스타일 속성들도 추가 가능
                          ),
                          child: const SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: Center(
                              child: Text(
                                '로그 아웃',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
