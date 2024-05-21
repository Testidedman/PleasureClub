import 'package:bloc/bloc.dart';
import 'package:f/core/storage_service.dart';
import 'package:f/presentation/authorization/authorization_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part 'authorization_state.dart';

class AuthorizationCubit extends Cubit<AuthorizationState> {
  AuthorizationCubit() : super(AuthorizationState());

  final IAuthorizationService _authorizationService = IAuthorizationService();
  final _storageService = IStorageService();

  void obscureText(bool obsText) {
    emit(state.copyWith(obscureText: !state.obscureText));
  }

  void checkOnTap(String password, String login) {
    emit(state.copyWith(isOnTap: !(password.trim().isEmpty || login.trim().isEmpty)));
  }

  void focusedColor(Color color) {
    emit(state.copyWith(sufColor: const Color(0xff1B1B1B)));
  }

  void unFocusedColor(Color color) {
    emit(state.copyWith(sufColor: const Color(0xffD4D4D4)));
  }

  Future<bool> authorization(String login, String password) async {
    emit(state.copyWith(isLoading: true));
    final body = await _authorizationService.registration(login, password);
    await _storageService.setToken(body['access_token'], body['refresh_token']);
    return true;
  }
}
