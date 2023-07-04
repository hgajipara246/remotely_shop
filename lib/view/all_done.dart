import 'package:flutter/material.dart';
import 'package:remotely_shop/res/common/app_button/main_button.dart';

class AllDone extends StatefulWidget {
  const AllDone({super.key});

  @override
  State<AllDone> createState() => _AllDoneState();
}

class _AllDoneState extends State<AllDone> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: width / 25),
        child: SizedBox(
          width: double.infinity,
          child: MainButton(
            textName: "Go to Orders",
            textColor: Colors.black,
            mainOnPress: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AllDone(),
              ),
            ),
            backgroundColor: const Color(0xFFCED55B),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  'All Done!',
                  style: TextStyle(
                    color: Color(0xFF040B14),
                    fontSize: 21,
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(height: height / 7),
              Image.asset("assets/images/done.png"),
            ],
          ),
        ),
      ),
    );
  }
}
