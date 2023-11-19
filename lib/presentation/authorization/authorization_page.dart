import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bloc/authorization_cubit.dart';

class AuthorizationPage extends StatelessWidget {
  const AuthorizationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {
      FocusScope.of(context).unfocus();
    },
      child: Scaffold(
        backgroundColor: const Color(0xffFDFDFD),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset('images/logo.svg'),
                const SizedBox(height: 104),
                BlocBuilder<AuthorizationCubit, AuthorizationState>(
                  builder: (context, state) {
                    return Center(
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
                          SizedBox(
                            height: 44,
                            child: TextField(
                              onChanged: (value) {
                                // context.read<AuthorizationCubit>().text(
                                //     state.loginController);
                                // print(state.loginController);
                              },
                              controller: state.loginController,
                              style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                      color: Color(0xff070707)
                                  )
                              ),
                              cursorColor: const Color(0xff070707),
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets
                                      .symmetric(
                                      horizontal: 16
                                  ),
                                  hintText: 'Логин',
                                  hintStyle: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          color: Color(0xffC6C6C6)
                                      )
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(16)
                                    ),
                                    borderSide: BorderSide(
                                        color: Color(0xff1B1B1B),
                                        width: 1
                                    ),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(16)
                                    ),
                                    borderSide: BorderSide(
                                        color: Color(0xffD4D4D4),
                                        width: 1
                                    ),
                                  ),
                                  border: InputBorder.none
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 44,
                            child: Focus(onFocusChange: (value) {
                              value
                                  ? context.read<AuthorizationCubit>
                                ().focusedColor(state.sufColor)
                                  : context.read<AuthorizationCubit>
                                ().unFocusedColor(state.sufColor);
                            },
                              child: TextField(
                                onChanged: (value) {},
                                // controller: state.passwordController,
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
                                        context.read<AuthorizationCubit>
                                          ().obscureText(state.obscureText);
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
                                    focusedBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(16)
                                      ),
                                      borderSide: BorderSide(
                                          color: Color(0xff1B1B1B),
                                          width: 1
                                      ),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(16)
                                      ),
                                      borderSide: BorderSide(
                                          color: Color(0xffD4D4D4),
                                          width: 1
                                      ),
                                    ),
                                    border: InputBorder.none
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 32),
                          Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: 56,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: const Color(0xffFF3535)
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
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
