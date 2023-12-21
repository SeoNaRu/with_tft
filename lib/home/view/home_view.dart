import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_tft/home/bloc/home_bloc.dart';
import 'package:with_tft/home/bloc/home_event.dart';
import 'package:with_tft/home/bloc/home_state.dart';
import 'package:with_tft/home/view/category_view/find_duo_view,.dart';
import 'package:with_tft/home/view/category_view/find_team_view.dart';
import 'package:with_tft/home/view/category_view/synergy_helper_view.dart';
import 'package:with_tft/home/view/category_view/profile_view.dart';
import 'package:with_tft/home/view/category_view/writing_view.dart';
import 'package:with_tft/home/widget/category_button.dart';
import 'package:with_tft/home/widget/combination_button.dart';
import 'package:with_tft/home/widget/cost_check_button.dart';
import 'package:with_tft/home/widget/draggable_button.dart';
import 'package:with_tft/login/bloc/login_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Text(
              'WITH TFT',
              style: TextStyle(
                fontFamily: 'BeaufortforLOL',
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Text(
                  BlocProvider.of<LoginBloc>(context).state.user.name,
                  style: const TextStyle(
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis,
                    fontFamily: 'BeaufortforLOL',
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              SizedBox(height: 10),
              Container(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
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
                        spreadRadius: 1,
                        blurRadius: 0,
                        offset: Offset(5, 6),
                      ),
                    ],
                  ),
                  child: state.status == HomeCategory.writing
                      ? InkWell(
                          onTap: () {
                            context.read<HomeBloc>().add(const SelectedCategory(
                                category: HomeCategory.findTeam));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              '글쓰기 닫기',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            )),
                          ),
                        )
                      : state.status == HomeCategory.synergyHelper
                          ? Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      combinationButton(
                                        context,
                                        '조합',
                                        const SelectedCategory(
                                            category:
                                                HomeCategory.synergyHelper),
                                        state.status,
                                      ),
                                      combinationButton(
                                        context,
                                        '홈',
                                        const SelectedCategory(
                                            category: HomeCategory.findTeam),
                                        state.status,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 1,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      costCheckButton(
                                        context,
                                        '1코',
                                        const SelectedCost(
                                            championCost: ChampionCost.one),
                                        state.championCost,
                                      ),
                                      costCheckButton(
                                        context,
                                        '2코',
                                        const SelectedCost(
                                            championCost: ChampionCost.two),
                                        state.championCost,
                                      ),
                                      costCheckButton(
                                        context,
                                        '3코',
                                        const SelectedCost(
                                            championCost: ChampionCost.three),
                                        state.championCost,
                                      ),
                                      costCheckButton(
                                        context,
                                        '4코',
                                        const SelectedCost(
                                            championCost: ChampionCost.four),
                                        state.championCost,
                                      ),
                                      costCheckButton(
                                        context,
                                        '5코',
                                        const SelectedCost(
                                            championCost: ChampionCost.five),
                                        state.championCost,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  categoryButton(
                                    context,
                                    '동료 찾기',
                                    const SelectedCategory(
                                        category: HomeCategory.findTeam),
                                    state.status,
                                  ),
                                  categoryButton(
                                    context,
                                    '듀오 찾기',
                                    const SelectedCategory(
                                        category: HomeCategory.findDuo),
                                    state.status,
                                  ),
                                  categoryButton(
                                    context,
                                    '조합',
                                    const SelectedCategory(
                                        category: HomeCategory.synergyHelper),
                                    state.status,
                                  ),
                                  categoryButton(
                                    context,
                                    '프로필',
                                    const SelectedCategory(
                                        category: HomeCategory.profile),
                                    state.status,
                                  ),
                                ],
                              ),
                            ),
                ),
              ),
              SizedBox(height: 20),
              if (state.status == HomeCategory.findTeam) const FindTeamView(),
              if (state.status == HomeCategory.findDuo) const FindDuoView(),
              if (state.status == HomeCategory.synergyHelper)
                const SynergyHelperView(),
              if (state.status == HomeCategory.profile) const MyProfileView(),
              if (state.status == HomeCategory.writing) const WritingView(),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton:
              state.status == HomeCategory.findTeam ? DraggableButton() : null,
        );
      },
    );
  }
}
