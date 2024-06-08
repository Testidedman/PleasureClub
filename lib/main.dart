import 'package:f/core/storage_service.dart';
import 'package:f/presentation/authorization/authorization_page.dart';
import 'package:f/presentation/authorization/bloc/authorization_cubit.dart';
import 'package:f/presentation/home/home_page.dart';
import 'package:f/presentation/main_page/widgets/story_page.dart';
import 'package:f/presentation/new_goal/new_goal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final IStorageService _storageService = IStorageService();
  final String? token = await _storageService.getToken();
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
          GoRoute(
            path: '/new_goal',
            builder: (context, state) => const NewGoal(),
          ),
          GoRoute(
              path: '/story',
            builder: (context, state) => const StoryPage()
          )
        ],
      ),
    );
  }
}
