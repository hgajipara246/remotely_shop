import 'package:flutter/material.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(this);
  }
}

extension PasswordValidator on String {
  bool isValidPassword() {
    return RegExp(
      r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)",
    ).hasMatch(this);
  }
}

extension MobileValidator on String {
  bool isValidMobile() {
    return RegExp(
      r'(^(?:[+0]9)?[0-9]{10,12}$)',
    ).hasMatch(this);
  }
}

class AppTextFormField extends StatelessWidget {
  final TextEditingController? controllers;
  final bool? obscuretext;
  final String? hintText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Function? onFieldSunmitted;
  final IconButton? sufixIcon;
  final Widget? prefixIcon;
  final GestureTapCallback? onTap;
  const AppTextFormField({
    Key? key,
    this.validator,
    this.controllers,
    this.hintText,
    this.keyboardType,
    this.onFieldSunmitted,
    this.sufixIcon,
    this.obscuretext,
    this.onTap,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obscuretext ?? false,
      controller: controllers,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        focusColor: const Color(0xFFA6A798),
        suffixIcon: sufixIcon,
        prefixIcon: prefixIcon,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Color(0xFFCED55B)),
        ),
        fillColor: const Color(0xFFF6F6F5),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }
}
