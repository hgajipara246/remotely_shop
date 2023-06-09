// ignore_for_file: prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:github_sign_in/github_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:remotely_shop/res/common/app_button/main_button.dart';
import 'package:remotely_shop/res/common/app_button/normal_button.dart';
import 'package:remotely_shop/res/common/app_button/text_button.dart';
import 'package:remotely_shop/res/common/app_textformfild.dart';
import 'package:remotely_shop/view/home_page.dart';
import 'package:remotely_shop/view/login_signup_screen/phone_number_screen.dart';
import 'package:remotely_shop/view/login_signup_screen/signup_page.dart';

import '../../res/constant/app_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  UserCredential? userCredential;

  User? user;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool password = true;

  void loginButton() {
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
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
            child: Padding(
              padding: EdgeInsets.all(height / 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height / 15),
                  AppText.Hello,
                  AppText.welcomeBack,
                  SizedBox(
                    height: height / 30,
                  ),
                  NormalButton(
                    images: "assets/icons/google_logo.png",
                    editText: "Login with Google",
                    height: 30,
                    onPressed: () async {
                      debugPrint("userdata =$user");

                      userCredential = await signInWithGoogle();
                      user = userCredential!.user;
                      debugPrint("userdata =$user");

                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                        (route) => false,
                      );
                    },
                  ),
                  SizedBox(
                    height: height / 50,
                  ),
                  NormalButton(
                    images: "assets/images/github.png",
                    height: 30,
                    editText: "Login with github",
                    onPressed: () {},
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
                      backgroundColor: const Color(0xFFCED55B),
                      textColor: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: height / 150,
                  ),
                  Center(
                    child: TextButtons(
                      textButtonName: "Login with Mobile",
                      color: const Color(0xFF8A8B7A),
                      fontSize: height / 50,
                      textOnPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PhoneNumberScreen(),
                            ));
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButtons(
                        textButtonName: "Forgot password?",
                        fontSize: 18,
                        color: const Color(0xFF8A8B7A),
                        textOnPress: () {},
                      ),
                      TextButtons(
                        textButtonName: "Sign Up",
                        fontSize: 18,
                        color: const Color(0xFFBA5C3D),
                        textOnPress: signUpTextButton,
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

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    debugPrint("googleUser----->$googleUser");

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithGitHub() async {
    // Create a GitHubSignIn instance
    final GitHubSignIn gitHubSignIn = GitHubSignIn(
      clientId: "a9df22eeaceb96806120",
      clientSecret: "c6c127e2b2b242b19c43100d8c40bca722800a63",
      redirectUrl: 'https://my-project.firebaseapp.com/__/auth/handler',
    );
    debugPrint("github Signin ------------------->>>   $GitHubSignIn");

    // Trigger the sign-in flow
    final result = await gitHubSignIn.signIn(context);

    // Create a credential from the access token
    final githubAuthCredential = GithubAuthProvider.credential(result.token!);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(githubAuthCredential);
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
