import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({
    this.height, required
    this.width, super.key
  });

  final double? height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white,
        child: Container(
          height: height,
          width: width,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black
          ),
        )
    );
  }
}
