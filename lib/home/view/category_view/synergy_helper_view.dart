import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_tft/home/bloc/home_bloc.dart';
import 'package:with_tft/home/bloc/home_state.dart';
import 'package:with_tft/home/widget/get_most_frequent_color.dart';

class SynergyHelperView extends StatefulWidget {
  const SynergyHelperView({super.key});

  @override
  State<SynergyHelperView> createState() => _SynergyHelperViewState();
}

class _SynergyHelperViewState extends State<SynergyHelperView> {
  Color? mostFrequentColor;

  @override
  void initState() {
    super.initState();
    _loadColor();
  }

  Future<void> _loadColor() async {
    Color color =
        await getMostFrequentColor('assets/tft_champions/TFT10_Yorick.png');
    setState(() {
      mostFrequentColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: state.champion.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Container(
                  width: 50, // 각 이미지 아이템의 너비
                  child: Image.asset(
                      'assets/tft_champions/${state.champion[index].id}.png',
                      fit: BoxFit.cover),
                ),
                SizedBox(
                  width: 10,
                )
              ],
            );
          },
        ),
      );
    });
  }
}
