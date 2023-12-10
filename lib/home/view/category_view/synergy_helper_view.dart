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
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        print('리스트 확인 ${state.champion}');
        return Center(
          child: Wrap(
            direction: Axis.horizontal, // 나열 방향
            alignment: WrapAlignment.start, // 정렬 방식
            spacing: 5, // 좌우 간격
            runSpacing: 5, // 상하 간격
            children: [
              Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: const Color(0xffdddddd),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Container(
                    width: 200,
                    height: 100,
                    child: Text('챔피언1'),
                  )),
              Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: const Color(0xffdddddd),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Container(
                    width: 200,
                    height: 100,
                    child: Text('챔피언1'),
                  )),
              Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: const Color(0xffdddddd),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Container(
                    width: 200,
                    height: 100,
                    child: Text('챔피언1'),
                  )),
              Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: const Color(0xffdddddd),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Container(
                    width: 200,
                    height: 100,
                    child: Text('챔피언1'),
                  )),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xffdddddd),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text('#태그55555'),
              ),
            ],
          ),
        );
      },
    );
  }
}
