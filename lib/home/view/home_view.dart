import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_tft/home/bloc/home_bloc.dart';
import 'package:with_tft/home/bloc/home_event.dart';
import 'package:with_tft/home/bloc/home_state.dart';
import 'package:with_tft/home/view/category_view/find_team_view.dart';
import 'package:with_tft/home/view/category_view/synergy_helper_view.dart';
import 'package:with_tft/home/view/category_view/profile_view.dart';
import 'package:with_tft/home/widget/draggable_button.dart';
import 'package:with_tft/login/bloc/login_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildCategoryButton(
                        context,
                        '팀구하기',
                        SelectedCategory(category: HomeCategory.findTeam),
                        state.status,
                      ),
                      buildCategoryButton(
                        context,
                        '시너지',
                        SelectedCategory(category: HomeCategory.synergyHelper),
                        state.status,
                      ),
                      buildCategoryButton(
                        context,
                        '프로필',
                        SelectedCategory(category: HomeCategory.profile),
                        state.status,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              // selectedCategory에 따라 다른 뷰를 보여줍니다.
              if (state.status == HomeCategory.findTeam) const FindTeamView(),
              if (state.status == HomeCategory.synergyHelper)
                const SynergyHelperView(),
              if (state.status == HomeCategory.profile) const MyProfileView(),
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

  Widget buildCategoryButton(
    BuildContext context,
    String category,
    HomeEvent event,
    HomeCategory currentStatus,
  ) {
    HomeCategory categoryEnum;
    switch (category) {
      case '팀구하기':
        categoryEnum = HomeCategory.findTeam;
        break;
      case '시너지':
        categoryEnum = HomeCategory.synergyHelper;
        break;
      case '프로필':
        categoryEnum = HomeCategory.profile;
        break;
      default:
        categoryEnum = HomeCategory.findTeam;
    }

    bool isSelected = categoryEnum == currentStatus;
    return GestureDetector(
      onTap: () {
        context.read<HomeBloc>().add(event);
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        child: Text(
          category,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
