import 'package:flutter/material.dart';
import 'package:remotely_shop/res/common/app_button/main_button.dart';
import 'package:remotely_shop/res/common/app_button/normal_button.dart';
import 'package:remotely_shop/res/common/app_button/text_button.dart';
import 'package:remotely_shop/res/common/app_textformfild.dart';
import 'package:remotely_shop/view/home_page.dart';
import 'package:remotely_shop/view/signup_page.dart';

import '../res/constant/app_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  void loginButton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  void signUpTextButton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(height / 40),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height / 9),
                  AppText.Hello,
                  AppText.welcomeback,
                  SizedBox(
                    height: height / 30,
                  ),
                  const NormalButton(
                    images: "assets/icons/google_logo.png",
                    editText: "Login with Google",
                  ),
                  SizedBox(
                    height: height / 50,
                  ),
                  const NormalButton(
                    images: "assets/icons/facebook_logo.png",
                    editText: "Login with facebook",
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  Center(child: AppText.or),
                  SizedBox(
                    height: height / 30,
                  ),
                  AppText.email,
                  AppTextFormField(
                    // validator: (value) => value!.isValidPassword() ? null : "Please Enter Correct E-mail",
                    hintText: "Eg. jamesburnes@gmail.com",
                    controllers: emailController,
                    // keyboardType: TextInputType.emailAddress,
                  ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(vertical: height / 200),
                  //   child: TextFormField(
                  //     validator: (value) => value!.isValidEmail() ? null : "Please Enter Correct E-mail",
                  //     controller: emailController,
                  //     decoration: InputDecoration(
                  //       hintText: "Eg. jamesburnes@gmail.com",
                  //       focusColor: const Color(0xFFA6A798),
                  //       filled: true,
                  //       // prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(5),
                  //         borderSide: const BorderSide(color: Colors.transparent),
                  //       ),
                  //       focusedBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(5),
                  //         borderSide: const BorderSide(color: Colors.black),
                  //       ),
                  //       fillColor: const Color(0xFFF6F6F5),
                  //       enabledBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(5),
                  //         borderSide: const BorderSide(color: Colors.transparent),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: height / 60,
                  ),
                  AppText.password,

                  AppTextFormField(
                    controllers: passwordController,
                    hintText: "Password",
                    sufixIcon: IconButton(
                      style: const ButtonStyle(),
                      icon: Icon(
                        _passwordVisible ? Icons.visibility : Icons.visibility_off,
                        color: Theme.of(context).hintColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(vertical: height / 200),
                  //   child: TextFormField(
                  //     validator: (value) => value!.isValidPassword() ? null : "Please Enter Correct Password",
                  //     controller: passwordController,
                  //     decoration: InputDecoration(
                  //       hintText: "Password",
                  //       focusColor: Colors.black38,
                  //       filled: true,
                  //       suffixIcon: IconButton(
                  //         style: const ButtonStyle(),
                  //         icon: Icon(
                  //           _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  //           color: Theme.of(context).hintColor,
                  //         ),
                  //         onPressed: () {
                  //           setState(() {
                  //             _passwordVisible = !_passwordVisible;
                  //           });
                  //         },
                  //       ),
                  //       // prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(5),
                  //         borderSide: const BorderSide(color: Colors.transparent),
                  //       ),
                  //       focusedBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(5),
                  //         borderSide: const BorderSide(color: Colors.black),
                  //       ),
                  //       fillColor: const Color(0xFFF6F6F5),
                  //       enabledBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(5),
                  //         borderSide: const BorderSide(color: Colors.transparent),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: height / 35,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: MainButton(
                      textName: "Login",
                      mainOnPress: loginButton,
                    ),
                  ),
                  SizedBox(
                    height: height / 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButtons(
                        textButtonName: "Forgot password?",
                        color: Color(0xFF8A8B7A),
                        textonpress: () {},
                      ),
                      TextButtons(
                        textButtonName: "Sign Up",
                        color: Color(0xFFBA5C3D),
                        textonpress: signUpTextButton,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
