import 'package:f/presentation/authorization/authorization_page.dart';
import 'package:f/presentation/authorization/bloc/authorization_cubit.dart';
import 'package:f/presentation/home/home_page.dart';
import 'package:f/presentation/training_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) =>
          BlocProvider(
            create: (context) => AuthorizationCubit(),
            child: AuthorizationPage(),
          ),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
