import 'package:flutter/material.dart';

class CustomRatingStars extends StatelessWidget {
  final int count;
  final Color color;

  const CustomRatingStars({
    super.key,
    this.count = 5,
    this.color = Colors.amberAccent,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        count,
        (index) => Icon(Icons.star_border, color: color, size: 13),
      ),
    );
  }
}
