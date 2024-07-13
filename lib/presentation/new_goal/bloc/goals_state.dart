part of 'goals_cubit.dart';

class GoalsState {
  GoalsState({
    this.priority = 'whatever'
  });

  final String priority;

  GoalsState copyWith(String? priority) {
    return GoalsState(
        priority: priority ?? this.priority,
    );
  }
}
