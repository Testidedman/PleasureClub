import 'package:f/presentation/new_goal/goal_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'goals_state.dart';

class GoalsCubit extends Cubit<GoalsState> {
  GoalsCubit() : super(GoalsState());

  final ITargetService _targetService = ITargetService();

  Future<void> createGoal(String targetName, String description, double sliderValue) async {
    try {
      String priority = 'Не важно';
      switch (sliderValue) {
        case 0:
          priority = 'Не важно';
        case 50:
          priority = 'Нормально';
        case 100:
          priority = 'Важно';
      }
      emit(state.copyWith(isLoading: true));
      await _targetService.createGoal(targetName, description, priority);
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      rethrow;
    }
  }
}