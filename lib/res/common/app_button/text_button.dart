import 'package:flutter/material.dart';

class TextButtons extends StatelessWidget {
  final textButtonName;
  final Color color;
  final VoidCallback textonpress;
  const TextButtons({
    Key? key,
    this.textButtonName,
    required this.color,
    required this.textonpress,
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
      onPressed: textonpress,
      // onPressed: onPress,
      child: Text(
        textButtonName ?? "",
        style: TextStyle(
          color: color,
          fontSize: 18,
          fontFamily: "Inter",
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
