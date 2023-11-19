part of 'authorization_cubit.dart';

class AuthorizationState{
  AuthorizationState({
    this.obscureText = true,
    this.loginController,
    this.passwordController,
    this.isFocused = false
  });

  final TextEditingController? loginController;
  final TextEditingController? passwordController;
  final bool obscureText;
  final bool isFocused;

  AuthorizationState copyWith({
    TextEditingController? loginController,
    TextEditingController? passwordController,
    bool? obscureText,
    bool? isFocused
  }) {
    return AuthorizationState(
        obscureText: obscureText ?? this.obscureText,
        loginController: loginController ?? this.loginController,
        passwordController: passwordController ?? this.passwordController,
        isFocused: isFocused ?? this.isFocused
    );
  }

}