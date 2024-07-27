part of 'goals_cubit.dart';

class GoalsState {
  GoalsState({
    this.isLoading = false
  });

  final bool isLoading;

  GoalsState copyWith({bool? isLoading}) {
    return GoalsState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}