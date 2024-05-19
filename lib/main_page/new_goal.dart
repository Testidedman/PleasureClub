import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class NewGoal extends StatelessWidget {
  const NewGoal({super.key});

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
  Container priorityPoint({double? width, double? height}) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xff49454F)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 8, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(onTap: () {
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
                  Text(
                      'Новая цель',
                      style: GoogleFonts.unbounded(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.black87
                          )
                      )
                  ),
                  const SizedBox(width: 30)
                ],
              ),
              const SizedBox(height: 35),
              TextField(
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
                    hintText: 'Логин',
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
              const SizedBox(height: 8),
              Container(
                height: 4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: const Color(0xffE6E0E9)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    priorityPoint(width: 4, height: 4),
                    priorityPoint(width: 4, height: 4),
                    priorityPoint(width: 4, height: 4)
                  ],
                ),
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  priority('Не важно'),
                  priority('Нормально'),
                  priority('Важно')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
