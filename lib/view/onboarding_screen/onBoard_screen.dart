// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:remotely_shop/res/common/app_button/main_button.dart';
import 'package:remotely_shop/res/common/app_button/text_button.dart';
import 'package:remotely_shop/res/constant/app_text.dart';
import 'package:remotely_shop/view/home_page.dart';
import 'package:remotely_shop/view/login_signup_screen/login_screen.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoard_ScreenState();
}

class _OnBoard_ScreenState extends State<OnBoardScreen> {
  void bwoseShop() => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
        (route) => false,
      );

  void textButtonlogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/onboard_photo.png",
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 15, vertical: height / 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: height / 1.60),
                  child: AppText.welcome,
                ),
                SizedBox(height: height / 150),
                AppText.remotely,
                SizedBox(height: height / 500),
                AppText.onboardinfo,
                SizedBox(height: height / 30),
                Container(
                  height: height / 15,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: MainButton(
                      textName: "Bwose Shop",
                      backgroundColor: const Color(0xFFCED55B),
                      mainOnPress: bwoseShop,
                      textColor: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: height / 100),
                Padding(
                  padding: EdgeInsets.only(bottom: height / 25),
                  child: Center(
                    child: TextButtons(
                      textButtonName: "Log in",
                      fontSize: 18,
                      color: const Color(0xFFFFFFFF),
                      textOnPress: textButtonlogin,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
