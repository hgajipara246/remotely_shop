import 'package:flutter/material.dart';

class TextButtons extends StatelessWidget {
  final textButtonName;
  final Color color;
  final void Function()? onPress;
  const TextButtons({
    Key? key,
    this.textButtonName,
    this.onPress,
    required this.color,
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
      onPressed: () {},
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
