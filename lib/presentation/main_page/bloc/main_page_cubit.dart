import 'package:bloc/bloc.dart';

import '../../../core/network_client.dart';
import 'main_page_state.dart';

class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit() : super(MainPageState());

  void createGoal(bool isTap) {
    emit(state.copyWith(isTap: false));
  }

  void getStories() async {
    final INetworkClient _networkClient = INetworkClient();
    final body = await _networkClient.get('stories');
    print(body);
  }
}