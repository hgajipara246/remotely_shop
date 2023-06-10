import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:remotely_shop/model/remotely_model.dart';
import 'package:remotely_shop/model/remotely_model_data.dart';
import 'package:remotely_shop/res/constant/app_images.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ViewItems extends StatefulWidget {
  const ViewItems({Key? key}) : super(key: key);

  @override
  State<ViewItems> createState() => _ViewItemsState();
}

RemotelyModelViewItemsChairs? remotelyModelViewItemsChairs = RemotelyModelViewItemsChairs.fromJson(remotelyDataViewItemsChairs);

class _ViewItemsState extends State<ViewItems> {
  final PageController pageController = PageController(initialPage: 0);

  // list of images
  List chairs = [
    Image.asset(' "assets/images/chair_one.png",'),
    Image.asset('assets/images/products/brown_chair.png'),
    Image.asset('assets/images/products/blue_chair.png'),
  ];

  List imgList = [
    "assets/images/chair_one.png",
    'assets/images/products/brown_chair.png',
    'assets/images/products/blue_chair.png',
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F5F7),
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
                Stack(
                  children: [
                    CarouselSlider(
                      items: [
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Image.asset("assets/images/chair_one.png"),
                        ),
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Image.asset("assets/images/products/brown_chair.png"),
                        ),
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Image.asset("assets/images/products/blue_chair.png"),
                        ),
                      ],
                      options: CarouselOptions(),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 50,
                      child: SmoothPageIndicator(
                          controller: pageController, // PageController
                          count: 6,
                          effect: WormEffect(), // your preferred effect
                          onDotClicked: (index) {}),
                    )
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
