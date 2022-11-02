import 'package:flutter/material.dart';

import '../../utils/style/colors.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final String labelText;

  const CustomInputField({
    Key? key,
    required this.hintText,
    required this.textEditingController,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: TextField(
        controller: textEditingController,
        obscureText: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: labelText,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 16,
            fontFamily: 'SF Pro Display',
            color: hintTextColor
          )
        ),
      ),
    );
  }
}
