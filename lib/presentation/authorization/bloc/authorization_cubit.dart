import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part 'authorization_state.dart';

class AuthorizationCubit extends Cubit<AuthorizationState> {
  AuthorizationCubit() : super(AuthorizationState());

  void obscureText(bool obsText) {
    obsText = !obsText;
    emit(state.copyWith(obscureText: obsText));
  }

  void text(TextEditingController? controller) {

    emit(state.copyWith(loginController: controller));
  }

  void focused(bool focus) {
    focus = true;
    emit(state.copyWith(isFocused: focus));
  }

  void unFocused(bool unFocus) {
    unFocus = false;
    emit(state.copyWith(isFocused: unFocus));
  }
}