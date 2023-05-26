import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final textName;
  const MainButton({Key? key, this.textName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFCED55B),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onPressed: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height / 55),
        child: Text(
          textName ?? "",
          style: TextStyle(
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
