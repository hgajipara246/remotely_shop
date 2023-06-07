import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final textName;
  final Color backgroundColor;
  final VoidCallback mainOnPress;
  const MainButton({
    Key? key,
    this.textName,
    required this.mainOnPress,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onPressed: mainOnPress,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height / 55),
        child: Text(
          textName ?? "",
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: "Inter",
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
