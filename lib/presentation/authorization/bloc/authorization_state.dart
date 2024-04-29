part of 'authorization_cubit.dart';

class AuthorizationState {
  AuthorizationState(
      {this.obscureText = true,
      this.isOnTap = false,
      this.sufColor = const Color(0xffD4D4D4)});

  final bool obscureText;
  final bool isOnTap;
  final Color sufColor;

  AuthorizationState copyWith(
      {bool? obscureText, bool? isOnTap, Color? sufColor,}) {
    return AuthorizationState(
        obscureText: obscureText ?? this.obscureText,
        isOnTap: isOnTap ?? this.isOnTap,
        sufColor: sufColor ?? this.sufColor,
    );
  }
}
