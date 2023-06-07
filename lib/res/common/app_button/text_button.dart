// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class TextButtons extends StatelessWidget {
  final textButtonName;
  final Color? color;
  final double? fontSize;
  final void Function() textOnPress;
  const TextButtons({
    Key? key,
    this.textButtonName,
    required this.color,
    required this.textOnPress,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: const Color(0xFFFFFFFF),
        textStyle: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      onPressed: textOnPress,
      // onPressed: onPress,
      child: Text(
        textButtonName ?? "",
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontFamily: "Inter",
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
