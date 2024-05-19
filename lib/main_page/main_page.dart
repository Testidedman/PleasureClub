import 'package:f/main_page/bloc/main_page_cubit.dart';
import 'package:f/widgets/number_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bloc/main_page_state.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  Container block(String text) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50)
        ),
        child: Text(
            text,
            style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 8,
                    color: Colors.black
                )
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MainPageCubit>();
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Привет, Трах-Трахыч',
                        style: GoogleFonts.unbounded(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.black
                            )
                        )
                    ),
                    const SizedBox(height: 1),
                    Text(
                        'Как же я скучал по тебе!!!',
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: Colors.grey
                            )
                        )
                    ),
                    const SizedBox(height: 1),
                  ],
                ),
              ),
              SizedBox(
                height: 85,
                child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        padding: const EdgeInsets.all(2),
                        width: 72,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.only(left: 8, bottom: 8),
                          width: 64,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('images/stories.png'),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.black
                          ),
                          child: Text(
                              'Наши\nновинки',
                              style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 8,
                                      color: Colors.white
                                  )
                              )
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 9),
                child: BlocBuilder<MainPageCubit, MainPageState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                                'Сейчас прохожу урок',
                                style: GoogleFonts.unbounded(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Colors.black
                                    )
                                )
                            ),
                            const SizedBox(width: 10),
                            const Icon(
                                size: 12,
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.black
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(28),
                              image: const DecorationImage(
                                  image: AssetImage('images/fundamental_analysis.png'),
                                  fit: BoxFit.fill
                              )
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  block('5 блоков'),
                                  const SizedBox(width: 4),
                                  block('30 уроков')
                                ],
                              ),
                              const SizedBox(height: 32),
                              Text(
                                  'Фундаментальный\nанализ',
                                  style: GoogleFonts.unbounded(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Colors.white
                                      )
                                  )
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                    '100%',
                                    style: GoogleFonts.montserrat(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12,
                                            color: Colors.white
                                        )
                                    )
                                ),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                height: 4,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(50)
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                    'Цели',
                                    style: GoogleFonts.unbounded(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: Colors.black
                                        )
                                    )
                                ),
                                const SizedBox(width: 3),
                                const Icon(
                                    size: 10,
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.black
                                ),
                              ],
                            ),
                            if(state.isTap)
                              InkWell(onTap: () {
                                bloc.createGoal(state.isTap);
                              },
                                child: Row(
                                  children: [
                                    Text(
                                        'Создать цель',
                                        style: GoogleFonts.montserrat(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 10,
                                                color: Colors.red
                                            )
                                        )
                                    ),
                                    const SizedBox(width: 3),
                                    const Icon(
                                        size: 10,
                                        Icons.add,
                                        color: Colors.red
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        if (state.isTap)
                          const Column(
                            children: [
                              NumberBlock(
                                  image: 'red_indicator',
                                  numberOfBlock: 'Первый блок'
                              ),
                              NumberBlock(
                                  image: 'yellow_indicator',
                                  numberOfBlock: 'Второй блок'
                              ),
                              NumberBlock(
                                  image: 'white_indicator',
                                  numberOfBlock: 'Третий блок'
                              ),
                            ],
                          ),
                        if(!state.isTap)
                          InkWell(onTap: () {
                            context.push('/new_goal');
                          },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.white
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      'Создать цель',
                                      style: GoogleFonts.montserrat(
                                          textStyle: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10,
                                              color: Colors.red
                                          )
                                      )
                                  ),
                                  const SizedBox(width: 3),
                                  const Icon(
                                      size: 10,
                                      Icons.add,
                                      color: Colors.red
                                  ),
                                ],
                              ),
                            ),
                          )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}