import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_tft/home/view/home_view.dart';
import 'package:with_tft/login/bloc/login_bloc.dart';
import 'package:with_tft/login/bloc/login_event.dart';
import 'package:with_tft/login/bloc/login_state.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController tec = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status == AuthenticationStatus.authenticated) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomeView(), // 다음 화면으로 이동
            ),
          );
        } else if (state.status == AuthenticationStatus.unauthenticated) {
          const snackBar = SnackBar(
            content: Text(
              '닉네임 확인해주세요',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            backgroundColor: Color(0xFF1b1b23),
            behavior: SnackBarBehavior.floating,
          );
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('WITH TFT'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Column(
                  children: [
                    Text(
                      'TFT 동료 찾기 - 함께 전략전을 즐기세요!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold, // 볼드체
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                TextField(
                  controller: tec,
                  decoration: const InputDecoration(
                    labelText: 'Riot ID',
                    hintText: '닉네임을 입력해주세요.',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(width: 1, color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(width: 1, color: Colors.black),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<LoginBloc>()
                        .add((RiotSummonerName(nickName: tec.text)));
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
                        '닉네임 조회',
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
        );
      }),
    );
  }
}
