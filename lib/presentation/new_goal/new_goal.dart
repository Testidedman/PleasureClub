import 'package:f/presentation/new_goal/bloc/goals_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class NewGoal extends StatefulWidget {
  const NewGoal({super.key});

  @override
  State<NewGoal> createState() => _NewGoalState();
}

class _NewGoalState extends State<NewGoal> {

  bool get isCreate => goalController.text.isNotEmpty && descriptionController.text.isNotEmpty;
  double _currentSliderValue = 0;
  TextEditingController goalController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Text priority(String text) {
    return Text(
        text,
        style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 10,
                color: Color(0xff929292)
            )
        )
    );
  }

  Color priorityColor(double value) {
    switch (value) {
      case 0:
        return Colors.grey;
      case 50:
        return Colors.yellow;
      default:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(onTap: () {
          context.pop();
        },
          child: Container(
            width: 30,
            height: 30,
            color: Colors.transparent,
            child: const Icon(
              size: 12,
              Icons.arrow_back_ios_new_rounded,
            ),
          ),
        ),
        title: Text(
            'Новая цель',
            style: GoogleFonts.unbounded(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.black87
                )
            )
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 15, top: 30),
            child: BlocBuilder<GoalsCubit, GoalsState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      onChanged: (value) {
                        setState(() {

                        });
                      },
                      controller: goalController,
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Colors.black
                          )
                      ),
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                          hintText: 'Цели',
                          hintStyle: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  color: Colors.grey
                              )
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            borderSide: BorderSide(color: Colors.grey, width: 1),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            borderSide: BorderSide(color: Colors.grey, width: 1),
                          ),
                          border: InputBorder.none
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      onChanged: (value) {
                        setState(() {

                        });
                      },
                      controller: descriptionController,
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Colors.black
                          )
                      ),
                      maxLines: 8,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(right: 16, left: 16, top: 12),
                          hintText: 'Описание цели',
                          hintStyle: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  color: Colors.grey
                              )
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            borderSide: BorderSide(color: Colors.grey, width: 1),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            borderSide: BorderSide(color: Colors.grey, width: 1),
                          ),
                          border: InputBorder.none
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                        'Приоритет цели',
                        style: GoogleFonts.unbounded(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.black87
                            )
                        )
                    ),
                    SizedBox(
                      height: 40,
                      child: Slider(
                        value: _currentSliderValue,
                        onChanged: (double value) {
                          _currentSliderValue = value;
                          print(_currentSliderValue);
                          setState(() {
                          });
                        },
                        max: 100,
                        divisions: 2,
                        thumbColor: priorityColor(_currentSliderValue),
                        activeColor: priorityColor(_currentSliderValue),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        priority('Не важно'),
                        priority('Нормально'),
                        priority('Важно')
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(onTap: () async {
                      if(isCreate) {
                        await context.read<GoalsCubit>().createGoal(
                            goalController.text,
                            descriptionController.text,
                            _currentSliderValue
                        );
                        if(context.mounted) {
                          context.pop();
                        }
                      }
                      setState(() {

                      });
                    },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: isCreate ? Colors.red : Colors.red.withOpacity(0.5)
                        ),
                        child: Text(
                            'Создать цель',
                            style: GoogleFonts.unbounded(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Color(0xffFFFFFF)
                                )
                            )
                        ),
                      ),
                    ),
                  ],
                );
              },
            )
        ),
      ),
    );
  }
}