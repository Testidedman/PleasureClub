part of 'authorization_cubit.dart';

class AuthorizationState{
  AuthorizationState({
    this.loginController,
    this.passwordController,
    this.obscureText = true,
    this.sufColor = const Color(0xffD4D4D4)
  });

  final TextEditingController? loginController;
  final TextEditingController? passwordController;
  final bool obscureText;
  final Color sufColor;

  AuthorizationState copyWith({
    TextEditingController? loginController,
    TextEditingController? passwordController,
    bool? obscureText,
    Color? sufColor
  }) {
    return AuthorizationState(
        obscureText: obscureText ?? this.obscureText,
        loginController: loginController ?? this.loginController,
        passwordController: passwordController ?? this.passwordController,
        sufColor: sufColor ?? this.sufColor
    );
  }

}