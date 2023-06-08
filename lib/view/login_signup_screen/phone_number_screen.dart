import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remotely_shop/res/common/app_button/main_button.dart';
import 'package:remotely_shop/view/login_signup_screen/otp_screen.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  static String verify = "";
  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  TextEditingController countryCode = TextEditingController();
  var phone = "";

  @override
  void initState() {
    // TODO: implement initState
    countryCode.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                SizedBox(height: height / 7),
                Image.asset(
                  "assets/images/phone_numbers.png",
                  height: height / 4,
                ),
                SizedBox(height: height / 20),
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
                Container(
                  height: height / 14,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: const Color(0x91079810),
                      ),
                      borderRadius: BorderRadius.circular(height / 100)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width / 30,
                      ),
                      SizedBox(
                        width: width / 10,
                        child: TextField(
                          controller: countryCode,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Text(
                        "|",
                        style: TextStyle(
                          color: CupertinoColors.inactiveGray,
                          fontSize: height / 25,
                        ),
                      ),
                      SizedBox(
                        width: width / 55,
                      ),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          onChanged: (value) {
                            phone = value;
                          },
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Phone Number",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height / 45),
                SizedBox(
                  width: double.infinity,
                  height: height / 15,
                  child: MainButton(
                    mainOnPress: () async {
                      await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: " ${countryCode.text + phone}",
                        verificationCompleted: (
                          PhoneAuthCredential credential,
                        ) {},
                        verificationFailed: (FirebaseAuthException e) {},
                        codeSent: (String verificationId, int? resendToken) {
                          PhoneNumberScreen.verify = verificationId;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OtpScreen(),
                            ),
                          );
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {},
                      );
                    },
                    textName: "Sent the code",
                    backgroundColor: const Color(0x91079810),
                    textColor: Colors.white,
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
