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
  bool liked = false;

  _pressed() {
    setState(() {
      liked = !liked;
    });
  }

  RemotelyModelYourCartPage? remotelyModelYourCartPage = RemotelyModelYourCartPage.fromJson(remotelyDataViewItemsChairs);
  RemotelyModelViewWorkSpaceItem? remotelyModelViewWorkSpaceItem = RemotelyModelViewWorkSpaceItem.fromJson(remotelyDataViewCartWorkSpaceItem);
  RemotelyModelViewItemRelatedItems? remotelyModelViewItemRelatedItems = RemotelyModelViewItemRelatedItems.fromJson(remotelyDataViewItemRelatesItems);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: const Color(0xFFF4F5F7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(height / 50),
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
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height / 100),
                  child: SizedBox(
                    height: height / 10,
                    child: ListView.separated(
                      itemCount: remotelyModelViewWorkSpaceItem!.viewCartWorkSpaceItem!.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => Container(
                        // padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 12),
                        decoration: ShapeDecoration(
                          color: const Color(0xFFF4F5F7),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(height / 50),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: width / 5,
                                decoration: ShapeDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("${remotelyModelViewWorkSpaceItem!.viewCartWorkSpaceItem![index].image}"),
                                    fit: BoxFit.fill,
                                  ),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${remotelyModelViewWorkSpaceItem!.viewCartWorkSpaceItem![index].title}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Avenir',
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "${remotelyModelViewWorkSpaceItem!.viewCartWorkSpaceItem![index].subTitle}",
                                    style: const TextStyle(
                                      color: Color(0xFFA6A798),
                                      fontSize: 12,
                                      fontFamily: 'Avenir',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        width: width / 40,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height / 60),
                Text(
                  'RELATED ITEM',
                  style: TextStyle(
                    color: const Color(0xFF040B14),
                    fontSize: width / 25,
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: height / 3.7,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: remotelyModelViewItemRelatedItems!.viewItemRelatedItem!.length,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(vertical: height / 80),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(width: 0.50, color: Color(0xFFDDDDDA)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: height / 10,
                              width: width / 2.8,
                              decoration: ShapeDecoration(
                                color: const Color(0xFFF4F5F7),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: height / 100),
                                  child: Image.asset(
                                    "${remotelyModelViewItemRelatedItems!.viewItemRelatedItem![index].image}",
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${remotelyModelViewItemRelatedItems!.viewItemRelatedItem![index].title}",
                                  style: TextStyle(
                                    color: Color(0xFF040B14),
                                    fontSize: 16,
                                    fontFamily: 'Avenir',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${remotelyModelViewItemRelatedItems!.viewItemRelatedItem![index].subTitle}",
                                      style: TextStyle(
                                        color: Color(0xFFA6A798),
                                        fontSize: width / 35,
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
                                      "${remotelyModelViewItemRelatedItems!.viewItemRelatedItem![index].rate}",
                                      style: TextStyle(
                                        color: Color(0xFF898A7A),
                                        fontSize: 12,
                                        fontFamily: 'Avenir',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Icon(
                                      Icons.star_outlined,
                                      color: const Color(0xFFF2C94C),
                                      size: height / 50,
                                    ),
                                  ],
                                ),
                                SizedBox(height: height / 80),
                                Text(
                                  "${remotelyModelViewItemRelatedItems!.viewItemRelatedItem![index].price}",
                                  style: TextStyle(
                                    color: Color(0xFFBA5C3D),
                                    fontSize: width / 25,
                                    fontFamily: 'Avenir',
                                    fontWeight: FontWeight.w800,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      width: width / 60,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     SizedBox(
      //       width: width / 1.5,
      //       child: MainButton(
      //         mainOnPress: () {},
      //         textName: 'Add to cart',
      //         textColor: Colors.black,
      //         backgroundColor: Color(0xFFCED55B),
      //       ),
      //     ),
      //     SizedBox(
      //       width: width / 25,
      //     ),
      //     IconButton(
      //       icon: Image.asset(
      //         liked ? AppImages.darkLike : AppImages.lightLike,
      //         // height: height / 40,
      //       ),
      //       onPressed: () => _pressed(),
      //     ),
      //   ],
      // ),
    );
  }
}
