class MainPageState {
  MainPageState({
    this.isTap = true
  });

  final bool isTap;

  MainPageState copyWith({bool? isTap}) {
    return MainPageState(
        isTap: isTap ?? this.isTap
    );
  }
}
