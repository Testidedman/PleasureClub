part of 'authorization_cubit.dart';

class AuthorizationState {
  AuthorizationState({
    this.obscureText = true,
    this.isOnTap = false,
    this.sufColor = const Color(0xffD4D4D4),
    this.isLoading = false
  });

  final bool obscureText;
  final bool isOnTap;
  final Color sufColor;
  final bool isLoading;

  AuthorizationState copyWith({
    bool? obscureText,
    bool? isOnTap,
    Color? sufColor,
    bool? isLoading
  }) {
    return AuthorizationState(
        obscureText: obscureText ?? this.obscureText,
        isOnTap: isOnTap ?? this.isOnTap,
        sufColor: sufColor ?? this.sufColor,
        isLoading: isLoading ?? this.isLoading
    );
  }
}
