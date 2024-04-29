import 'package:f/presentation/home/bloc/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                GestureDetector(
                  onTap: () {
                    context.read<HomeCubit>().changeIndex(0);
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset(
                          'images/house.svg',
                        color: state.index == 0 ? Color(0xff151515) : Colors.grey,
                      ),
                      Text(
                          'Главная',
                          style: GoogleFonts.unbounded(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  color: state.index == 0 ? Color(0xff151515) : Colors.grey
                              )
                          )
                      )
                    ],
                  ),
                ),
                GestureDetector(onTap: () {
                  context.read<HomeCubit>().changeIndex(1);
                },
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'images/book.svg',
                      color: state.index == 1 ? Color(0xff151515) : Colors.grey,
                      ),
                      Text(
                          'Обучение',
                          style: GoogleFonts.unbounded(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  color: state.index == 1 ? Color(0xff151515) : Colors.grey
                              )
                          )
                      )
                    ],
                  ),
                ),
                 GestureDetector(onTap: () {
                   context.read<HomeCubit>().changeIndex(2);
                 },
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'images/gps.svg',
                        color: state.index == 2 ? Color(0xff151515) : Colors.grey,
                      ),
                      Text(
                          'Стратегии',
                          style: GoogleFonts.unbounded(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  color: state.index == 2 ? Color(0xff151515) : Colors.grey
                              )
                          )
                      )
                    ],
                  ),
                ),
                GestureDetector(onTap: () {
                  context.read<HomeCubit>().changeIndex(3);
                },
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'images/teacher.svg',
                        color: state.index == 3 ? Color(0xff151515) : Colors.grey,
                      ),
                      Text(
                          'Тренажеры',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: state.index == 3 ? Color(0xff151515) : Colors.grey
                          )
                      )
                    ],
                  ),
                ),
                const SizedBox()
              ],
            ),
          );
        },
      ),
    );
  }
}
