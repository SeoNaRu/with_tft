import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_tft/home/bloc/home_bloc.dart';
import 'package:with_tft/home/bloc/home_event.dart';
import 'package:with_tft/home/bloc/home_state.dart';
import 'package:with_tft/home/view/category_view/find_team_view.dart';
import 'package:with_tft/home/view/category_view/synergy_helper_view.dart';
import 'package:with_tft/home/view/category_view/profile_view.dart';
import 'package:with_tft/home/view/category_view/writing_view.dart';
import 'package:with_tft/home/widget/category_button.dart';
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
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Text(
                    BlocProvider.of<LoginBloc>(context).state.user.name,
                    style: const TextStyle(
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  width: double.infinity,
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
                          child: Center(
                              child: Text(
                            '글쓰기 닫기',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          )),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            categoryButton(
                              context,
                              '동료찾기',
                              const SelectedCategory(
                                  category: HomeCategory.findTeam),
                              state.status,
                            ),
                            categoryButton(
                              context,
                              '시너지',
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
              SizedBox(height: 20),
              if (state.status == HomeCategory.findTeam) const FindTeamView(),
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
