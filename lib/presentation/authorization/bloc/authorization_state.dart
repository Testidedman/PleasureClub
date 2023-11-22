part of 'authorization_cubit.dart';

class AuthorizationState{
  AuthorizationState({
    required this.loginController,
    required this.passwordController,
    this.obscureText = true,
    this.isOnTap = false,
    this.sufColor = const Color(0xffD4D4D4)
  });

  final TextEditingController loginController;
  final TextEditingController passwordController;
  final bool obscureText;
  final bool isOnTap;
  final Color sufColor;

  AuthorizationState copyWith({
    bool? obscureText,
    bool? isOnTap,
    Color? sufColor
  }) {
    return AuthorizationState(
        obscureText: obscureText ?? this.obscureText,
        isOnTap: isOnTap ?? this.isOnTap,
        loginController: loginController,
        passwordController: passwordController,
        sufColor: sufColor ?? this.sufColor
    );
  }
}