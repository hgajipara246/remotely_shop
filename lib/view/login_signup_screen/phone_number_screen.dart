import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remotely_shop/res/common/app_button/main_button.dart';
import 'package:remotely_shop/view/login_signup_screen/otp_screen.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  TextEditingController countryCode = TextEditingController();

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(height / 30),
            child: Column(
              children: [
                SizedBox(height: height / 9),
                Image.asset(
                  "assets/images/phoneNumber.png",
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
                Container(
                  height: height / 14,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Color(0x91079810),
                      ),
                      borderRadius: BorderRadius.circular(height / 100)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width / 55,
                      ),
                      SizedBox(
                        width: width / 8,
                        child: TextField(
                          controller: countryCode,
                          decoration: InputDecoration(border: InputBorder.none),
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
                          decoration: InputDecoration(border: InputBorder.none, hintText: "Phone Number"),
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
                    mainOnPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpScreen(),
                        ),
                      );
                    },
                    textName: "Sent the code",
                    backgroundColor: Color(0x91079810),
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
