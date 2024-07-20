import 'package:f/core/network_client.dart';
import 'package:f/core/storage_service.dart';
import 'package:f/presentation/authorization/authorization_page.dart';
import 'package:f/presentation/authorization/bloc/authorization_cubit.dart';
import 'package:f/presentation/error/error_page.dart';
import 'package:f/presentation/home/home_page.dart';
import 'package:f/presentation/main_page/widgets/story_page.dart';
import 'package:f/presentation/new_goal/new_goal.dart';
import 'package:f/presentation/update/update_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'core/models/version_model.dart';

Future<bool> getHealthCheck() async {
  try {
    final INetworkClient networkClient = INetworkClient();
    return (await networkClient.get('healthcheck'))['success'];
  } catch (e) {
    return false;
  }
}

Future<List<VersionModel>> getVersions() async {
  try {
    final INetworkClient networkClient = INetworkClient();
    final Map<String, dynamic> versionMap = await networkClient.get('versions');
    return await versionMap['versions'].map<VersionModel>((json) =>
        VersionModel.fromJson(json)).toList();
  } catch (e) {
    return [];
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool healthCheck = await getHealthCheck();
  List<VersionModel> versions = await getVersions();
  if(healthCheck == false && versions.isEmpty) {
    runApp(
        const MyApp(path: '/error')
    );
  } else {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    int version = int.parse(packageInfo.version.replaceAll('.', ''));
    bool isUpdate = false;
    for(int i = 0; i<versions.length; i++) {
      if(int.parse(versions[i].version.replaceAll('.', '')) > version && versions[i].isUpdate) {
        runApp(
            const MyApp(path: '/update')
        );
        isUpdate = true;
      }
      break;
    }
    if(isUpdate == false) {
      final IStorageService _storageService = IStorageService();
      final String? token = await _storageService.getToken();
      runApp(
          MyApp(token: token, path: '/')
      );
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.token, required this.path});

  final String? token;
  final String path;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(
        initialLocation: token == null ? path : '/home',
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
            path: '/update',
            builder: (context, state) => const UpdatePage(),
          ),
          GoRoute(
            path: '/error',
            builder: (context, state) => const ErrorPage(),
          ),
          GoRoute(
              path: '/story',
              builder: (context, state) {
                final arguments = state.extra as Map<String, dynamic>;
                return StoryPage(
                    stories: arguments['stories'],
                    index: arguments['index']
                );
              }
          )
        ],
      ),
    );
  }
}
