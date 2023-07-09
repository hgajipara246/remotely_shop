import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:remotely_shop/view/home_page.dart';
import 'package:remotely_shop/view/onboarding_screen/onBoard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      if (FirebaseAuth.instance.currentUser != null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
          (route) => false,
        );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const OnBoardScreen(),
          ),
          (route) => false,
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFB6EE9B),
              Color(0xFFCBF1BB),
              Color(0xFFC2EFAB),
              Color(0xFFC2EFAB),
              Color(0xFFCAF1BA),
              Color(0xFFC2EFAB),
              Color(0xFFCBF1BB),
              Color(0xFFB6EE9B),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icons/shopping-card.png",
                height: 120,
              ),
              const SizedBox(height: 5),
              AnimatedTextKit(
                isRepeatingAnimation: false,
                animatedTexts: [
                  TyperAnimatedText(
                    "Remotely.io",
                    textStyle: const TextStyle(
                      fontSize: 40,
                      fontFamily: "Acme",
                      color: Color(0xFF000000),
                    ),
                  ),
                ],
                onTap: () {
                  debugPrint("I am executing");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
