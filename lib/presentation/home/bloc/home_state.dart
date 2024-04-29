part of 'home_cubit.dart';

class HomeState {
  HomeState({
    this.index = 0,
    this.isVisible = false
});

  final int index;
  final bool isVisible;

  HomeState copyWith({int? index, bool? isVisible}) {
    return HomeState(
      index: index ?? this.index,
      isVisible: isVisible ?? this.isVisible
    );
  }
}
