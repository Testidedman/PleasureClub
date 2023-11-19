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

  // void text(TextEditingController? controller) {
  //
  //   emit(state.copyWith(loginController: controller));
  // }

  void focusedColor(Color color){
    color = const Color(0xff1B1B1B);
    emit(state.copyWith(sufColor: color));
  }

  void unFocusedColor(Color color){
    color = const Color(0xffD4D4D4);
    emit(state.copyWith(sufColor: color));
  }

}