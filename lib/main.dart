import 'package:f/presentation/authorization/authorization_page.dart';
import 'package:f/presentation/authorization/bloc/authorization_cubit.dart';
import 'package:f/presentation/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  ///TODO: Если я зареган блять а надо выйти
  //prefs.clear();
  final String? token = prefs.getString('access_token');
  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.token});

  final String? token;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(
        initialLocation: token == null ? '/' : '/home',
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) =>
                BlocProvider(
                  create: (context) => AuthorizationCubit(),
                  child: const AuthorizationPage(),
                ),
          ),
          GoRoute(
            path: '/home',
            builder: (context, state) => const HomePage(),
          ),
        ],
      ),
    );
  }
}
