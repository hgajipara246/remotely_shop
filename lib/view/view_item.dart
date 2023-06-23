import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:remotely_shop/model/remotely_model.dart';
import 'package:remotely_shop/model/remotely_model_data.dart';
import 'package:remotely_shop/res/constant/app_images.dart';

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(height / 30),
                      onTap: () {
                        Navigator.pop(context);
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
                Stack(
                  children: [
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
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hughlan Ergonomic \nAdjustable Office Chair',
                          style: TextStyle(
                            color: Color(0xFF040B14),
                            fontSize: 21,
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.w900,
                          ),
                          overflow: TextOverflow.visible,
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Hughlan Workspaces',
                              style: TextStyle(
                                color: const Color(0xFFA6A798),
                                fontSize: height / 55,
                                fontFamily: 'Avenir',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: width / 75),
                            Icon(
                              Icons.circle,
                              color: const Color(0xFFA6A798),
                              size: height / 110,
                            ),
                            SizedBox(width: width / 75),
                            Text(
                              '4.8',
                              style: TextStyle(
                                color: const Color(0xFF1B3D2F),
                                fontSize: height / 55,
                                fontFamily: 'Avenir',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Icon(
                              Icons.star_outlined,
                              color: const Color(0xFFF2C94C),
                              size: height / 50,
                            ),
                            Icon(
                              Icons.star_outlined,
                              color: const Color(0xFFF2C94C),
                              size: height / 50,
                            ),
                            Icon(
                              Icons.star_outlined,
                              color: const Color(0xFFF2C94C),
                              size: height / 50,
                            ),
                            Icon(
                              Icons.star_outlined,
                              color: const Color(0xFFF2C94C),
                              size: height / 50,
                            ),
                            Icon(
                              Icons.star_outlined,
                              color: const Color(0xFFF2C94C),
                              size: height / 50,
                            ),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: width / 40,
                        vertical: height / 70,
                      ),
                      decoration: const BoxDecoration(color: Color(0xFFF5FAF8)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: width / 60,
                          vertical: height / 90,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              '\$113',
                              style: TextStyle(
                                color: Color(0xFF1B3D2F),
                                fontSize: 21,
                                fontFamily: 'Avenir',
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(height: height / 210),
                            const Text(
                              '7% off',
                              style: TextStyle(
                                color: Color(0xFF1B3D2F),
                                fontSize: 15,
                                fontFamily: 'Avenir',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height / 40),
                Text(
                  'Hughlan ergonomic chair adopts an ergonomic design.This ergonomic desk chair can help you ease fatigue, reduce occupational disesase and let you develop good sitting posture habits',
                  style: TextStyle(
                    color: const Color(0xFF040B14),
                    fontSize: width / 25,
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: height / 30),
                Text(
                  'WORKSPACES ITEM CAN BE USED',
                  style: TextStyle(
                    color: const Color(0xFF040B14),
                    fontSize: width / 24,
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.w900,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
