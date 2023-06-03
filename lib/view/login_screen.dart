import 'package:firebase_auth/firebase_auth.dart';
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
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User? user;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool password = true;

  void loginButton() {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => const HomePage()),
    // );
    loginUser();
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
    // double width = MediaQuery.of(context).size.width;
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
                  SizedBox(height: height / 15),
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
                    validator: (value) => value!.isValidEmail() ? null : "Please Enter Correct E-mail",
                    hintText: "Eg. jamesburnes@gmail.com",
                    controllers: emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: height / 60,
                  ),
                  AppText.password,
                  AppTextFormField(
                    validator: (value) => value!.isValidPassword() ? null : "Please Enter Correct Password",
                    controllers: passwordController,
                    hintText: "Password",
                    obscuretext: password,
                    sufixIcon: IconButton(
                      icon: password
                          ? const Icon(
                              Icons.visibility_off,
                              color: Colors.black,
                            )
                          : const Icon(
                              Icons.visibility,
                              color: Colors.black,
                            ),
                      onPressed: () {
                        password = !password;
                        setState(
                          () {},
                        );
                      },
                    ),
                  ),
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
                        color: const Color(0xFF8A8B7A),
                        textonpress: () {},
                      ),
                      TextButtons(
                        textButtonName: "Sign Up",
                        color: const Color(0xFFBA5C3D),
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

  loginUser() async {
    try {
      await firebaseAuth
          .signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      )
          .then((value) {
        debugPrint("value ----> ${value.user}");
        user = value.user;

        if (user!.emailVerified) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.white,
              elevation: 0,
              content: Text(
                "Login Succsesfull",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Avenir",
                ),
              ),
            ),
          );
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
              (route) => false);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.white,
              elevation: 0,
              content: Text(
                "Please Verify Your Email",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Avenir",
                ),
              ),
            ),
          );
          debugPrint("Please Verify your Email");
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint("wrong password provided for that user.");
      }
    }
  }
}
