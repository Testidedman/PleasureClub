import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part 'authorization_state.dart';

class AuthorizationCubit extends Cubit<AuthorizationState> {
  AuthorizationCubit() : super(AuthorizationState(
    loginController: TextEditingController(),
    passwordController: TextEditingController(),
  ));

  void obscureText(bool obsText) {
    obsText = !obsText;
    emit(state.copyWith(obscureText: obsText));
  }

  void checkOnTap() {
    if(state.passwordController.text.trim().isEmpty || state.loginController.text.trim().isEmpty) {
      emit(state.copyWith(isOnTap: false));
    } else {
      emit(state.copyWith(isOnTap: true));
    }
  }

  void focusedColor(Color color){
    color = const Color(0xff1B1B1B);
    emit(state.copyWith(sufColor: color));
  }

  void unFocusedColor(Color color){
    color = const Color(0xffD4D4D4);
    emit(state.copyWith(sufColor: color));
  }

}