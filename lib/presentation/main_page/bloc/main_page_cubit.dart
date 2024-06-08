import 'package:bloc/bloc.dart';
import 'package:f/presentation/main_page/main_services.dart';

import '../../../core/network_client.dart';
import '../models/story_model.dart';
import 'main_page_state.dart';

class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit() : super(MainPageState());

  final IMainService _mainService = IMainService();

  void createGoal(bool isTap) {
    emit(state.copyWith(isTap: false));
  }

  void getStories() async {
    emit(state.copyWith(isLoading: true));
    final stories = await _mainService.getStories();
    emit(state.copyWith(stories: stories, isLoading: false));
  }
}