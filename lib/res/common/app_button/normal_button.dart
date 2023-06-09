import 'package:flutter/material.dart';

class NormalButton extends StatelessWidget {
  final String? editText;
  final String? images;
  final void Function() onPressed;
  final double? height;

  const NormalButton({
    Key? key,
    this.editText,
    this.images,
    required this.onPressed,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        foregroundColor: Color(0xFFCED55B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        side: const BorderSide(
          width: 1, // the thickness
          color: Color(0xFFC1C2B8), // the color of the border
        ),
        elevation: 0,
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontStyle: FontStyle.normal,
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              images!,
              width: height,
            ),
            SizedBox(
              width: height,
            ),
            Text(
              editText ?? "",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Avenir",
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
