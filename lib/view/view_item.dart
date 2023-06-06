import 'package:flutter/material.dart';
import 'package:remotely_shop/res/constant/app_images.dart';

class ViewItems extends StatefulWidget {
  const ViewItems({Key? key}) : super(key: key);

  @override
  State<ViewItems> createState() => _ViewItemsState();
}

class _ViewItemsState extends State<ViewItems> {
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFF4F5F7),
      appBar: AppBar(
        backgroundColor: Color(0xFFF4F5F7),
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Image.asset(
          "assets/icons/arrow-left.png",
          height: height / 90,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 30),
            child: Container(
              padding: EdgeInsets.all(height / 90),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: const Color(0xFFDDDDDB),
                ),
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                AppImages.exportIcon,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(height / 50),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: width / 7),
                    Image.asset(
                      "assets/images/chair_one.png",
                      height: height / 2.6,
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Container(
                          height: height / 10,
                          width: width / 5,
                          decoration: BoxDecoration(
                            color: Color(0xFFECEDDE),
                            borderRadius: BorderRadius.circular(
                              height / 60,
                            ),
                            border: Border.all(
                              color: Color(0xFFFFFFFF),
                              width: height / 150,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(height / 200),
                            child: Image.asset(
                              "assets/images/chair_one.png",
                            ),
                          ),
                        ),
                        SizedBox(height: height / 100),
                        Container(
                          height: height / 10,
                          width: width / 5,
                          decoration: BoxDecoration(
                            color: Color(0xFFECEDDE),
                            borderRadius: BorderRadius.circular(
                              height / 60,
                            ),
                            border: Border.all(
                              color: Color(0xFFFFFFFF),
                              width: height / 150,
                            ),
                          ),
                          child: Image.asset(
                            "assets/images/products/brown_chair.png",
                          ),
                        ),
                        SizedBox(height: height / 100),
                        Container(
                          height: height / 10,
                          width: width / 5,
                          decoration: BoxDecoration(
                            color: Color(0xFFECEDDE),
                            borderRadius: BorderRadius.circular(
                              height / 60,
                            ),
                            border: Border.all(
                              color: Color(0xFFFFFFFF),
                              width: height / 150,
                            ),
                          ),
                          child: Image.asset(
                            "assets/images/products/blue_chair.png",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
