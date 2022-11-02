import 'package:flutter/material.dart';

import '../../utils/style/colors.dart';


class TodoSingleWidget extends StatelessWidget {
  final String title;
  final Function() func;
  final int count;
  final Color color;

  const TodoSingleWidget({
    Key? key,
    required this.title,
    required this.func,
    required this.count,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
        onTap: func,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
          ),
          height: 56,
          width: double.infinity,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                Text(
                  title,
                  style: const TextStyle(
                    color: whiteColor,
                    fontFamily: 'SF Pro Display',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 Text(
                  '$count tasks',
                  style: const TextStyle(
                    color: whiteColor,
                    fontFamily: 'SF Pro Display',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
