import 'package:flutter/material.dart';
import 'package:remotely_shop/res/common/app_button/main_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
                    textName: "Verify phone number",
                    backgroundColor: Color(0x91079810),
                  ),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {},
                      child: Text("Edit phone number?"),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
