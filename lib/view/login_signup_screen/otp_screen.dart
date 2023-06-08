// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:remotely_shop/res/common/app_button/main_button.dart';
import 'package:remotely_shop/view/home_page.dart';
import 'package:remotely_shop/view/login_signup_screen/phone_number_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  var code = "";

  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(234, 239, 243, 1),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: const Color.fromRGBO(114, 178, 238, 1),
      ),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0x9e6ee383),
              Color(0xFFC3E8CC),
              Color(0xFFE4EFE5),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(height / 30),
            child: Column(
              children: [
                SizedBox(height: height / 25),
                Image.asset(
                  "assets/images/phone_otp.png",
                  height: height / 4,
                ),
                SizedBox(height: height / 30),
                Text(
                  "Phone Verification",
                  style: TextStyle(
                    fontSize: height / 25,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Text(
                  "We need to register your phone before getting started!",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Aveir",
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: height / 30),
                Pinput(
                  showCursor: true,
                  length: 6,
                  onChanged: (value) {
                    code = value;
                    setState(() {});
                    debugPrint("value is ---->  $value");
                  },
                ),
                SizedBox(height: height / 45),
                SizedBox(
                  width: double.infinity,
                  height: height / 15,
                  child: MainButton(
                    mainOnPress: () async {
                      try {
                        debugPrint('code is ---->   $code');
                        PhoneAuthCredential credential = PhoneAuthProvider.credential(
                          verificationId: PhoneNumberScreen.verify,
                          smsCode: code,
                        );
                        await auth.signInWithCredential(credential);
                        {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                              (route) => false);
                        }
                      } catch (value) {
                        debugPrint("Wrong Otp");
                      }
                    },
                    textName: "Verify phone number",
                    backgroundColor: const Color(0x91079810),
                    textColor: Colors.white,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PhoneNumberScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Edit phone number?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: height / 50,
                        fontWeight: FontWeight.bold,
                      ),
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
