import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NumberBlock extends StatefulWidget {
  const NumberBlock({
    required this.image,
    required this.numberOfBlock,
    super.key
  });

  final String image;
  final String numberOfBlock;

  @override
  State<NumberBlock> createState() => _NumberBlockState();
}

class _NumberBlockState extends State<NumberBlock> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16)
          ),
          child: Row(
            children: [
              SvgPicture.asset('images/${widget.image}.svg'),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      widget.numberOfBlock,
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.black
                          )
                      )
                  ),
                  const SizedBox(height: 3),
                  Text(
                      'Пройти до 24.05.2024',
                      style: GoogleFonts.unbounded(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 8,
                              color: Colors.grey
                          )
                      )
                  ),
                ],
              ),
              const Spacer(),
              SvgPicture.asset('images/tick_square.svg')
            ],
          ),
        ),
        const SizedBox(height: 4)
      ],
    );
  }
}
