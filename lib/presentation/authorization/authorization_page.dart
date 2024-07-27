import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'authorization_error.dart';
import 'bloc/authorization_cubit.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({super.key});

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  OutlineInputBorder outlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(color: color, width: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthorizationCubit>();
    return GestureDetector(onTap: () {
      FocusScope.of(context).unfocus();
    },
      child: Scaffold(
        backgroundColor: const Color(0xffFDFDFD),
        body: BlocBuilder<AuthorizationCubit, AuthorizationState>(
          buildWhen: (previous, current) {
            return previous.isLoading != current.isLoading;
          },
          builder: (_, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset('images/logo.svg'),
                      const SizedBox(height: 104),
                      Center(
                        child: Column(
                          children: [
                            Text(
                                'Авторизация',
                                style: GoogleFonts.unbounded(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 24,
                                        color: Color(0xff151515)
                                    )
                                )
                            ),
                            const SizedBox(height: 30),
                            BlocBuilder<AuthorizationCubit, AuthorizationState>(
                              buildWhen: (previous, current) {
                                return previous.authorizationError !=
                                    current.authorizationError;
                              },
                              builder: (context, state) {
                                return Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      switch (state.authorizationError) {
                                        AuthorizationError.userAlreadyExists => 'Пользователь уже существует',
                                        AuthorizationError.invalidLoginCredentials => 'Пароль или логин введен неверно',
                                        AuthorizationError.none => '',
                                      },
                                      style: GoogleFonts.montserrat(
                                          textStyle: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10,
                                              color: Color(0xffE70000)
                                          )
                                      )
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                                height: 44,
                                child: TextField(onChanged: (value) {
                                  bloc.checkOnTap(
                                    _passwordController.text,
                                    _loginController.text,
                                  );
                                  // print(state.loginController.text);
                                },
                                  controller: _loginController,
                                  style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                          color: Color(0xff070707)
                                      )
                                  ),
                                  cursorColor: const Color(0xff070707),
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                                      hintText: 'Логин',
                                      hintStyle: GoogleFonts.montserrat(
                                          textStyle: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              color: Color(0xffC6C6C6)
                                          )
                                      ),
                                      focusedBorder: outlineInputBorder(const Color(0xff1B1B1B)),
                                      enabledBorder: outlineInputBorder(
                                          state.authorizationError == AuthorizationError.none
                                              ? const Color(0xffD4D4D4)
                                              : const Color(0xffE70000)
                                      ),
                                      border: InputBorder.none
                                  ),
                                )
                            ),
                            const SizedBox(height: 8),
                            BlocBuilder<AuthorizationCubit, AuthorizationState>(
                              buildWhen: (previous, current) {
                                return previous.sufColor != current.sufColor ||
                                    previous.obscureText != current.obscureText ||
                                    previous.authorizationError != current.authorizationError;
                              },
                              builder: (context, state) {
                                return SizedBox(
                                  height: 44,
                                  child: Focus(onFocusChange: (value) {value
                                      ? bloc.focusedColor(state.sufColor)
                                      : bloc.unFocusedColor(state.sufColor);
                                  },
                                    child: TextField(
                                      onChanged: (value) {
                                        bloc.checkOnTap(
                                          _passwordController.text,
                                          _loginController.text,
                                        );
                                        //print(state.passwordController.text);
                                      },
                                      controller: _passwordController,
                                      obscureText: state.obscureText,
                                      style: GoogleFonts.montserrat(
                                          textStyle: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13,
                                              color: Color(0xff070707)
                                          )
                                      ),
                                      cursorColor: const Color(0xff070707),
                                      decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                                          suffixIcon: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 8),
                                            child: GestureDetector(onTap: () {
                                              bloc.obscureText(state.obscureText);
                                            },
                                                child: SvgPicture.asset(
                                                  state.obscureText
                                                      ? 'images/eye.svg'
                                                      : 'images/eye_slash.svg',
                                                  color: state.sufColor,
                                                )
                                            ),
                                          ),
                                          hintText: 'Пароль',
                                          hintStyle: GoogleFonts.montserrat(
                                              textStyle: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13,
                                                  color: Color(0xffC6C6C6)
                                              )
                                          ),
                                          focusedBorder: outlineInputBorder(const Color(0xff1B1B1B)),
                                          enabledBorder: outlineInputBorder(
                                              state.authorizationError == AuthorizationError.none
                                                  ? const Color(0xffD4D4D4)
                                                  : const Color(0xffE70000)
                                          ),
                                          border: InputBorder.none
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 32),
                            BlocBuilder<AuthorizationCubit, AuthorizationState>(
                              buildWhen: (previous, current) {
                                return previous.isOnTap != current.isOnTap;
                              },
                              builder: (_, state) {
                                return GestureDetector(onTap: () async {
                                  if (state.isOnTap) {
                                    final bool value = await bloc.authorization(
                                      _loginController.text,
                                      _passwordController.text,
                                    );
                                    if (value) {
                                      context.go('/home');
                                    }
                                  }
                                },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    height: 56,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: const Color(0xffFF3535).withOpacity(state.isOnTap ? 1 : 0.3)
                                    ),
                                    child: Text(
                                        'Войти',
                                        style: GoogleFonts.unbounded(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color: Color(0xffFFFFFF)
                                            )
                                        )
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 8),
                            RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Проблемы с авторизацией? ',
                                        style: GoogleFonts.montserrat(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: Color(0xff232323)
                                            )
                                        )
                                    ),
                                    TextSpan(
                                        text: 'Пиши сюда',
                                        style: GoogleFonts.montserrat(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                                color: Color(0xff232323)
                                            )
                                        )
                                    ),
                                  ],
                                )
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
