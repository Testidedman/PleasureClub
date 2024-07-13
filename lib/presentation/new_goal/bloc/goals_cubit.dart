import 'package:bloc/bloc.dart';

part 'goals_state.dart';

class GoalsCubit extends Cubit<GoalsState> {
  GoalsCubit() : super(GoalsState());
}
