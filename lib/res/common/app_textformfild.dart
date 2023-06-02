import 'package:flutter/material.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(this);
  }
}

extension PasswordValidator on String {
  bool isValidPassword() {
    return RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)").hasMatch(this);
  }
}

extension MobileValidator on String {
  bool isValidMobile() {
    return RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(this);
  }
}

class AppTextFormField extends StatelessWidget {
  final TextEditingController? controllers;
  final String? hintText;
  final TextInputType? keyboardType;
  final Function? validator;
  final FocusNode? focusNode;
  final Function? onFieldSunmitted;
  final IconButton? sufixIcon;
  const AppTextFormField({
    Key? key,
    this.validator,
    this.controllers,
    this.hintText,
    this.keyboardType,
    this.focusNode,
    this.onFieldSunmitted,
    this.sufixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // validator: (value) => value!.isValidEmail() ? null : "Please Enter Correct E-mail",
      // validator: (value) => validator!(value!),
      controller: controllers,
      keyboardType: keyboardType,
      focusNode: focusNode,
      decoration: InputDecoration(
        hintText: hintText,
        focusColor: const Color(0xFFA6A798),
        suffixIcon: sufixIcon,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Color(0xFFCED55B)),
        ),
        errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        fillColor: const Color(0xFFF6F6F5),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }
}
