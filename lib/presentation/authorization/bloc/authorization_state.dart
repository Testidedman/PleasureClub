part of 'authorization_cubit.dart';

class AuthorizationState {
  AuthorizationState({
    this.obscureText = true,
    this.isOnTap = false,
    this.sufColor = const Color(0xffD4D4D4),
    this.isLoading = false,
    this.authorizationError = AuthorizationError.none
  });

  final bool obscureText;
  final bool isOnTap;
  final Color sufColor;
  final bool isLoading;
  final AuthorizationError authorizationError;

  AuthorizationState copyWith({
    bool? obscureText,
    bool? isOnTap,
    Color? sufColor,
    bool? isLoading,
    AuthorizationError? authorizationError
  }) {
    return AuthorizationState(
        obscureText: obscureText ?? this.obscureText,
        isOnTap: isOnTap ?? this.isOnTap,
        sufColor: sufColor ?? this.sufColor,
        isLoading: isLoading ?? this.isLoading,
        authorizationError: authorizationError ?? this.authorizationError
    );
  }
}
