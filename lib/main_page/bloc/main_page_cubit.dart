import 'package:bloc/bloc.dart';

import 'main_page_state.dart';

class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit() : super(MainPageState());

  void createGoal(bool isTap) {
    isTap = false;
    emit(state.copyWith(isTap: isTap));
  }
}