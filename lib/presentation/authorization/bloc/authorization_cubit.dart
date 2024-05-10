import 'package:bloc/bloc.dart';
import 'package:f/core/network_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'authorization_state.dart';

class AuthorizationCubit extends Cubit<AuthorizationState> {
  AuthorizationCubit() : super(AuthorizationState());

  final _networkClient = INetworkClient();

  void obscureText(bool obsText) {
    obsText = !obsText;
    emit(state.copyWith(obscureText: obsText));
  }

  void checkOnTap(String password, String login) {
    if (password.trim().isEmpty || login.trim().isEmpty) {
      emit(state.copyWith(isOnTap: false));
    } else {
      emit(state.copyWith(isOnTap: true));
    }
  }

  void focusedColor(Color color) {
    color = const Color(0xff1B1B1B);
    emit(state.copyWith(sufColor: color));
  }

  void unFocusedColor(Color color) {
    color = const Color(0xffD4D4D4);
    emit(state.copyWith(sufColor: color));
  }

  Future<bool> authorization(String login, String password) async {
    emit(state.copyWith(isLoading: true));
    final body = await _networkClient.post(
        'auth/registration',
        {
          'email':login,
          'password':password,
          'role': 'user'
        }
    );
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('access_token', body['access_token']);
    prefs.setString('refresh_token', body['refresh_token']);
    return true;
  }
}
