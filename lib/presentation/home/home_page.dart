import 'package:f/main_page/bloc/main_page_cubit.dart';
import 'package:f/presentation/training_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../custom_nav_bar.dart';
import '../../main_page/main_page.dart';
import 'bloc/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Navigator(
              onGenerateRoute: (route) =>
                  MaterialPageRoute(
                      settings: route,
                      builder: (context) =>
                          BlocBuilder<HomeCubit, HomeState>(
                            builder: (context, state) {
                              return switch (state.index) {
                                0 => BlocProvider(
                                  create: (context) => MainPageCubit(),
                                  child: const MainPage(),
                                ),
                                1 => const TrainingPage(),
                                2 => const MainPage(),
                                3 => const TrainingPage(),
                                _ => const SizedBox()
                              };
                            },
                          )
                  ),
            ),
            const CustomNavBar()
          ],
        ),
      ),
    );
  }
}
