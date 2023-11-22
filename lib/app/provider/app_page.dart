import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_tft/app/app_view.dart';
import 'package:with_tft/login/bloc/login_bloc.dart';

class AppPage extends StatefulWidget {
  const AppPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        // BlocProvider(
        //   create: (context) => TestBloc(),
        // ),
      ],
      child: const AppView(),
    );
  }
}
