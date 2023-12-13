import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_tft/home/bloc/home_bloc.dart';
import 'package:with_tft/home/bloc/home_state.dart';

class SynergyHelperView extends StatefulWidget {
  const SynergyHelperView({super.key});

  @override
  State<SynergyHelperView> createState() => _SynergyHelperViewState();
}

class _SynergyHelperViewState extends State<SynergyHelperView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      print('리스트 확인 ${state.champion}');
      return SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: state.champion.length,
          itemBuilder: (context, index) {
            return Container(
              width: 100, // 각 이미지 아이템의 너비
              child: Image.asset(
                  'assets/tft_champions/${state.champion[index].id}.png',
                  fit: BoxFit.cover),
            );
          },
        ),
      );
    });
  }
}
