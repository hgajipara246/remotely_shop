import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:remotely_shop/res/common/app_button/main_button.dart';
import 'package:remotely_shop/res/common/app_button/normal_button.dart';
import 'package:remotely_shop/res/common/app_button/text_button.dart';
import 'package:remotely_shop/res/common/app_textformfild.dart';
import 'package:remotely_shop/res/constant/app_text.dart';
import 'package:remotely_shop/view/login_screen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User? user;

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool password = false;

  void signUpMainButton() {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => const HomePage()),
    //
    creatUser();
    debugPrint("User ------->> $user");
  }

  void loginTextButton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
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
                  SizedBox(height: height / 50),
                  AppText.Hello,
                  RichText(
                    text: const TextSpan(
                      text: "Welcome To ",
                      style: TextStyle(
                        fontFamily: "Avenir",
                        fontWeight: FontWeight.w900,
                        fontSize: 22,
                        color: Color(0xFF040B14),
                      ),
                      children: [
                        TextSpan(
                          text: "Remotely.io",
                          style: TextStyle(
                            fontFamily: "Avenir",
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                            color: Color(0xFFCED55B),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  const NormalButton(
                    images: "assets/icons/google_logo.png",
                    editText: "Sign Up with Google",
                  ),
                  SizedBox(
                    height: height / 50,
                  ),
                  const NormalButton(
                    images: "assets/icons/facebook_logo.png",
                    editText: "Sign Up with facebook",
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  Center(child: AppText.or),
                  SizedBox(
                    height: height / 40,
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
                  AppText.phoneNumber,
                  AppTextFormField(
                    validator: (value) => value!.isValidMobile() ? null : "Please Enter Correct Phone Number",
                    hintText: "00000 00000",
                    controllers: phoneNumberController,
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(
                    height: height / 60,
                  ),
                  AppText.password,
                  AppTextFormField(
                    validator: (value) => value!.isValidPassword() ? null : "Please Enter Correct Password",
                    keyboardType: TextInputType.visiblePassword,
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
                    height: height / 25,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: MainButton(
                      textName: "Sign Up",
                      mainOnPress: signUpMainButton,
                    ),
                  ),
                  SizedBox(
                    height: height / 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButtons(
                        textButtonName: "Don't have an account?",
                        color: const Color(0xbd8a8b7a),
                        textonpress: () {},
                      ),
                      TextButtons(
                        textButtonName: "Login",
                        color: const Color(0xFFBA5C3D),
                        textonpress: loginTextButton,
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

  creatUser() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      )
          .then((value) {
        debugPrint("Value --> ${value.user}");
        user = value.user;
        user!.sendEmailVerification();
        Navigator.pop(context);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      } else if (e.code == 'strong-password') {
        debugPrint('The Password provided is fully strong');
      }
    } catch (e) {
      debugPrint("Error --->  $e");
    }
  }
}
