import 'package:f/presentation/training_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../custom_nav_bar.dart';
import '../main_page.dart';
import 'bloc/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage ({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => HomeCubit(),
  child: Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Navigator(
            onGenerateRoute: (route) => MaterialPageRoute(
                settings: route,
                builder: (context) => BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return switch (state.index) {
                      0 => MainPage(),
                      1 => TrainingPage(),
                      2 => MainPage(),
                      3 => TrainingPage(),
                      _ => SizedBox()
                    };
                  },
                )
            ),
          ),
          CustomNavBar()
        ],
      ),
    ),
);
  }
}
