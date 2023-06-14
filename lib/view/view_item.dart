import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:remotely_shop/model/remotely_model.dart';
import 'package:remotely_shop/model/remotely_model_data.dart';
import 'package:remotely_shop/res/constant/app_images.dart';
import 'package:remotely_shop/view/home_page.dart';

class ViewItems extends StatefulWidget {
  const ViewItems({Key? key}) : super(key: key);

  @override
  State<ViewItems> createState() => _ViewItemsState();
}

class _ViewItemsState extends State<ViewItems> {
  final PageController pageController = PageController(initialPage: 0);
  RemotelyModelYourCartPage? remotelyModelYourCartPage = RemotelyModelYourCartPage.fromJson(remotelyDataViewItemsChairs);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F7),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(height / 50),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(height / 30),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          },
                          child: Image.asset(
                            "assets/icons/arrow-left.png",
                            height: height / 20,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: EdgeInsets.all(height / 70),
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
                      ],
                    ),
                    CarouselSlider(
                      items: [
                        Padding(
                          padding: EdgeInsets.all(height / 15),
                          child: Image.asset("assets/images/chair_one.png"),
                        ),
                        Image.asset("assets/images/products/brown_chair.png"),
                        Image.asset("assets/images/products/blue_chair.png"),
                      ],
                      options: CarouselOptions(
                        height: 400,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: false,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration: const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.vertical,
                      ),
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
