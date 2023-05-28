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
  final List validator;
  final List controller;
  const AppTextFormField({Key? key, required this.validator, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    bool _passwordVisible = false;
    return TextFormField(
      // validator: (value) => value!.isValidEmail() ? null : "Please Enter Correct E-mail",

      controller: emailController,
      decoration: InputDecoration(
        hintText: "Eg. jamesburnes@gmail.com",
        focusColor: const Color(0xFFA6A798),
        filled: true,
        // prefixIcon: const Icon(Icons.lock, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.black),
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
