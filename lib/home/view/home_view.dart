import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletons/skeletons.dart';
import 'package:with_tft/login/bloc/login_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('WITH TFT'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Text(
                loginBloc.state.user.name,
                style: const TextStyle(
                    fontSize: 18, overflow: TextOverflow.ellipsis),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(),
        ],
      ),
    );
  }
}
